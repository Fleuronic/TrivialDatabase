// Copyright © Fleuronic LLC. All rights reserved.

import Catena
import Schemata
import PersistDB
import struct Trivial.Answer
import struct TrivialService.IdentifiedAnswer
import protocol Catenoid.Model

extension Answer.Identified: PersistDB.Model {
	// MARK: Model
	public static var defaultOrder: [Ordering<Self>] {
		[.init(\.value.text, ascending: true)]
	}
}
