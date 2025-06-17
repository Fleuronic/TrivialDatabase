// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import PersistDB
import struct Trivial.Question
import struct Trivial.Category
import protocol Catena.Representable
import protocol Catenoid.Row
import protocol Catenoid.Model
import protocol TrivialService.QuestionFields

public struct QuestionRow: QuestionFields {
	public let id: Question.ID

    private let prompt: String
	private let questionType: Question.QuestionType
	private let difficulty: Question.Difficulty
    private let category: Category.IDFields

    public init(
        id: Question.ID,
        prompt: String = "",
        questionType: Question.QuestionType = .multipleChoice,
        difficulty: Question.Difficulty = .easy,
        category: Category.IDFields
    ) {
        self.id = id
        self.prompt = prompt
        self.questionType = questionType
        self.difficulty = difficulty
        self.category = category
    }
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
	public var valueSet: ValueSet<Model> {
		[
			\.value.prompt == prompt,
			\.value.difficulty == difficulty,
			\.value.questionType == questionType,
            \.category == category.id
		]
	}
}
