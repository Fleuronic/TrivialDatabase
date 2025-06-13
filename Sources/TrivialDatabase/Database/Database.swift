// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import Schemata
import struct Trivial.Question
import struct Trivial.Category
import struct Trivial.Answer
import struct TrivialService.IdentifiedQuestion
import struct TrivialService.IdentifiedAnswer
import class TrivialService.IdentifiedCategory
import protocol TrivialService.QuestionFields
import protocol TrivialService.CategoryFields
import protocol Catena.Fields
import protocol Catenoid.Fields
import protocol Catenoid.Database

public struct Database<
	QuestionSpecifiedFields: QuestionFields & Catenoid.Fields<Question.Identified>,
	CategorySpecifiedFields: CategoryFields & Catenoid.Fields<Category.Identified>
>: @unchecked Sendable {
	public let store: Store<ReadWrite>
}

// MARK: -
public extension Database {
	init() async {
		store = try! await Self.createStore()
	}

	func specifyingQuestionFields<Fields>(_: Fields.Type) -> Database<
		Fields,
		CategorySpecifiedFields
	> { .init(store: store) }

	 func specifyingCategoryFields<Fields>(_: Fields.Type) -> Database<
	 	QuestionSpecifiedFields,
	 	Fields
	 > { .init(store: store) }
}

// MARK: -
extension Database: Catenoid.Database {
	public static var types: [any AnyModel.Type] {
		[
			Question.Identified.self,
			Category.Identified.self,
			Answer.Identified.self
		]
	}

	public func clear() async {
		store.delete(Delete<Question.Identified>(nil))
		store.delete(Delete<Category.Identified>(nil))
		store.delete(Delete<Answer.Identified>(nil))
	}
}
