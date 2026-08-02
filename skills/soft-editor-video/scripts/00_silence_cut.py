"""Corta os silêncios de um vídeo (legenda queimada anda junto).
Uso: python3 00_silence_cut.py entrada.mp4 saida.mp4 [noise_dB] [dur_min]
"""
import subprocess, re, sys
SRC = sys.argv[1]; OUT = sys.argv[2]
NOISE = sys.argv[3] if len(sys.argv) > 3 else "-30dB"
DMIN  = sys.argv[4] if len(sys.argv) > 4 else "0.35"
PAD = 0.10

d = float(subprocess.run(["ffprobe","-v","error","-show_entries","format=duration","-of",
    "default=noprint_wrappers=1:nokey=1",SRC],capture_output=True,text=True).stdout.strip())
out = subprocess.run(["ffmpeg","-i",SRC,"-af",f"silencedetect=noise={NOISE}:d={DMIN}","-f","null","-"],
                     capture_output=True,text=True).stderr
starts=[float(x) for x in re.findall(r"silence_start: ([0-9.]+)",out)]
ends  =[float(x) for x in re.findall(r"silence_end: ([0-9.]+)",out)]
sil=[(s+PAD,e-PAD) for s,e in zip(starts,ends) if e-PAD>s+PAD]
keep=[]; cur=0.0
for a,b in sil:
    if a>cur: keep.append((cur,a))
    cur=b
if cur<d: keep.append((cur,d))
keep=[(a,b) for a,b in keep if b-a>0.05]
print(f"orig={d:.2f}s  newdur={sum(b-a for a,b in keep):.2f}s  cortado={d-sum(b-a for a,b in keep):.2f}s",flush=True)
sel="+".join(f"between(t,{a:.3f},{b:.3f})" for a,b in keep)
fc=f"[0:v]select='{sel}',setpts=N/FRAME_RATE/TB[v];[0:a]aselect='{sel}',asetpts=N/SR/TB[a]"
r=subprocess.run(["ffmpeg","-y","-i",SRC,"-filter_complex",fc,"-map","[v]","-map","[a]",
   "-c:v","libx264","-preset","fast","-crf","18","-pix_fmt","yuv420p","-c:a","aac","-b:a","160k",OUT],
   stderr=subprocess.PIPE)
print("OK "+OUT if r.returncode==0 else "FAIL\n"+r.stderr.decode()[-1200:])
