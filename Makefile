# Standard Tuist commands for YumeFit project
CONFIGURATION ?= debug
PLATFORM ?= iOS

# =============================================================================
# USAGE EXAMPLES
# =============================================================================
# Example of using the Makefile with Tuist for YumeFit iOS project
#
# Initial setup for a new developer
# $ make install
# Output: Installing dependencies...
#
# Generate Xcode project for development
# $ make generate
# Output: Generating Xcode project...
#
# Clean project when experiencing build issues
# $ make clean
# Output: Cleaning generated files...
#
# Regenerate project after cleaning
# $ make generate
# Output: Generating Xcode project...
#
# Run tests before committing code
# $ make test
# Output: Running tests...
#
# Build for release configuration
# $ make build CONFIGURATION=release
# Output: Building project with release configuration...
#
# Edit project manifests
# $ make edit
# Output: Opening project manifests in editor...
#
# Chain commands for CI pipeline
# $ make clean && make generate && make test && make build CONFIGURATION=release
# Output: Full build pipeline from clean project to release build
# =============================================================================

.PHONY: help generate test clean build install edit

help:
    @echo "Available commands:"
    @echo "  make generate    - Generate Xcode project"
    @echo "  make test        - Run tests"
    @echo "  make clean       - Clean generated files"
    @echo "  make build       - Build project"
    @echo "  make install     - Install dependencies"
    @echo "  make edit        - Edit project manifests"
    @echo ""
    @echo "Options:"
    @echo "  CONFIGURATION=(debug|release) [default: debug]"
    @echo "  PLATFORM=(iOS|macOS) [default: iOS]"

generate:
    # Generate the Xcode project
    @tuist generate

test:
    # Run tests
    @tuist test

clean:
    # Clean generated files
    @tuist clean
    @rm -rf *.xcodeproj
    @rm -rf *.xcworkspace

build:
    # Build the project with specified configuration
    @tuist build --configuration $(CONFIGURATION)

install:
    # Install dependencies
    @tuist install

edit:
    # Edit project manifests
    @tuist edit

.DEFAULT_GOAL := help
