// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "Airtouch",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "Airtouch",
                 targets: ["Airtouch"])
    ],
    targets: [
        .target(name: "Airtouch",
                path: "Airtouch/Classes")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
