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

all: build

build:
>@echo "Building resume, CV, and cover letter..."
>@mkdir -p $(BUILD_DIR)
>$(LATEXMK) $(LATEXMK_FLAGS) -output-directory=$(BUILD_DIR) $(SRC_DIR)/$(RESUME).tex
>$(LATEXMK) $(LATEXMK_FLAGS) -output-directory=$(BUILD_DIR) $(SRC_DIR)/$(CV).tex
>$(LATEXMK) $(LATEXMK_FLAGS) -output-directory=$(BUILD_DIR) $(SRC_DIR)/$(COVERLETTER).tex
>@echo "Built: $(BUILD_DIR)/$(RESUME).pdf"
>@echo "Built: $(BUILD_DIR)/$(CV).pdf"
>@echo "Built: $(BUILD_DIR)/$(COVERLETTER).pdf"
>@if [ "$(CLEAN_AUX)" = "1" ]; then $(MAKE) clean-aux; fi

build-resume:
>@echo "Building resume..."
>@mkdir -p $(BUILD_DIR)
>$(LATEXMK) $(LATEXMK_FLAGS) -output-directory=$(BUILD_DIR) $(SRC_DIR)/$(RESUME).tex

build-cv:
>@echo "Building CV..."
>@mkdir -p $(BUILD_DIR)
>$(LATEXMK) $(LATEXMK_FLAGS) -output-directory=$(BUILD_DIR) $(SRC_DIR)/$(CV).tex

build-coverletter:
>@echo "Building cover letter..."
>@mkdir -p $(BUILD_DIR)
>$(LATEXMK) $(LATEXMK_FLAGS) -output-directory=$(BUILD_DIR) $(SRC_DIR)/$(COVERLETTER).tex

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
