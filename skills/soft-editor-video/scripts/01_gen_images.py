"""Gera as imagens dos b-rolls no gpt-image-2 a partir de scenes.json + personagens do dono.

scenes.json (o agente escreve por vídeo):
[
  {"id":"w01","chars":["principal","mascote","cohost"],"pose":"...ação da cena...","extra":"...elementos/texto..."},
  ...
]
Uso: python3 01_gen_images.py scenes.json /pasta/saida_img
"""
import os, sys, base64, json, time, subprocess, urllib.request, urllib.error
from concurrent.futures import ThreadPoolExecutor
sys.path.insert(0, os.path.dirname(__file__))
import _config as C

C.require("OPENAI_API_KEY")
SCENES = json.load(open(sys.argv[1]))
OUTDIR = sys.argv[2] if len(sys.argv) > 2 else os.path.join(C.OUTPUT_DIR, "img")
os.makedirs(OUTDIR, exist_ok=True)
P = C.load_personagens()

def char_blocks(keys):
    out = []
    for k in keys:
        d = P["personagens"].get(k) or P.get("extras", {}).get(k)
        if d: out.append(d)
    return "\n\n".join(out)

def frame(scene):
    chars = scene.get("chars") or P.get("trio_sempre", list(P["personagens"].keys()))
    return f"""Landscape 16:9 cinematic frame, {P.get('estilo','cinematic 3D')}, a believable scene.

CHARACTERS (always present, consistent):
{char_blocks(chars)}

SCENE / ACTION:
{scene['pose']}

ADDITIONAL VISUAL ELEMENTS:
{scene.get('extra','')}

ENVIRONMENT: {P.get('ambiente','')}

COLOR PALETTE: {P.get('paleta','')}

{P.get('safe_area','Keep all characters/text in the central 70%; top and bottom 18% are environment only.')}"""

def gen(scene):
    payload = {"model":"gpt-image-2","prompt":frame(scene),"size":"1536x1024",
               "quality":"high","output_format":"jpeg","n":1}
    req = urllib.request.Request("https://api.openai.com/v1/images/generations",
        data=json.dumps(payload).encode(),
        headers={"Content-Type":"application/json","Authorization":f"Bearer {C.OPENAI_API_KEY}"}, method="POST")
    for _ in range(3):
        try:
            with urllib.request.urlopen(req, timeout=300) as r:
                d = json.load(r)
            raw = f"{OUTDIR}/{scene['id']}_raw.jpg"
            open(raw,"wb").write(base64.b64decode(d["data"][0]["b64_json"]))
            crop = f"{OUTDIR}/{scene['id']}_16x9.jpg"
            subprocess.run(["ffmpeg","-y","-i",raw,"-vf","crop=1536:864:0:80",crop],
                           stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,check=True)
            print("IMG OK", scene["id"], flush=True); return
        except urllib.error.HTTPError as e:
            print("IMG HTTP", scene["id"], e.code, e.read().decode()[:160], flush=True); time.sleep(15)

with ThreadPoolExecutor(max_workers=6) as ex:
    list(ex.map(gen, SCENES))
print("IMAGES DONE ->", OUTDIR)
