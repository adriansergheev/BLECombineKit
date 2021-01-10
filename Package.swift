// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BLECombineKit",
    platforms: [
        .macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6)
    ],
    products: [
        .library(name: "BLECombineKit", targets: ["BLECombineKit", "BLECombineKitMocks"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "BLECombineKit",
            dependencies: [],
            path: ".",
            exclude: [
                "Source/BLECombineKit.h",
                "Source/Info.plist",
                "BLECombineExplorer",
                "Products",
                "Frameworks",
                "Tests"
            ],
            sources: [
                "Source/Library"
            ]
        ),
        .target(
            name: "BLECombineKitMocks",
            dependencies: [],
            path: ".",
            exclude: [
                "Source/BLECombineKitMocks.h",
                "Source/Info.plist",
                "BLECombineExplorer",
                "Products",
                "Frameworks",
                "Tests"
            ],
            sources: [
                "Source/Mocks"
            ]
        )
    ]
)
