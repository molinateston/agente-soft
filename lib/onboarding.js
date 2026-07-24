// onboarding.js · primeira conversa do agente com o dono novo.
//
// Fluxo (24/07/2026 · grupo OPCIONAL, zero comando):
//   1) DM · dono manda a 1ª msg → agente abre com UMA pergunta só sobre o negócio.
//   2) DM · dono responde → agente interpreta o segmento, sugere as salas e apresenta as
//      DUAS formas de trabalhar: seguir na conversa privada (funciona inteiro) ou montar
//      um grupo com as salas separadas. A conversa de boas-vindas FECHA aqui, sempre.
//      O dono nunca mais recebe a mesma instrução repetida.
//   3) O plano de salas fica guardado. Se o dono criar o grupo agora ou daqui a um mês,
//      o gatilho é o Telegram avisando que o bot virou administrador (onGroupReady).
//      Qualquer mensagem num grupo sem salas também dispara (handleGroup).
//   4) Falha na criação tem 2 motivos reais e cada um tem sua instrução: tópicos
//      desligados no grupo, ou bot sem permissão de administrador.
//   5) Depois de criar, aceita ajuste em linguagem natural por 24h ("troca X por Y",
//      "adiciona uma sala de Z", "tira W"), e fecha no "fechou".
//
// Histórico do bug que originou esta versão: até 24/07 o agente exigia o comando
// /prontos, que o próprio bridge era incapaz de ouvir (a regra pulava tudo que começa
// com barra, e a checagem de grupo comparava com um GROUP_CHAT_ID que ainda não existia).
// Cliente real ficou presa em loop. Nunca mais depender de comando digitado.

const fs = require("fs");
const path = require("path");
const https = require("https");

const AGENT_NAME = process.env.AGENT_NAME || "seu novo sócio";
const JANELA_AJUSTE_MS = 24 * 60 * 60 * 1000;
const INTERVALO_AVISO_FALHA_MS = 2 * 60 * 1000;

function statePath(workdir) { return path.join(workdir, ".onboarding-state.json"); }
function donePath(workdir)  { return path.join(workdir, ".onboarding-done"); }
function topicsPath(workdir) { return path.join(workdir, "topics.json"); }

function readState(workdir) {
  try { return JSON.parse(fs.readFileSync(statePath(workdir), "utf8")); }
  catch { return null; }
}
function writeState(workdir, s) {
  try { fs.writeFileSync(statePath(workdir), JSON.stringify(s, null, 2)); } catch {}
}
// Fecha só a CONVERSA de boas-vindas. O plano de salas continua no disco, porque o dono
// pode criar o grupo semanas depois e o agente precisa lembrar o que ia montar.
function markDone(workdir) {
  try { fs.writeFileSync(donePath(workdir), new Date().toISOString()); } catch {}
}
function isDone(workdir) {
  try { return fs.existsSync(donePath(workdir)); } catch { return false; }
}
function reset(workdir) {
  try { fs.unlinkSync(donePath(workdir)); } catch {}
  try { fs.unlinkSync(statePath(workdir)); } catch {}
}

// ---------- heurística de segmento + sugestão de tópicos ----------
function detectSegment(text) {
  const t = (text || "").toLowerCase();
  // ordem importa: mais específico primeiro
  if (/consultor|consultoria|advis|mentor(?!ia digital)/.test(t))
    return { segmento: "consultoria", topicos: ["Clientes", "Propostas", "Financeiro", "Estudos", "Ideias"] };
  if (/agência|agencia|freela|freelanc/.test(t))
    return { segmento: "agência ou freela", topicos: ["Clientes", "Projetos", "Financeiro", "Ideias"] };
  if (/e-?commerce|dropshipp|loja online|shopify|nuvemshop/.test(t))
    return { segmento: "e-commerce", topicos: ["Vendas", "Logística", "Marketing", "Financeiro"] };
  if (/salão|salao|clínica|clinica|barbearia|estética|estetica|restaurante|padaria|oficina|petshop|academia/.test(t))
    return { segmento: "serviço local", topicos: ["Agenda", "Clientes", "Financeiro", "Marketing"] };
  if (/imobili|imóve|imove|corretor|imovel/.test(t))
    return { segmento: "imóveis", topicos: ["Leads", "Imóveis", "Fechamento", "Financeiro", "Ideias"] };
  if (/coach(?!ing digital)|terapeuta|psic[oó]log|nutricionist|fisioterapeut|treinador pessoal|personal/.test(t))
    return { segmento: "profissional de saúde ou coach", topicos: ["Agenda", "Pacientes", "Financeiro", "Conteúdo", "Ideias"] };
  if (/curso|mentoria|infoprodut|treinamento online|lançamento|lancamento|aula|ebook|coach digital/.test(t))
    return { segmento: "infoprodutor", topicos: ["Comercial", "Conteúdo", "Tráfego", "Financeiro", "Ideias"] };
  if (/f[aá]brica|indústria|industria|distribui|atacado|produto físico|produto fisico|manufatur/.test(t))
    return { segmento: "produto físico", topicos: ["Vendas", "Produção", "Estoque", "Financeiro", "Ideias"] };
  // fallback: neutro
  return { segmento: null, topicos: ["Comercial", "Financeiro", "Conteúdo", "Ideias", "Testes"] };
}

// descrição curta de cada tópico (usada no confirm)
function topicHint(nome) {
  const map = {
    "Comercial":   "leads, propostas, negociação",
    "Vendas":      "pipeline, negociação, follow-up",
    "Clientes":    "conversas ativas, atendimento, projetos em curso",
    "Propostas":   "orçamentos, escopos, envios",
    "Projetos":    "andamento, entregas, revisões",
    "Conteúdo":    "posts, roteiros, calendário",
    "Tráfego":     "campanhas, criativos, verba",
    "Marketing":   "campanhas, promoções, presença",
    "Financeiro":  "números, contas, fluxo de caixa",
    "Ideias":      "guardar rascunhos e coisas soltas",
    "Testes":      "brincar sem bagunçar o resto",
    "Estudos":     "aulas, leituras, insights",
    "Agenda":      "compromissos, retornos, lembretes",
    "Logística":   "envios, transporte, rastreamento",
    "Leads":       "captação e triagem",
    "Fechamento":  "negociação e assinatura",
    "Imóveis":     "carteira, visitas, documentos",
    "Pacientes":   "consultas, evolução, retornos",
    "Produção":    "planejamento e execução",
    "Estoque":     "controle e reposição"
  };
  return map[nome] || "";
}

// ---------- copy ----------
function welcomeMsg() {
  return `Oi. Sou o ${AGENT_NAME}. Acabei de instalar aqui e tudo tá funcionando.

Antes de a gente começar, me conta um pouco sobre teu negócio: o que você vende? Como é teu dia a dia?

Pode ser em texto ou áudio, do jeito que vier. Com isso eu já te sugiro uma organização boa aqui dentro.`;
}

function suggestionMsg({ segmento, topicos }) {
  const linhas = topicos.map(n => {
    const h = topicHint(n);
    return h ? `• ${n}: ${h}` : `• ${n}`;
  }).join("\n");
  const abertura = segmento
    ? `Boa. Pelo que entendi, tua rotina é de ${segmento}. Uma organização que funciona bem pra isso:`
    : `Boa. Uma organização que funciona bem pra começar:`;
  return `${abertura}

${linhas}

Agora, duas formas de trabalhar comigo. Escolhe a que preferir:

1. Aqui mesmo, nesta conversa. Funciona inteiro, do mesmo jeito. Nada muda.

2. Num grupo, com essas salas separadas. Cada assunto no seu canto, sem misturar. Se preferir esse, são 3 passos:

a) Toca no lápis de escrever, "Novo grupo", me adiciona e dá o nome que quiser.
b) Dentro do grupo, toca no nome dele lá em cima, "Editar", e liga a chave "Tópicos".
c) Ainda em "Editar", vai em "Administradores", "Adicionar administrador" e me escolhe.

Quando eu virar administrador, eu crio as salas sozinho e te aviso lá dentro. Você não digita nada.

De qualquer forma, já pode me pedir o que quiser. Tô pronto.`;
}

function precisaTopicosMsg() {
  return `Tô aqui, mas ainda não consigo criar as salas: os tópicos deste grupo estão desligados.

Toca no nome do grupo aqui em cima, depois "Editar", e liga a chave "Tópicos".

Feito isso, me manda um "oi" aqui que eu crio tudo na hora.`;
}

function precisaAdminMsg() {
  return `Tô no grupo, mas ainda sem permissão pra criar as salas.

Toca no nome do grupo aqui em cima, "Editar", "Administradores", "Adicionar administrador", e me escolhe.

Assim que virar, eu crio tudo sozinho.`;
}

function confirmMsg(criados, falhas) {
  const list = criados.map(n => `• ${n}`).join("\n");
  let corpo = `Criei essas salas pra gente:\n\n${list}`;
  if (falhas.length) {
    corpo += `\n\nEssas aqui não deram: ${falhas.join(", ")}. Me fala o nome de uma delas que eu tento de novo.`;
  }
  corpo += `\n\nQuer mexer em algum nome ou juntar mais uma sala? Fala normal, tipo:\n"troca Testes por Prospecção"\n"adiciona uma sala de Tráfego"\n"tira Financeiro"\n\nQuando estiver bom, escreve "fechou".`;
  return corpo;
}

function finalMsg() {
  return `Prontinho.

Daqui pra frente cada sala é um tópico do grupo. Eu respondo no tópico onde você me chamar.

Sempre que quiser: /status pra ver como estou · /atualiza pra buscar minha última versão.

Bora rodar.`;
}

// ---------- Telegram API ----------
function tgApi(method, body) {
  const token = process.env.TELEGRAM_BOT_TOKEN;
  if (!token) return Promise.reject(new Error("TELEGRAM_BOT_TOKEN ausente"));
  return new Promise((resolve, reject) => {
    const data = Buffer.from(JSON.stringify(body || {}));
    const req = https.request({
      hostname: "api.telegram.org",
      path: `/bot${token}/${method}`,
      method: "POST",
      headers: { "content-type": "application/json", "content-length": data.length },
      timeout: 15000
    }, (res) => {
      let buf = "";
      res.on("data", (c) => buf += c);
      res.on("end", () => {
        try {
          const j = JSON.parse(buf);
          if (j.ok) resolve(j.result);
          else reject(new Error(j.description || "telegram api error"));
        } catch (e) { reject(e); }
      });
    });
    req.on("error", reject);
    req.on("timeout", () => { req.destroy(new Error("timeout")); });
    req.write(data); req.end();
  });
}

async function createForumTopic(chatId, name) {
  const r = await tgApi("createForumTopic", { chat_id: chatId, name });
  return r.message_thread_id;
}
async function editForumTopic(chatId, threadId, name) {
  await tgApi("editForumTopic", { chat_id: chatId, message_thread_id: threadId, name });
}
async function deleteForumTopic(chatId, threadId) {
  await tgApi("deleteForumTopic", { chat_id: chatId, message_thread_id: threadId });
}

// ---------- topics.json ----------
function readTopics(workdir) {
  try { return JSON.parse(fs.readFileSync(topicsPath(workdir), "utf8")); }
  catch { return {}; }
}
function writeTopics(workdir, t) {
  try { fs.writeFileSync(topicsPath(workdir), JSON.stringify(t, null, 2)); } catch {}
}
function saveTopicEntry(workdir, chatId, threadId, label) {
  const t = readTopics(workdir);
  t[`${chatId}:${threadId}`] = { label };
  writeTopics(workdir, t);
}
function removeTopicEntry(workdir, chatId, threadId) {
  const t = readTopics(workdir);
  delete t[`${chatId}:${threadId}`];
  writeTopics(workdir, t);
}
// Grupo que já tem salas mapeadas foi configurado antes (na mão ou noutra rodada).
// Nesse caso o agente não mexe em nada.
function grupoJaConfigurado(workdir, chatId) {
  const t = readTopics(workdir);
  return Object.keys(t).some(k => k.startsWith(`${chatId}:`));
}

// ---------- parser de ajuste em linguagem natural ----------
function parseAdjustment(text, atuais) {
  const t = (text || "").trim();
  if (!t) return null;
  // conclusão
  if (/^(fechou|pronto|beleza|tá bom|ta bom|tá ótimo|ta otimo|ok|perfeito|show|isso ai|isso aí)\.?$/i.test(t))
    return { tipo: "concluir" };
  // adicionar
  let m = t.match(/^(?:adicion[ae]|coloca|põe|poe|cria|acrescenta)\s+(?:uma?\s+)?(?:sala\s+(?:de\s+|do\s+|da\s+)?|t[oó]pico\s+(?:de\s+|do\s+|da\s+)?)?['"“]?([\wÀ-ú\s\-]+?)['"”]?\s*$/i);
  if (m) return { tipo: "adicionar", nome: cap(m[1]) };
  // trocar/renomear
  m = t.match(/^(?:troca|renomeia|muda)\s+['"“]?([\wÀ-ú\s\-]+?)['"”]?\s+(?:por|para|pra)\s+['"“]?([\wÀ-ú\s\-]+?)['"”]?\s*$/i);
  if (m) return { tipo: "trocar", de: cap(m[1]), para: cap(m[2]) };
  // remover
  m = t.match(/^(?:tira|remove|apaga|deleta|exclui)\s+(?:a\s+sala\s+|o\s+t[oó]pico\s+)?['"“]?([\wÀ-ú\s\-]+?)['"”]?\s*$/i);
  if (m) return { tipo: "remover", nome: cap(m[1]) };
  return null;
}
function cap(s) { return String(s || "").trim().replace(/\s+/g, " ").replace(/^./, c => c.toUpperCase()); }
function findTopicByName(topicos, nome) {
  const target = nome.toLowerCase();
  return topicos.find(x => x.name.toLowerCase() === target);
}

// Grava GROUP_CHAT_ID no .env pra o agente passar a atender o grupo mesmo depois
// que o onboarding fechar. Sem isso o dono teria que editar arquivo na mão.
function saveGroupIdToEnv(workdir, chatId) {
  const envPath = path.join(workdir, ".env");
  try {
    let env = fs.readFileSync(envPath, "utf8");
    if (new RegExp(`^GROUP_CHAT_ID=${chatId}\\s*$`, "m").test(env)) return;
    env = /^GROUP_CHAT_ID=.*$/m.test(env)
      ? env.replace(/^GROUP_CHAT_ID=.*$/m, `GROUP_CHAT_ID=${chatId}`)
      : env.replace(/\s*$/, `\nGROUP_CHAT_ID=${chatId}\n`);
    fs.writeFileSync(envPath, env);
    process.env.GROUP_CHAT_ID = String(chatId);
  } catch (e) { console.error("[onboarding] GROUP_CHAT_ID no .env:", e.message); }
}

// Cria as salas do plano. Distingue os 2 motivos reais de falha (tópicos desligados
// x sem permissão de admin) porque a instrução pro dono é diferente em cada caso.
async function criarSalas({ workdir, chatId, threadId, state, send }) {
  const sug = (state && state.sugestao) || ["Comercial", "Financeiro", "Ideias", "Testes"];
  const criados = [], falhas = [], topicos = [];
  let motivo = "";
  for (const nome of sug) {
    try {
      const tid = await createForumTopic(chatId, nome);
      criados.push(nome);
      topicos.push({ name: nome, id: String(tid) });
      saveTopicEntry(workdir, chatId, tid, nome);
    } catch (e) {
      falhas.push(nome);
      const m = String(e && e.message || "").toLowerCase();
      if (/not a forum|topic.*disabled|forum/.test(m)) motivo = "topicos";
      else if (/not enough rights|admin|permission/.test(m)) motivo = "admin";
    }
  }

  if (!criados.length) {
    // sem sala nenhuma criada: avisa o motivo, mas sem repetir a cada mensagem
    const agora = Date.now();
    const ultimo = Number(state && state.ultimoAvisoFalha || 0);
    if (agora - ultimo > INTERVALO_AVISO_FALHA_MS) {
      await sendSafe(send, chatId, motivo === "admin" ? precisaAdminMsg() : precisaTopicosMsg(), threadId);
      writeState(workdir, Object.assign({}, state, { step: "plan_ready", ultimoAvisoFalha: agora }));
    }
    return false;
  }

  saveGroupIdToEnv(workdir, chatId);
  writeState(workdir, Object.assign({}, state, {
    step: "salas_criadas",
    groupId: String(chatId),
    topicos,
    criadasEm: Date.now(),
    ultimoAvisoFalha: 0
  }));
  await sendSafe(send, chatId, confirmMsg(criados, falhas), threadId);
  return true;
}

// Gatilho automático: o Telegram avisa o bridge que o bot virou administrador de um
// grupo. Vale mesmo com a conversa de boas-vindas já fechada, porque o dono pode
// decidir montar o grupo semanas depois.
async function onGroupReady({ workdir, chatId, send }) {
  const state = readState(workdir);
  if (!state) return false;
  if (state.step === "salas_criadas") return false;
  if (grupoJaConfigurado(workdir, chatId)) return false;
  return criarSalas({ workdir, chatId, threadId: null, state, send });
}

// Qualquer mensagem do dono num grupo. Dois papéis: criar as salas quando ainda não
// existem (caminho de resgate, se o aviso de administrador se perdeu) e aceitar ajuste
// de nome nas 24h seguintes à criação.
async function handleGroup({ workdir, chatId, threadId, text, send }) {
  const state = readState(workdir);
  if (!state) return false;
  const raw = (text || "").trim();

  if (state.step !== "salas_criadas") {
    if (grupoJaConfigurado(workdir, chatId)) return false;
    return criarSalas({ workdir, chatId, threadId, state, send });
  }

  // fase de ajustes, só no grupo certo e dentro da janela
  if (String(chatId) !== String(state.groupId)) return false;
  if (Date.now() - Number(state.criadasEm || 0) > JANELA_AJUSTE_MS) return false;
  const parsed = parseAdjustment(raw, state.topicos);
  if (!parsed) return false;

  if (parsed.tipo === "concluir") {
    await sendSafe(send, chatId, finalMsg(), threadId);
    writeState(workdir, Object.assign({}, state, { criadasEm: 0 }));
    markDone(workdir);
    return true;
  }
  if (parsed.tipo === "adicionar") {
    try {
      const tid = await createForumTopic(chatId, parsed.nome);
      state.topicos.push({ name: parsed.nome, id: String(tid) });
      saveTopicEntry(workdir, chatId, tid, parsed.nome);
      writeState(workdir, state);
      await sendSafe(send, chatId, `Adicionei "${parsed.nome}". Mais algo ou fechou?`, threadId);
    } catch (e) {
      await sendSafe(send, chatId, `Não consegui criar "${parsed.nome}". Confere se eu ainda tô como administrador aqui.`, threadId);
    }
    return true;
  }
  if (parsed.tipo === "trocar") {
    const alvo = findTopicByName(state.topicos, parsed.de);
    if (!alvo) {
      await sendSafe(send, chatId, `Não achei uma sala chamada "${parsed.de}". Suas salas: ${state.topicos.map(x => x.name).join(", ")}.`, threadId);
      return true;
    }
    try {
      await editForumTopic(chatId, alvo.id, parsed.para);
      removeTopicEntry(workdir, chatId, alvo.id);
      alvo.name = parsed.para;
      saveTopicEntry(workdir, chatId, alvo.id, parsed.para);
      writeState(workdir, state);
      await sendSafe(send, chatId, `Renomeei pra "${parsed.para}". Mais algo ou fechou?`, threadId);
    } catch (e) {
      await sendSafe(send, chatId, `Não consegui renomear agora. Confere se eu ainda tô como administrador aqui.`, threadId);
    }
    return true;
  }
  if (parsed.tipo === "remover") {
    const alvo = findTopicByName(state.topicos, parsed.nome);
    if (!alvo) {
      await sendSafe(send, chatId, `Não achei uma sala chamada "${parsed.nome}". Suas salas: ${state.topicos.map(x => x.name).join(", ")}.`, threadId);
      return true;
    }
    try {
      await deleteForumTopic(chatId, alvo.id);
      state.topicos = state.topicos.filter(x => x.id !== alvo.id);
      removeTopicEntry(workdir, chatId, alvo.id);
      writeState(workdir, state);
      await sendSafe(send, chatId, `Tirei "${parsed.nome}". Mais algo ou fechou?`, threadId);
    } catch (e) {
      await sendSafe(send, chatId, `Não consegui tirar agora. Confere se eu ainda tô como administrador aqui.`, threadId);
    }
    return true;
  }
  return false;
}

// ---------- handler principal (conversa privada) ----------
async function handle({ workdir, chatId, threadId, isGroup, text, send }) {
  if (isGroup) return false;              // grupo tem caminho próprio
  if (isDone(workdir)) return false;
  const state = readState(workdir) || { step: "welcome" };
  const raw = (text || "").trim();

  // STEP 1 · primeiro contato
  if (state.step === "welcome") {
    await sendSafe(send, chatId, welcomeMsg(), threadId);
    writeState(workdir, { step: "awaiting_business", started: new Date().toISOString() });
    return true;
  }

  // STEP 2 · resposta sobre o negócio: sugere, apresenta as 2 formas e FECHA a conversa
  // de boas-vindas. O plano fica guardado pro dia em que o dono quiser o grupo.
  if (state.step === "awaiting_business") {
    if (!raw) return false;
    const seg = detectSegment(raw);
    writeState(workdir, {
      step: "plan_ready",
      business: raw.slice(0, 500),
      segmento: seg.segmento,
      sugestao: seg.topicos,
      started: state.started
    });
    await sendSafe(send, chatId, suggestionMsg(seg), threadId);
    markDone(workdir);
    return true;
  }

  // Qualquer estado adiante já teve a orientação. Nada de repetir instrução: fecha e
  // devolve o turno pro agente conversar normal. (Também resgata quem ficou preso na
  // versão antiga, que exigia o comando /prontos.)
  markDone(workdir);
  return false;
}

async function sendSafe(send, chatId, text, threadId) {
  try { await send(chatId, text, threadId); } catch (e) { console.error("[onboarding] send falhou:", e.message); }
}

module.exports = { handle, handleGroup, isDone, reset, onGroupReady };
