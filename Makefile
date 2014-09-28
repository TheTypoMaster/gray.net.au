all: clean build deploy

clean:
	rm output/site*.xml

build:
	nikola build

deploy:
	nikola deploy
