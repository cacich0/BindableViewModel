// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BindableViewModel",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "BindableViewModel",
            targets: ["BindableViewModel"]
        ),
    ],
    targets: [
        .target(
            name: "BindableViewModel"
        )
    ]
)
