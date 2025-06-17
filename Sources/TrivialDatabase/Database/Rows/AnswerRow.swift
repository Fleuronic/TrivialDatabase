// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import PersistDB
import struct Trivial.Answer
import struct Trivial.Question
import protocol Catena.Representable
import protocol Catenoid.Row
import protocol Catenoid.Model
import protocol TrivialService.AnswerFields

private import MemberwiseInit

@_UncheckedMemberwiseInit(.public)
public struct AnswerRow: AnswerFields {
    public let id: Answer.ID

    private let text: String
    @Init(default: false) private let isCorrect: Bool
    private let question: Question.IDFields
}

// MARK: -
extension AnswerRow: Row {
    // MARK: Valued
    public typealias Value = Answer

    // MARK: Representable
    public var value: Value {
        .init(
            text: text,
            isCorrect: isCorrect
        )
    }

    // MARK: Model
    public var valueSet: ValueSet<Model> {
        [
            \.value.text == text,
            \.value.isCorrect == isCorrect,
            \.question == question.id
        ]
    }
}
