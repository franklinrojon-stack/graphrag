# Local Services

## Qdrant (Vector DB)
- URL: http://localhost:6333
- Data directory: `data/qdrant`

Useful commands:
- `docker compose exec qdrant qdrant --help`
- Health check: `curl http://localhost:6333/health`

## Neo4j (Graph DB)
- Browser: http://localhost:7474 (user: `neo4j`, password: `password`)
- Bolt: `bolt://localhost:7687`
- Data directories under `data/neo4j`

Useful commands:
- `docker compose exec neo4j cypher-shell -u neo4j -p password "SHOW DATABASES"`
- Logs: `docker compose logs neo4j -f`

Stop all services: `docker compose down`
