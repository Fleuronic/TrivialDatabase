// swift-tools-version:6.1
import PackageDescription

let package = Package(
	name: "TrivialDatabase",
	platforms: [
		.iOS(.v15),
		.macOS(.v12),
		.tvOS(.v15),
		.watchOS(.v8)
	],
	products: [
		.library(
			name: "TrivialDatabase",
			targets: ["TrivialDatabase"]
		),
	],
	dependencies: [
        .package(url: "https://github.com/Fleuronic/TrivialService", branch: "main")
	],
	targets: [
		.target(
			name: "TrivialDatabase",
			dependencies: ["TrivialService"]
		)
	],
	swiftLanguageModes: [.v6]
)
	
for target in package.targets {
	target.swiftSettings = [
		.enableExperimentalFeature("StrictConcurrency"),
		.enableUpcomingFeature("ExistentialAny")
	]
}
