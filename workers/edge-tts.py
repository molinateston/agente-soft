#!/usr/bin/env python3
"""Edge TTS worker (grátis, rápido, Antonio/Francisca pt-BR).

Uso:
  edge-tts.py --text "..." --out /tmp/audio.mp3 [--voice pt-BR-AntonioNeural] [--rate +0%] [--volume +0%]
"""
import argparse, asyncio, os, sys

async def synth(text, voice, out, rate, volume, pitch):
    import edge_tts
    kwargs = {"text": text, "voice": voice}
    if rate:   kwargs["rate"]   = rate
    if volume: kwargs["volume"] = volume
    if pitch:  kwargs["pitch"]  = pitch
    comm = edge_tts.Communicate(**kwargs)
    await comm.save(out)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--text", required=True)
    ap.add_argument("--out",  required=True)
    ap.add_argument("--voice", default=os.environ.get("EDGE_TTS_VOICE", "pt-BR-AntonioNeural"))
    ap.add_argument("--rate",   default=os.environ.get("EDGE_TTS_RATE",   ""))
    ap.add_argument("--volume", default=os.environ.get("EDGE_TTS_VOLUME", ""))
    ap.add_argument("--pitch",  default=os.environ.get("EDGE_TTS_PITCH",  ""))
    a = ap.parse_args()
    try:
        asyncio.run(synth(a.text, a.voice, a.out, a.rate, a.volume, a.pitch))
    except Exception as e:
        print(f"edge-tts falhou: {e}", file=sys.stderr)
        sys.exit(2)
    if not os.path.exists(a.out) or os.path.getsize(a.out) < 500:
        print("arquivo de saida vazio/pequeno", file=sys.stderr)
        sys.exit(3)

if __name__ == "__main__":
    main()
