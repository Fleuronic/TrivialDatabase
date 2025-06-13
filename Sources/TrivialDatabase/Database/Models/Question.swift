// Copyright © Fleuronic LLC. All rights reserved.

import Catena
import Schemata
import PersistDB
import struct Trivial.Question
import struct TrivialService.IdentifiedQuestion
import protocol Catenoid.Model

extension Question.Identified: PersistDB.Model {
	// MARK: Model
	public static var defaultOrder: [Ordering<Self>] {
		[.init(\.value.prompt, ascending: true)]
	}
}
