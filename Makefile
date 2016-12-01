# The variables used in this file are defined by GitLab CI
#
MARATHON_ENDPOINT	= ${MARATHON_URL}/v2/apps/slides

# Development placeholders
BUILD_DIR		?= ${PWD}
CI_BUILD_REF		?= dev

# Slides
SRCDIR		= src

FONTSIZE	= 12pt
LIBDIR		= ./lib
TEMPLATE	= ${LIBDIR}/template.revealjs
HTEMPLATE	= ${LIBDIR}/header-template.md
PANDOCOPTS	=  --standalone \
		   --smart \
		   --toc \
		   --toc-depth=2#\
		  #--variable fontsize=${FONTSIZE}

slides::
	pandoc ${SRCDIR}/*.md ${PANDOCOPTS} \
	  -t revealjs \
	  -V slideNumber='c / t' \
	  -V theme=black \
	  --template=${TEMPLATE} \
	  -o $@.html


build::
	# Build .war
	docker run --rm -v ${BUILD_DIR}:/usr/src/click-count -w /usr/src/click-count ${MAVEN_OPTS_DOCKER} maven mvn clean package
	# Build Docker image
	docker build -t horgix/click-count:${CI_BUILD_REF} ${BUILD_DIR}

deploy::
	# Poor templating
	sed -i 's/__VERSION__/${CI_BUILD_REF}/' marathon_app.json
	curl -L -X PUT "${MARATHON_ENDPOINT}" -H "Content-type: application/json" -u "${MARATHON_USERNAME}:${MARATHON_PASSWORD}" -d @marathon_app.json 
