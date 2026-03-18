// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "DopamineApp",
    platforms: [.iOS(.v15)],
    products: [
        .executable(name: "DopamineApp", targets: ["App"])
    ],
    targets: [
        .executableTarget(
            name: "App",
            path: "Sources"
        )
    ]
)
