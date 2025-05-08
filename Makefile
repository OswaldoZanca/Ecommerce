up:
	docker compose up -d --build

down:
	docker compose down

migrate:
	docker compose exec web python ecommerce/manage.py migrate --noinput

createsuperuser:
	docker compose exec web python ecommerce/manage.py createsuperuser

shell:
	docker compose exec web python ecommerce/manage.py shell

logs:
	docker compose logs -f

test:
	docker compose exec web pytest

init:
	cp .env.example .env
	docker compose up -d --build
	docker compose exec web python ecommerce/manage.py migrate --noinput
	docker compose exec web python ecommerce/manage.py createsuperuser
	docker compose logs -f
