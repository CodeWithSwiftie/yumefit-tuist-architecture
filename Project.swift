import ProjectDescription

let project = Project(
    name: "YumeFit-Tuist",
    targets: [
        .target(
            name: "YumeFit-Tuist",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.YumeFit-Tuist",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["YumeFit-Tuist/Sources/**"],
            resources: ["YumeFit-Tuist/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "YumeFit-TuistTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.YumeFit-TuistTests",
            infoPlist: .default,
            sources: ["YumeFit-Tuist/Tests/**"],
            resources: [],
            dependencies: [.target(name: "YumeFit-Tuist")]
        ),
    ]
)
