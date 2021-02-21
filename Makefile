# set preferred shell
SHELL := /usr/bin/env bash

PANDOC := pandoc
PANDOC += --standalone
PANDOC += --listings
PANDOC += --slide-level=3
PANDOC += --to=beamer

SRCS := $(notdir $(wildcard src/seminar_*/*.md))

SEMINARS := $(subst /,,$(subst src/,,$(dir $(wildcard src/seminar_*/*.md))))
TOPICS := $(SRCS:.md=)

vpath %.md $(dir $(basename $(wildcard src/seminar_*/*.md)))

BUILD_DIR := build
.PHONY: $(BUILD_DIR)
$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.pdf: %.md | $(BUILD_DIR)
	$(PANDOC) --output=$@ $<

.PHONY: $(TOPICS)
$(TOPICS): % : $(BUILD_DIR)/%.pdf

.PHONY: $(SEMINARS)
.SECONDEXPANSION:
$(SEMINARS): $$(basename $$(notdir $$(wildcard src/$$@/*.md)))

.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)

.DEFAULT_GOAL: none
.PHONY: none
none:
	@echo 'no default goal set as for now'
