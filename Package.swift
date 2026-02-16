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
                .linkedLibrary("iconv"),
                .linkedLibrary("odbc"), // Link the iODBC system library
                .unsafeFlags(["-L/usr/lib", "-L/opt/local/odbc/lib", "-I/opt/local/odbc/include"]) // Specify paths to libraries and headers
            ]
        ),
        .binaryTarget(
            name: "iODBC",
            url: "file://Users/arsatori/temp/iODBC.framework.zip",
            checksum: "530c0d4b36fb45c43b834bfae2e6a43d0a072e893b8092836a31e76f39f627c5"
        ),
        .testTarget(
            name: "ODBCKit-SwiftTests",
            dependencies: ["ODBCKit-Swift"]
        ),
    ]
)
