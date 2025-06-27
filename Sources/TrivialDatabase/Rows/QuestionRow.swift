// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import PersistDB
import MemberwiseInit
import struct Trivial.Question
import struct Trivial.Category
import struct TrivialService.IdentifiedQuestion
import protocol Catena.Representable
import protocol Catenoid.Row
import protocol Catenoid.Model

@_UncheckedMemberwiseInit(.public)
public struct QuestionRow {
	public let id: Question.ID

	private let category: Category.IDFields
	private let prompt: String
	@Init(default: Question.QuestionType.multipleChoice) private let questionType: Question.QuestionType
	@Init(default: Question.Difficulty.easy) private let difficulty: Question.Difficulty
}

// MARK: -
extension QuestionRow: Row {
	// MARK: Valued
	public typealias Value = Question

	// MARK: Representable
	public var value: Value {
		.init(
			prompt: prompt,
			questionType: questionType,
			difficulty: difficulty
		)
	}

	// MARK: Model
	public var identifiedModelID: Question.ID? { id }

	public var valueSet: ValueSet<Question.Identified> {
		[
			\.value.prompt == prompt,
			\.value.difficulty == difficulty,
			\.value.questionType == questionType,
			\.category == category.id
		]
	}
}
