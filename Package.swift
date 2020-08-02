// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "BlogExample",
    products: [
        .executable(
            name: "BlogExample",
            targets: ["BlogExample"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.6.0")
    ],
    targets: [
        .target(
            name: "BlogExample",
            dependencies: ["Publish"]
        )
    ]
)