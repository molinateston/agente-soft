"""GANCHO (cold open) AUDIOVISUAL — PADRÃO v4.
Copia a FRASE COMPLETA mais forte pro comecinho — SÓ o apresentador, SEM b-roll — com (1) EFEITO
diferenciado e (2) a MESMA FRASE escrita numa FAIXA (MÁX 2 LINHAS, fonte menor, ~15% abaixo do centro).
Depois transicao animada (fadeblack) pro corpo. A frase continua no lugar original.

IMPORTANTE: A/B devem cobrir a FRASE COMPLETA (não cortar na metade), mesmo que passe um pouco de 5s.

Uso: python3 05_hook.py talking_head.mp4 A B efeito "FRASE COMPLETA" corpo_montado.mp4 saida.mp4
  efeito = pb | vhs | fantasma | tv_velha
"""
import subprocess, sys, os
from PIL import Image, ImageDraw, ImageFont

SRC=sys.argv[1]; A=float(sys.argv[2]); B=float(sys.argv[3]); EFFECT=sys.argv[4]
PHRASE=sys.argv[5].strip(); BODY=sys.argv[6]; OUT=sys.argv[7]
XF=0.45; durh=B-A
BANNER="/tmp/hook_banner_v4.png"

EFFECTS={
 "pb": "hue=s=0,eq=contrast=1.2:brightness=-0.02,vignette=angle=PI/4",
 "vhs": "rgbashift=rh=5:bh=-5,curves=preset=vintage,noise=alls=14:allf=t,vignette",
 "fantasma": "tmix=frames=6:weights=1 1 1 1 1 1,eq=brightness=0.04:saturation=0.55,vignette",
 "tv_velha": "noise=alls=20:allf=t,curves=preset=vintage,eq=contrast=1.12,vignette",
}
fx=EFFECTS.get(EFFECT, EFFECTS["pb"])

FONTS=["/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf",
       "/System/Library/Fonts/Supplemental/Arial Black.ttf",
       "/System/Library/Fonts/Helvetica.ttc",
       "/usr/share/fonts/truetype/liberation/LiberationSans-Bold.ttf"]
fontpath=next((f for f in FONTS if os.path.exists(f)), None)
W,H=1080,1920
CORAL=(230,57,70,235); WHITE=(255,255,255,255); STROKE=(0,0,0,255)
img=Image.new("RGBA",(W,H),(0,0,0,0)); d=ImageDraw.Draw(img)
txt=PHRASE.upper()

def fit(text):
    """MÁX 2 linhas, fonte 66->28 (50% menor que o original)."""
    for fs in range(66,27,-2):
        font=ImageFont.truetype(fontpath,fs) if fontpath else ImageFont.load_default()
        words=text.split(); lines=[]; cur=""
        for w in words:
            t=(cur+" "+w).strip()
            if d.textlength(t,font=font)<=900: cur=t
            else: lines.append(cur); cur=w
        if cur: lines.append(cur)
        if len(lines)<=2:
            return font,fs,lines,fs+10
    return font,fs,lines[:2],fs+10

font,fs,lines,lh=fit(txt)
print(f"fonte={fs}px linhas={len(lines)}", flush=True)
block_h=lh*len(lines); maxw=max(d.textlength(l,font=font) for l in lines)
pad_x,pad_y=40,28

# centro da faixa = centro da tela + 15% (fica no terço inferior, padrão v4)
center_y=(H//2)+int(H*0.15)   # 1248
bx0=(W-maxw)//2-pad_x; bx1=(W+maxw)//2+pad_x
by0=center_y-block_h//2-pad_y; by1=center_y+block_h//2+pad_y
if by1>H-20:
    shift=by1-(H-20); by0-=shift; by1-=shift; center_y-=shift
d.rounded_rectangle([bx0,by0,bx1,by1],radius=24,fill=CORAL)
y=center_y-block_h//2
for l in lines:
    x=(W-d.textlength(l,font=font))//2
    d.text((x,y),l,font=font,fill=WHITE,stroke_width=4,stroke_fill=STROKE)
    y+=lh
img.save(BANNER)

fc=(
 f"[0:v]scale=1080:1920,setsar=1,fps=30,format=yuv420p,{fx}[hkfx];"
 f"[hkfx][2:v]overlay=0:0[hk0];[hk0]settb=AVTB[hk];"
 f"[1:v]scale=1080:1920,setsar=1,fps=30,format=yuv420p,settb=AVTB[bd];"
 f"[hk][bd]xfade=transition=fadeblack:duration={XF}:offset={durh-XF:.2f}[v];"
 f"[0:a]asetpts=PTS-STARTPTS[ha];[1:a]asetpts=PTS-STARTPTS[ba];"
 f"[ha][ba]acrossfade=d={XF}[a]"
)
cmd=["ffmpeg","-y","-ss",f"{A}","-to",f"{B}","-i",SRC,"-i",BODY,"-i",BANNER,"-filter_complex",fc,
     "-map","[v]","-map","[a]","-c:v","libx264","-preset","medium","-crf","18",
     "-pix_fmt","yuv420p","-c:a","aac","-b:a","192k",OUT]
r=subprocess.run(cmd,stderr=subprocess.PIPE)
print("OK "+OUT if r.returncode==0 else "FAIL\n"+r.stderr.decode()[-2000:])
