// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "Airtouch",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "AirTouch",
                 targets: ["AirTouch"])
    ],
    targets: [
        .target(name: "AirTouch",
                path: "AirTouch/Classes")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
