all: build deploy

clean:
	rm -rf output/[A-Za-z0-9]*
	rm -rf cache/posts/[A-Za-z0-9]*
	rm -rf cache/webassets/[A-Za-z0-9]*

build:
	nikola build

deploy:
	nikola deploy
