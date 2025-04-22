import ProjectDescription
import Foundation

public extension ProjectDescription.TargetDependency {
    static let quickModuleExample: Self = .project(
        target: "YourTargetName",
        path: .relativeToRoot("YourPath/YourModuleName"),
        status: .required,
        condition: .when([.ios])
    )
}

/// Usage Example
/*
 .target(
     name: "YumeFit",
     //,
     dependencies: [
       .quickModuleExample,
       // other modules
 */
