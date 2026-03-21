# Resume/CV/cover letter Makefile

.RECIPEPREFIX := >
.PHONY: all build build-resume build-cv build-coverletter \
clean mostlyclean distclean maintainer-clean clean-aux \
build-mostlyclean build-distclean help

SRC_DIR = src
BUILD_DIR = build
LATEXMK = latexmk
LATEXMK_FLAGS = -cd -lualatex -interaction=nonstopmode

RESUME = kassabian_marvin_resume
CV = kassabian_marvin_cv
COVERLETTER = kassabian_marvin_coverletter

TEX_SOURCES := $(shell find $(SRC_DIR) -type f -name '*.tex')
PDF_TARGETS := $(patsubst %.tex,$(BUILD_DIR)/%.pdf,$(TEX_SOURCES))

RESUME_PDF = $(BUILD_DIR)/$(SRC_DIR)/$(RESUME).pdf
CV_PDF = $(BUILD_DIR)/$(SRC_DIR)/$(CV).pdf
COVERLETTER_PDF = $(BUILD_DIR)/$(SRC_DIR)/$(COVERLETTER).pdf

all: build

build: $(PDF_TARGETS)
>@echo "Building resume, CV, and cover letter..."
>@echo "Built: $(RESUME_PDF)"
>@echo "Built: $(CV_PDF)"
>@echo "Built: $(COVERLETTER_PDF)"

build-resume: $(RESUME_PDF)
>@echo "Building resume..."

build-cv: $(CV_PDF)
>@echo "Building CV..."

build-coverletter: $(COVERLETTER_PDF)
>@echo "Building cover letter..."

# Convenience targets that match common workflows.
build-mostlyclean: build mostlyclean

build-distclean: build distclean

$(BUILD_DIR)/%.pdf: %.tex
>@mkdir -p $(dir $@)
>$(LATEXMK) $(LATEXMK_FLAGS) -output-directory=$(abspath $(dir $@)) $<

# GNU-style cleaning targets.
mostlyclean:
>@echo "Cleaning auxiliary files..."
>@find $(BUILD_DIR) -type f ! -name "*.pdf" -delete 2>/dev/null || true

clean:
>@echo "Cleaning build output..."
>@rm -rf $(BUILD_DIR)

distclean: clean

maintainer-clean: distclean

help:
>@echo "resume/CV/cover letter"
>@echo "  make build               Build resume, CV, and cover letter"
>@echo "  make build-resume        Build resume only"
>@echo "  make build-cv            Build CV only"
>@echo "  make build-coverletter   Build cover letter only"
>@echo "  make mostlyclean         Remove auxiliary files, keep PDFs"
>@echo "  make clean               Remove build directory"
>@echo "  make distclean           Alias of clean"
>@echo "  make maintainer-clean    Alias of distclean"
>@echo "  make build-mostlyclean   Build everything, then remove aux files"
>@echo "  make build-distclean     Build everything, then remove build directory"
