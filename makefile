IMAGE_NAME=ipman1971/spark-zulu
CONTAINER_NAME=spark-container

default: build

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -itd --name $(CONTAINER_NAME) -h $(hostname) \
	  -v $(workspace):/workspace -p 18080:18080 $(IMAGE_NAME)

attach:
	docker attach $(CONTAINER_NAME)

clean:
	docker rm -vf $(CONTAINER_NAME)

clean-image:
	docker rmi -f $(IMAGE_NAME)
