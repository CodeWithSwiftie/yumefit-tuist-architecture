# Tuist Templates and Utilities for iOS Projects

## Quick Start

```bash
# Clone the repository
git clone https://github.com/CodeWithSwiftie/yumefit-tuist-architecture

# Navigate to the project directory
cd yumefit-tuist-architecture

# Generate Xcode project
tuist generate
```

This will clone the project and generate Xcode workspace.

## About this Repository

This repository serves as a companion to the author's LinkedIn post about Tuist best practices and template utilities. For more information about iOS development techniques and tool optimizations, check out the author's profile:

[Vlad Tretyak on LinkedIn](https://www.linkedin.com/in/vlad-tretyak/)

## About Tuist

[Tuist](https://tuist.io) is a command-line tool that helps iOS developers define, maintain and interact with Xcode projects. It provides a Swift DSL to define projects and workspaces, simplifying project management at scale.

- 🛠 **Declarative project definition**
- 🔄 **Scalability for projects of any size**
- 📦 **Integrated dependency management**
- 🚀 **Build acceleration with caching**

## Repository Contents

This repository contains a basic Tuist project example along with useful templates and utilities to extend Tuist capabilities in your projects.

### Structure

```
├── Project/                 # Basic Tuist project example
├── Templates/               # Useful templates for Tuist
│   ├── ProductExtensions/   # Extensions for Product type
│   ├── FileHeaders/         # File header templates
│   ├── ResourcesHelpers/    # Resource handling utilities
│   └── ...
├── Makefile                 # Utility commands
└── README.md                # This file
```

## Installation and Usage

### Installing Tuist

If you don't have Tuist installed, run:

```bash
curl -Ls https://install.tuist.io | bash
```

### Using the Templates

Templates in this repository must be manually integrated into your project:

#### 1. Product Extension for Xcode Previews Support

This extension allows dynamically switching between static libraries and dynamic frameworks to support Xcode Previews.

Example usage in your Project.swift:

```swift
import ProjectDescription

let project = Project(
    name: "MyModule",
    targets: [
        .target(
            name: "MyFeature",
            destinations: [.iPhone, .iPad],
            product: .previewSupportable, // Using our extension
            bundleId: "com.company.myfeature",
            sources: ["Sources/**"]
        )
    ]
)
```

To generate a project with Preview support:

```bash
TUIST_SUPPORT_PREVIEW=TRUE tuist generate
```

#### 2. File Header Template

Define a standard header template for all generated files:

```swift
import ProjectDescription

let project = Project(
    name: "MyProject",
    options: .options(
        fileHeaderTemplate: .defaultTemplate
    ),
    // ...rest of project configuration
)
```

#### 3. Resource Utilities

Place the resource template file in your project's Templates folder to generate code for accessing resources.

## Makefile Commands

The repository includes a Makefile with useful commands for working with Tuist:

```bash
# Get a list of commands
make help

# Generate Xcode project
make generate

# Run tests
make test

# Clean generated files
make clean

# Build project
make build CONFIGURATION=release

# Install dependencies
make install

# Edit project manifests
make edit
```

## Template Examples

### Product Extension

```swift
import Foundation
import ProjectDescription

extension Product {
    /// A special environment setting to configure the product type for Xcode Preview compatibility.
    /// Converts modules to dynamic frameworks (.framework) if `supportPreview` is set to "TRUE";
    /// otherwise, defaults to `.staticLibrary`.
    public static var previewSupportable: Self {
        let supportPreview = Environment.supportPreview.getString(default: "FALSE") == "TRUE"
        return supportPreview ? .framework : .staticLibrary
    }
    
    public static var previewSupported: Bool {
        Environment.supportPreview.getString(default: "FALSE") == "TRUE"
    }
}
```

### File Header Template

```swift
import ProjectDescription

public extension FileHeaderTemplate {
    static var defaultTemplate: FileHeaderTemplate {
        .string(
            """
            //
            //  ___FILENAME___
            //  Package: ___PACKAGENAME___
            //
            //  Created on ___DATE___.
            //  © ___YEAR___ ___ORGANIZATIONNAME___ Limited. All rights reserved.
            //
            //  Confidential information of ___ORGANIZATIONNAME___ Limited. Unauthorized use or distribution is prohibited.
            //
            //  Your App Name
            //  Some description
            
            import Foundation
            """
        )
    }
}
```

## Benefits of Using Tuist

1. **Simplicity**: Tuist abstracts away the complexity of .pbxproj files and provides a clean Swift API.
2. **Modularity**: Easier creation and maintenance of modular architecture.
3. **Consistency**: Helps maintain consistency across projects and developers.
4. **Scalability**: Works well with both small projects and large monorepos.
5. **Automation**: Simplifies CI/CD processes and other automations.

## Contributing

Suggestions for improvements and new templates are welcome! Create an issue or pull request if you have ideas.

## License

MIT
