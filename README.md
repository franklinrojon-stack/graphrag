# GraphRAG Local Scaffold

This repository bootstraps the local environment needed to experiment with GraphRAG on macOS. It targets:
- Python 3.10 virtual environment
- Qdrant vector database
- Neo4j graph database
- BGE-M3 embedding model
- Placeholder wiring for a DeepSeek R1 LLM API

## Prerequisites
- macOS with Docker Desktop running
- Python 3.10+ (install via [pyenv](https://github.com/pyenv/pyenv), Homebrew, or your preferred manager)
- `make` for the provided helpers

## 1. Python environment
```bash
# Install Python 3.10 if needed
pyenv install 3.10.13     # optional helper
pyenv local 3.10.13       # uses .python-version

# Create the virtualenv and install dependencies
make bootstrap
source .venv/bin/activate
```
> The bootstrap script chooses the first available interpreter >=3.10 (preferring `python3.10`, then `python3`). Override with `PYTHON_BIN=/path/to/python make bootstrap` if you need something specific.

## 2. Configure secrets
```bash
cp .env.example .env
# Fill in DeepSeek key, optional Hugging Face token, etc.
```

## 3. Start Qdrant + Neo4j
```bash
make up      # docker compose up -d
```
- Qdrant dashboard: http://localhost:6333
- Neo4j Browser: http://localhost:7474 (user `neo4j`, password `password`)

Use `make logs` or `make down` to monitor/stop services. See `docs/services.md` for more commands.

## 4. Embedding model
The project defaults to `BAAI/bge-m3`. When running behind a firewall or offline, follow `docs/embeddings.md` to cache the model locally and update `.env`.

## 5. LLM integration
`python-dotenv` is included so application code can load `.env`. When you're ready to plug in DeepSeek R1, populate the variables documented in `docs/llm.md` and initialize your client from them.

## 6. First smoke test
After activating the virtual environment and starting services, you can confirm connectivity:
```bash
python - <<'PY'
from qdrant_client import QdrantClient
from neo4j import GraphDatabase

qdrant = QdrantClient(url="http://localhost:6333")
print("Qdrant collections:", qdrant.get_collections())

neo4j = GraphDatabase.driver("bolt://localhost:7687", auth=("neo4j", "password"))
with neo4j.session() as session:
    print("Neo4j version:", session.run("CALL dbms.components() YIELD name, versions RETURN name, versions").values())
PY
```

## Repository layout
```
.
├── Makefile
├── docker-compose.yml
├── docs/
│   ├── embeddings.md
│   ├── llm.md
│   └── services.md
├── requirements*.txt
├── scripts/
│   └── bootstrap.sh
└── .env.example
```

You can now add your GraphRAG orchestration code (e.g. under `src/`) on top of this scaffold.
