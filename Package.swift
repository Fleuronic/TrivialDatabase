// swift-tools-version:6.0
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
		.package(url: "https://github.com/Fleuronic/TrivialService", branch: "main"),
		.package(url: "https://github.com/Fleuronic/Catenoid", branch: "main")
	],
	targets: [
		.target(
			name: "TrivialDatabase",
			dependencies: [
				"Catenoid",
				"TrivialService"
			]
		)
	],
	swiftLanguageModes: [.v6]
)
	
for target in package.targets {
	target.swiftSettings = [
		.enableUpcomingFeature("ExistentialAny")
	]
}
