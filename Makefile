.PHONY: bootstrap up down logs ps

bootstrap:
	./scripts/bootstrap.sh

up:
	docker compose up -d
	docker compose ps
	docker compose logs --tail 20
	echo "Services are starting."
	echo "Qdrant: http://localhost:6333"
	echo "Neo4j Browser: http://localhost:7474 (neo4j/password)"

logs:
	docker compose logs -f

down:
	docker compose down

ps:
	docker compose ps
