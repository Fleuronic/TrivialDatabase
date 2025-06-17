// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import PersistDB
import struct Trivial.Category
import struct Trivial.Question
import protocol Catenoid.Row
import protocol Catenoid.Model
import protocol TrivialService.CategoryFields

private import MemberwiseInit

public struct CategoryRow: CategoryFields {
	public let id: Category.ID

	private let name: String
    private let parent: Category.IDFields?


	public init(
		id: Category.ID,
        name: String,
        parent: Category.IDFields? = nil
	) {
		self.id = id
		self.name = name
        self.parent = parent
	}
}

// MARK: -
extension CategoryRow: Row {
	// MARK: Valued
	public typealias Value = Category

	// MARK: Representable
	public var value: Value {
		.init(name: name)
	}

	// MARK: Model
	public var valueSet: ValueSet<Model> {
        let valueSet: ValueSet<Model> = [\.value.name == name]
        return if let parentID = parent?.id {
            valueSet.update(with: [\.parentID == parentID])
        } else {
            valueSet
        }
	}
}
