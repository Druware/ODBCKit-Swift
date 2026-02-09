// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ODBCKit-Swift",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ODBCKit-Swift",
            targets: ["ODBCKit-Swift"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ODBCKit-Swift",
            dependencies: [],
            linkerSettings: [
                .linkedLibrary("odbc"), // Link the iODBC system library
                .unsafeFlags(["-L/opt/locoal/lib", "-I/opt/local/include"]) // Specify paths to libraries and headers
            ]
        ),
        .testTarget(
            name: "ODBCKit-SwiftTests",
            dependencies: ["ODBCKit-Swift"]
        ),
    ]
)
