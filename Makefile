# Resume/CV/cover letter Makefile

.RECIPEPREFIX := >
.PHONY: all build build-resume build-cv build-coverletter clean clean-aux help

CLEAN_AUX ?= 0

SRC_DIR = src
BUILD_DIR = build
LATEXMK = latexmk
LATEXMK_FLAGS = -lualatex -interaction=nonstopmode

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
>@if [ "$(CLEAN_AUX)" = "1" ]; then $(MAKE) clean-aux; fi

build-resume: $(RESUME_PDF)
>@echo "Building resume..."

build-cv: $(CV_PDF)
>@echo "Building CV..."

build-coverletter: $(COVERLETTER_PDF)
>@echo "Building cover letter..."

$(BUILD_DIR)/%.pdf: %.tex
>@mkdir -p $(dir $@)
>$(LATEXMK) $(LATEXMK_FLAGS) -output-directory=$(dir $@) $<

clean:
>@echo "Cleaning build output..."
>@rm -rf $(BUILD_DIR)

clean-aux:
>@echo "Cleaning auxiliary files..."
>@find $(BUILD_DIR) -type f ! -name "*.pdf" -delete 2>/dev/null || true

help:
>@echo "resume/CV/cover letter"
>@echo "  make build             Build resume, CV, and cover letter"
>@echo "  make build-resume      Build resume only"
>@echo "  make build-cv          Build CV only"
>@echo "  make build-coverletter Build cover letter only"
>@echo "  make clean             Remove build directory"
>@echo "  make clean-aux         Remove auxiliary files, keep PDFs"
>@echo "  CLEAN_AUX=1            After build, remove auxiliary files (e.g. make build CLEAN_AUX=1)"
