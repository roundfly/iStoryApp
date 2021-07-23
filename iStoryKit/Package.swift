// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iStoryKit",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "NetworkClientAPI",
            type: .dynamic,
            targets: ["NetworkClientAPI"]),
        .library(
            name: "NetworkClient",
            type: .dynamic,
            targets: ["NetworkClient"]),
        .library(
            name: "AnalyticsClientAPI",
            type: .dynamic,
            targets: ["AnalyticsClientAPI"]),
        .library(
            name: "AnalyticsClient",
            type: .dynamic,
            targets: ["AnalyticsClient"]),
        .library(
            name: "StoryClientAPI",
            type: .dynamic,
            targets: ["StoryClientAPI"]),
        .library(
            name: "StoryClient",
            type: .dynamic,
            targets: ["StoryClient"]),
        .library(
            name: "PageClientAPI",
            type: .dynamic,
            targets: ["PageClientAPI"]),
        .library(
            name: "PageClient",
            type: .dynamic,
            targets: ["PageClient"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.0"))
    ],
    targets: [
        .target(
            name: "NetworkClientAPI",
            dependencies: []),
        .testTarget(
            name: "NetworkClientTests",
            dependencies: ["NetworkClientAPI"]),
        .target(name: "NetworkClient",
                dependencies: ["NetworkClientAPI", "Alamofire"]),
        .target(
            name: "AnalyticsClientAPI",
            dependencies: []),
        .testTarget(
            name: "AnalyticsClientTests",
            dependencies: ["AnalyticsClientAPI"]),
        .target(name: "AnalyticsClient",
                dependencies: ["AnalyticsClientAPI"]),
        .target(
            name: "StoryClientAPI",
            dependencies: ["PageClientAPI"]),
        .testTarget(
            name: "StoryClientTests",
            dependencies: ["StoryClientAPI"]),
        .target(name: "StoryClient",
                dependencies: ["StoryClientAPI"]),
        .target(
            name: "PageClientAPI",
            dependencies: ["NetworkClientAPI"]),
        .testTarget(
            name: "PageClientTests",
            dependencies: ["PageClientAPI"]),
        .target(name: "PageClient",
                dependencies: ["PageClientAPI"])
    ]
)
