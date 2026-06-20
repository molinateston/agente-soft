#!/usr/bin/env python3
"""voice-handler.py — transcrição local via faster-whisper (SEM chave, SEM ffmpeg de sistema).

Uso:  voice-handler.py transcribe <audio_file>   -> imprime o texto transcrito (stdout)

O faster-whisper decodifica ogg/opus/m4a/mp3 DIRETO (via av/PyAV, que vem no pip) —
não precisa de ffmpeg de sistema nem de root. Modelo padrão 'small' (pt), cpu int8.
"""
import sys, os

MODEL = os.environ.get("WHISPER_MODEL", "small")


def transcribe(path):
    from faster_whisper import WhisperModel
    m = WhisperModel(MODEL, device="cpu", compute_type="int8")
    segments, _info = m.transcribe(path, language="pt", vad_filter=True)
    return " ".join(s.text.strip() for s in segments).strip()


if __name__ == "__main__":
    if len(sys.argv) >= 3 and sys.argv[1] == "transcribe":
        try:
            out = transcribe(sys.argv[2])
            if out:
                print(out)
        except Exception as e:
            print(f"[voice-handler erro: {e}]", file=sys.stderr)
            sys.exit(1)
    else:
        print("uso: voice-handler.py transcribe <audio_file>", file=sys.stderr)
        sys.exit(2)
