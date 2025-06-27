// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import PersistDB
import Catena
import struct Trivial.Question
import struct Trivial.Category
import struct Trivial.Answer
import protocol TrivialService.QuestionFields
import protocol TrivialService.CategoryFields
import protocol TrivialService.AnswerFields
import protocol Catenoid.Database
import protocol Catenoid.Fields
import protocol Caesura.Storage

public struct Database<
	QuestionSpecifiedFields: QuestionFields & Fields<Question.Identified>,
	CategorySpecifiedFields: CategoryFields & Fields<Category.Identified>,
	AnswerSpecifiedFields: AnswerFields & Fields<Answer.Identified>
>: @unchecked Sendable {
	public let store: Store<ReadWrite>
}

// MARK: -
public extension Database {
	init() async {
		store = try! await Self.createStore()
	}
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

extension Database: Storage {
	public typealias StorageError = Never
}
