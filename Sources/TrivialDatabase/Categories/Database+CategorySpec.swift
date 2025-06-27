// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Category
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol TrivialService.CategorySpec

extension Database: CategorySpec where CategorySpecifiedFields: Decodable {
	public typealias CategoryList = Results<CategorySpecifiedFields>
}
