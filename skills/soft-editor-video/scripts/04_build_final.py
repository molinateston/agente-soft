"""Acabamento final: anexa o CTA (opcional, com transição) + música de fundo discreta + export 4K.
Uso: python3 04_build_final.py base_montado.mp4 saida_4k.mp4 [cta.mp4] [musica.mp3]
Se não passar CTA/música, simplesmente exporta em 4K.
"""
import subprocess, os, sys
sys.path.insert(0, os.path.dirname(__file__))
import _config as C

BASE=sys.argv[1]
OUT4K=sys.argv[2] if len(sys.argv)>2 else os.path.join(C.OUTPUT_DIR,"final_4k.mp4")
CTA=sys.argv[3] if len(sys.argv)>3 and os.path.exists(sys.argv[3]) else None
MUSIC=sys.argv[4] if len(sys.argv)>4 and os.path.exists(sys.argv[4]) else None
os.makedirs(os.path.dirname(OUT4K) or ".", exist_ok=True)
HD=OUT4K.replace(".mp4","_1080.mp4")

def dur(p): return float(subprocess.run(["ffprobe","-v","error","-show_entries","format=duration","-of",
    "default=noprint_wrappers=1:nokey=1",p],capture_output=True,text=True).stdout.strip())
D=dur(BASE); XF=0.7

inputs=["-i",BASE]; idx=1; cta_i=mus_i=None
if CTA: inputs+=["-i",CTA]; cta_i=idx; idx+=1
if MUSIC: inputs+=["-i",MUSIC]; mus_i=idx; idx+=1

fc=[]
if CTA:
    cta=dur(CTA); total=D+cta-XF
    fc.append(f"[0:v]fps=30,scale=1080:1920,setsar=1,format=yuv420p,settb=AVTB[bv]")
    fc.append(f"[{cta_i}:v]fps=30,scale=1080:1920,setsar=1,format=yuv420p,settb=AVTB[cv]")
    fc.append(f"[bv][cv]xfade=transition=fade:duration={XF}:offset={D-XF:.2f}[vout]")
    fc.append(f"[0:a]apad=pad_dur={cta-XF+0.05:.2f}[sp]")
    sp="[sp]"
else:
    total=D; fc.append("[0:v]format=yuv420p[vout]"); sp="[0:a]"
if MUSIC:
    fc.append(f"[{mus_i}:a]atrim=0:{total:.2f},asetpts=PTS-STARTPTS,loudnorm=I=-34:TP=-6:LRA=6,volume=0.38,"
              f"afade=t=in:st=0:d=1.2,afade=t=out:st={total-1.5:.2f}:d=1.5[bg]")
    fc.append(f"{sp}[bg]amix=inputs=2:duration=first:normalize=0[aout]"); amap="[aout]"
else:
    amap=sp
cmd=["ffmpeg","-y",*inputs,"-filter_complex",";".join(fc),"-map","[vout]","-map",amap,
     "-c:v","libx264","-preset","medium","-crf","18","-pix_fmt","yuv420p","-c:a","aac","-b:a","192k",HD]
r=subprocess.run(cmd,stderr=subprocess.PIPE)
if r.returncode: print("HD FAIL\n",r.stderr.decode()[-2000:]); sys.exit(1)
r2=subprocess.run(["ffmpeg","-y","-i",HD,"-vf","scale=2160:3840:flags=lanczos","-c:v","libx264","-preset","medium",
     "-crf","18","-pix_fmt","yuv420p","-c:a","copy",OUT4K],stderr=subprocess.PIPE)
print("OK "+OUT4K if r2.returncode==0 else "4K FAIL\n"+r2.stderr.decode()[-1500:])
