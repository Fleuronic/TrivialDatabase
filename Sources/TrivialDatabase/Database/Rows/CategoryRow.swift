// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import PersistDB
import struct Trivial.Category
import struct Trivial.Question
import protocol Catenoid.Row
import protocol Catenoid.Model
import protocol TrivialService.CategoryFields

private import MemberwiseInit

public final class CategoryRow: CategoryFields {
	public let id: Category.ID

	private let name: String
	private let parent: CategoryRow?

	public init(
		id: Category.ID,
		name: String,
		parentID: Category.ID? = nil,
		parentName: String? = nil
	) {
		self.id = id
		self.name = name

		if let parentID, let parentName {
			parent = .init(
				id: parentID,
				name: parentName
			)
		} else {
			parent = nil
		}
	}
}

// MARK: -
extension CategoryRow: Row {
	// MARK: Valued
	public typealias Value = Category

	// MARK: Representable
	public var value: Value {
		.init(name: value.name)
	}

	// MARK: Model
	public var valueSet: ValueSet<Model> {
		[
			\.value.name == name
		]
	}
}
