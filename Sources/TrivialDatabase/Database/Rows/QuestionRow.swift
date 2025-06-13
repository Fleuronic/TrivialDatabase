// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import PersistDB
import struct Trivial.Question
import protocol Catena.Representable
import protocol Catenoid.Row
import protocol Catenoid.Model
import protocol TrivialService.QuestionFields

private import MemberwiseInit

@_UncheckedMemberwiseInit(.public)
public struct QuestionRow: QuestionFields {
	public let id: Question.ID
	public let prompt: String
	public let questionType: Question.QuestionType
	public let difficulty: Question.Difficulty
}

// MARK: -
extension QuestionRow: Row {
	// MARK: Valued
	public typealias Value = Question

	// MARK: Representable
	public var value: Value {
		.init(
			prompt: value.prompt,
			questionType: value.questionType,
			difficulty: value.difficulty
		)
	}

	// MARK: Model
	public var valueSet: ValueSet<Model> {
		[
			\.value.prompt == prompt,
			\.value.difficulty == difficulty,
			\.value.questionType == questionType
		]
	}
}
