"""Anima cada imagem _16x9.jpg no Veo 3.1 fast (image-to-video) com câmera travada + negativePrompt.
Uso: python3 02_animate.py /pasta_img /pasta_video
"""
import os, sys, base64, json, time, glob, urllib.request, urllib.error
sys.path.insert(0, os.path.dirname(__file__))
import _config as C

C.require("GEMINI_API_KEYS")
IMGDIR = sys.argv[1]
VIDDIR = sys.argv[2] if len(sys.argv) > 2 else os.path.join(C.OUTPUT_DIR, "video")
os.makedirs(VIDDIR, exist_ok=True)
KEYS = C.GEMINI_KEYS

VEO_PROMPT = ("Animate this scene with a LOCKED, STATIC camera: NO zoom, NO push-in, NO dolly, NO camera movement; "
"framing stays identical, every element fully inside the frame the whole time. Keep every character and object EXACTLY "
"as in the input image. Only natural subtle motion: gestures/hair, holographic panels flicker/glow, particles drift, "
"message bubbles stream. Premium 3D cinematic, no text warping, 16:9.")

# trava o Veo de deturpar personagem (ex.: nao virar inseto, nao trocar membros)
NEG = ("morphing or changing any character's body, limbs, arms, legs, hands; turning child/human legs into insect or "
"ant legs; insect body, extra limbs; changing outfits, faces, skin, colors or logos; altering the scenery; adding or "
"removing characters; warping or changing text; camera zoom, push-in, dolly or pan; distortion, melting.")

ptr = 0
def submit(img, key):
    bb = base64.b64encode(open(img,"rb").read()).decode()
    payload = {"instances":[{"prompt":VEO_PROMPT,"image":{"bytesBase64Encoded":bb,"mimeType":"image/jpeg"}}],
               "parameters":{"aspectRatio":"16:9","negativePrompt":NEG}}
    url = f"https://generativelanguage.googleapis.com/v1beta/models/veo-3.1-fast-generate-preview:predictLongRunning?key={key}"
    req = urllib.request.Request(url, data=json.dumps(payload).encode(),
                                 headers={"Content-Type":"application/json"}, method="POST")
    with urllib.request.urlopen(req, timeout=120) as r: return json.load(r)

def run(img):
    global ptr
    wid = os.path.basename(img).replace("_16x9.jpg","")
    out = f"{VIDDIR}/{wid}.mp4"
    for off in range(len(KEYS)):
        ki = (ptr+off) % len(KEYS); key = KEYS[ki]
        try: op = submit(img, key)
        except urllib.error.HTTPError as e:
            print(wid,"key",ki,"->",e.code,flush=True); time.sleep(1); continue
        except Exception as e:
            print(wid,"key",ki,"err",str(e)[:60],flush=True); continue
        ptr = ki
        poll = f"https://generativelanguage.googleapis.com/v1beta/{op['name']}?key={key}"
        for i in range(60):
            time.sleep(10)
            try:
                with urllib.request.urlopen(urllib.request.Request(poll), timeout=60) as r: st = json.load(r)
            except Exception: continue
            if st.get("done"):
                try: uri = st["response"]["generateVideoResponse"]["generatedSamples"][0]["video"]["uri"]
                except Exception: print(wid,"NOURI"); break
                dl = uri + (f"&key={key}" if "?" in uri else f"?key={key}")
                with urllib.request.urlopen(urllib.request.Request(dl), timeout=300) as r: open(out,"wb").write(r.read())
                print("SAVED", wid, flush=True); return
        print(wid,"poll exhausted key",ki)
    print(wid,"ALL KEYS FAILED")

for img in sorted(glob.glob(f"{IMGDIR}/*_16x9.jpg")):
    run(img); time.sleep(5)
print("ANIMATE DONE ->", VIDDIR)
