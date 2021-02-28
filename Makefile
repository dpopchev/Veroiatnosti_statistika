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

DRIVE_DIR=UASG/Notes
LOCAL_DIR=src/$(TOPIC)
.PHONY: download
download:
	@mkdir -p $(LOCAL_DIR)
	rclone copy remote:$(DRIVE_DIR) --include '*.jpg' $(LOCAL_DIR)/. --progress
	@ls -r $(LOCAL_DIR) | cat -n | while read n f; do mv "$(LOCAL_DIR)/$$f" "$(LOCAL_DIR)/$(TOPIC)_$$n.jpg" && mogrify -resize 800 -auto-orient -filter Triangle -unsharp 0.25x0.08+8.3+0.045 -dither None -quality 82 -colorspace sRGB "$(LOCAL_DIR)/$(TOPIC)_$$n.jpg"; done

.DEFAULT_GOAL: none
.PHONY: none
none:
	@echo 'no default goal set as for now'
