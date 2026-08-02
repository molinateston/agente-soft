"""Monta o vídeo: b-roll 16:9 no RODAPÉ + apresentador em cima. Cobertura total (faixa contínua).

Modos:
- overlay  : apresentador 1080x1920 inteiro, b-roll sobreposto no rodapé (use quando NÃO tem legenda baixa).
- crop      : corta o teto morto do apresentador (1080x1312) e empilha o b-roll embaixo (use quando JÁ tem legenda baixa).

Uso: python3 03_assemble.py base.mp4 /pasta_video saida.mp4 [overlay|crop] [crop_y]
"""
import subprocess, os, sys, glob
sys.path.insert(0, os.path.dirname(__file__))
import _config as C

BASE=sys.argv[1]; VIDDIR=sys.argv[2]
OUT=sys.argv[3] if len(sys.argv)>3 else os.path.join(C.OUTPUT_DIR,"final_1080.mp4")
MODE=sys.argv[4] if len(sys.argv)>4 else "crop"
CROP_Y=int(sys.argv[5]) if len(sys.argv)>5 else 400
os.makedirs(os.path.dirname(OUT) or ".", exist_ok=True)

def dur(p): return float(subprocess.run(["ffprobe","-v","error","-show_entries","format=duration","-of",
    "default=noprint_wrappers=1:nokey=1",p],capture_output=True,text=True).stdout.strip())
D=dur(BASE)
takes=sorted(glob.glob(f"{VIDDIR}/*.mp4")); N=len(takes); SEG=D/N
STRIP_W,STRIP_H=1080,608

inputs=["-i",BASE]+sum([["-i",t] for t in takes],[])
fc=[]; labels=""
for i in range(1,N+1):
    fc.append(f"[{i}:v]trim=0:{SEG:.5f},setpts=PTS-STARTPTS,scale={STRIP_W}:{STRIP_H-6},"
              f"pad={STRIP_W}:{STRIP_H}:0:6:color=0x222222,fps=30,setsar=1,format=yuv420p[s{i}]")
    labels+=f"[s{i}]"
fc.append(f"{labels}concat=n={N}:v=1:a=0[strip]")
if MODE=="crop":
    PRES_H=1920-STRIP_H
    fc.append(f"[0:v]crop=1080:{PRES_H}:0:{CROP_Y},setsar=1,fps=30,format=yuv420p[pres]")
    fc.append(f"[pres][strip]vstack=2[v]")
else:
    Y=1920-STRIP_H
    fc.append(f"[0:v]fps=30,scale=1080:1920,setsar=1,format=yuv420p[bg0]")
    fc.append(f"[bg0][strip]overlay=0:{Y}:shortest=1[v]")
cmd=["ffmpeg","-y",*inputs,"-filter_complex",";".join(fc),"-map","[v]","-map","0:a",
     "-c:v","libx264","-preset","medium","-crf","18","-pix_fmt","yuv420p","-c:a","aac","-b:a","160k",OUT]
r=subprocess.run(cmd,stderr=subprocess.PIPE)
print("OK "+OUT if r.returncode==0 else "FAIL\n"+r.stderr.decode()[-2000:])
