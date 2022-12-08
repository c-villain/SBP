// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SBP",
    defaultLocalization: "ru",
    products: [
        .library(
            name: "SBP",
            targets: ["SBP"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SBP",
            dependencies: [],
            resources: [
                .copy("Resources/Mocks"),
            ]),
        .testTarget(
            name: "SBPTests",
            dependencies: ["SBP"]),
    ]
)
