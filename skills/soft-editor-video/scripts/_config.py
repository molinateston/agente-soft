"""Carrega chaves e config do dono. Importado pelos outros scripts."""
import os, json

SKILL_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CFG_DIR = os.path.join(SKILL_DIR, "config")

def _load_keys_env():
    p = os.path.join(CFG_DIR, "keys.env")
    if os.path.exists(p):
        for line in open(p):
            line = line.strip()
            if not line or line.startswith("#") or "=" not in line:
                continue
            k, v = line.split("=", 1)
            os.environ.setdefault(k.strip(), v.strip())

_load_keys_env()

OPENAI_API_KEY = os.environ.get("OPENAI_API_KEY", "")
GEMINI_KEYS = [k.strip() for k in os.environ.get("GEMINI_API_KEYS", "").split(",") if k.strip()]
SUBMAGIC_API_KEY = os.environ.get("SUBMAGIC_API_KEY", "")
OUTPUT_DIR = os.environ.get("OUTPUT_DIR", "").strip() or os.path.join(SKILL_DIR, "output")

def require(*names):
    miss = [n for n in names if not os.environ.get(n) and not (n == "GEMINI_API_KEYS" and GEMINI_KEYS)]
    if miss:
        raise SystemExit(f"FALTAM CHAVES: {miss}. Rode o onboarding (PASSO 0 da SKILL) e preencha config/keys.env.")

def load_personagens():
    p = os.path.join(CFG_DIR, "personagens.json")
    if not os.path.exists(p):
        raise SystemExit("Sem config/personagens.json. Rode o onboarding (PASSO 0.2) e entreviste o dono.")
    return json.load(open(p))
