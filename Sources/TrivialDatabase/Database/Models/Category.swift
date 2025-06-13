// Copyright © Fleuronic LLC. All rights reserved.

import Catena
import Schemata
import PersistDB
import struct Trivial.Category
import class TrivialService.IdentifiedCategory
import protocol Catenoid.Model

extension Category.Identified: PersistDB.Model {
	// MARK: Model
	public static var defaultOrder: [Ordering<Category.Identified>] {
		[.init(\.value.name, ascending: true)]
	}
}
