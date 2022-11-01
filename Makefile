CHECK_YUI_COMPRESSOR := $(shell command -v yui-compressor 2> /dev/null)
CURRENT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

default: --check-yui-compressor
	yui-compressor ${CURRENT_DIR}/gogs/public/css/dark-gogs.dev.css \
		-o ${CURRENT_DIR}/gogs/public/css/dark-gogs.css

--check-yui-compressor:
	@if [ "${CHECK_YUI_COMPRESSOR}" = "" ]; then \
		echo "Error: yui-compressor is not installed"; \
		exit 1; \
	fi
