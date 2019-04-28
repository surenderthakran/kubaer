DOCKER:=$(shell grep docker /proc/self/cgroup)

PROJECT_NAME := IndexTracker

install:
ifdef DOCKER
	@$(MAKE) prep_install
	@$(MAKE) prep_compile
	@$(MAKE) compile
	@$(MAKE) build`
else
	@echo \"make install\" will only work inside docker!!!
endif

run:
ifdef DOCKER
	@echo -e "\n...Running $(PROJECT_NAME)..."
	java -Dfile.encoding=UTF-8 -cp "classes:lib/*" com.surenderthakran.kubaer.api.App
else
	@echo \"make run\" will only work inside docker!!!
endif

prep_install:
	@echo -e "\n...Preparing to install $(PROJECT_NAME)..."
	@mkdir -p classes

prep_compile:
	@echo -e "\n...Preparing to compile $(PROJECT_NAME)..."
	@rm -rf classes/*
	find -name "*.java" > sources.txt

compile:
	@echo -e "\n...Compiling $(PROJECT_NAME)..."
	javac -Xdiags:verbose -Xlint:unchecked -classpath "lib/*" -d classes @sources.txt

build:
	@echo -e "\n...Building $(PROJECT_NAME)..."
