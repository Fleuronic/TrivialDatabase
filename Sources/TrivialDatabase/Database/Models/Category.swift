// Copyright © Fleuronic LLC. All rights reserved.

import Catena
import Schemata
import PersistDB
import struct Trivial.Category
import struct TrivialService.IdentifiedCategory

extension Category.Identified: PersistDB.Model {
	// MARK: Model
	public static var defaultOrder: [Ordering<Category.Identified>] {
		[.init(\.value.name, ascending: true)]
	}
}
