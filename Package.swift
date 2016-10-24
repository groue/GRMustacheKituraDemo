import PackageDescription

let package = Package(
    name: "GRMustacheKituraDemo",
    dependencies: [
        .Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 0),
        .Package(url: "https://github.com/groue/Kitura-MustacheTemplateEngine.git", majorVersion: 2, minor: 0),
    ])
