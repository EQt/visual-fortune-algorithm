APPLETVIEWER = appletviewer
JFLAGS = # -Xlint:deprecation

test: build
	$(APPLETVIEWER) html/applet.html

build:
	javac $(JFLAGS) -d html src/*.java

deploy: build
	rsync -avz --rsh=ssh --exclude .DS_Store html/ diku:homepage/Fortune/

clean:
	rm -f html/*.class
