deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

run:
	python main.py

.PHONY: lint test docker_build docker_run

test: lint
	PYTHONPATH=. pytest --verbose -s

docker_build:
	docker build -t hello-world-printer .

docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer
		
TAG=$(USERNAME)/hello-world-printer-k7-2026 
docker_push: docker_build
	@echo "$$DOCKER_PASSWORD" | docker login --username $(USERNAME) --password-stdin; \
	docker tag hello-world-printer-k7-2026 $(TAG); \
	docker push $(TAG); \
	docker logout;
 