// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NavigationObservability",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "NavigationObservability",
                 targets: [
                    "NavigationObservability"
                 ])
    ],
    targets: [
        .target(name: "NavigationObservability")
    ]
)
