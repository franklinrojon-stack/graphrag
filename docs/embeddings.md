# BGE-M3 Embeddings

The project defaults to the `BAAI/bge-m3` embedding model. You can load it directly from Hugging Face or keep a local snapshot if you prefer fully offline usage.

## Quick start (online)
```bash
source .venv/bin/activate
python - <<'PY'
from sentence_transformers import SentenceTransformer
model = SentenceTransformer("BAAI/bge-m3")
print("Model loaded", model.get_sentence_embedding_dimension())
PY
```

## Offline/local cache workflow
1. Authenticate with Hugging Face (optional but recommended):
   ```bash
   huggingface-cli login
   ```
2. Download the model once and keep it in `.cache/embeddings`:
   ```bash
   huggingface-cli download BAAI/bge-m3 --local-dir .cache/embeddings/bge-m3
   ```
3. Point the loader to the local path by setting in `.env`:
   ```env
   EMBEDDING_MODEL_NAME=.cache/embeddings/bge-m3
   ```

## macOS Metal acceleration (optional)
PyTorch on Apple Silicon can leverage Metal Performance Shaders. Install the nightly `torch` build if you want the best performance:
```bash
pip install "torch==2.3.0.dev20240201" --index-url https://download.pytorch.org/whl/nightly/cpu
```
Make sure to match the Python version and desired backend (CPU/GPU).
