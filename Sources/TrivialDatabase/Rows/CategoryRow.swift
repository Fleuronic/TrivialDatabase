// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import MemberwiseInit
import struct Trivial.Category
import struct TrivialService.IdentifiedCategory
import protocol Catenoid.Row

@_UncheckedMemberwiseInit(.public)
public struct CategoryRow {
	public let id: Category.ID

	private let name: String
	@Init(default: nil) private let parent: Category.IDFields?
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
	public var identifiedModelID: Category.ID? { id }

	public var valueSet: ValueSet<Category.Identified> {
		let valueSet: ValueSet<Category.Identified> = [\.value.name == name]
		return if let parentID = parent?.id {
			valueSet.update(with: [\.parentID == parentID])
		} else {
			valueSet
		}
	}
}
