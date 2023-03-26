RELEASE_FILE := release.tar.gz
RELEASE_STATIC_CONTENT := .github/workflows/build.yaml README.md

.PHONY: clean distclean build

# Disable implicit rules
.SUFFIXES:

all: build

release-file: ${RELEASE_FILE}

${RELEASE_FILE}: ${RELEASE_STATIC_CONTENT} 
	@tar -cf release.tar ${RELEASE_STATIC_CONTENT} && rm -f release.tar.gz && gzip release.tar

clean:
	@rm -rf ${RELEASE_FILE}

distclean: clean
	@rm -rf temp
