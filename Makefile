pull: 
	docker pull cs50/cli:ubuntu

run: 
	docker run -i --rm -v `pwd`/:/root -t cs50/cli:ubuntu

build: src/edu/harvard/CS50.java
	rm -rf build
	mkdir build
	javac -d build src/edu/harvard/CS50.java 

docs: build
	rm -rf docs
	javadoc -d docs -sourcepath src edu.harvard

lib: build
	rm -rf lib
	mkdir lib
	jar cvf lib/cs50.jar -C build .

clean:
	rm -rf build docs lib
