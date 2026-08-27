// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-predicate-logic",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Predicate Logic",
            targets: ["Predicate Logic"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-predicate.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-logic.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Predicate Logic",
            dependencies: [
                .product(name: "Predicate", package: "swift-predicate"),
                .product(name: "Logic", package: "swift-logic"),
            ]
        ),
        .testTarget(
            name: "Predicate Logic Tests",
            dependencies: ["Predicate Logic"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
