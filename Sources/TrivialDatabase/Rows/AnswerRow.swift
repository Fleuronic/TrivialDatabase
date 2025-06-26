// Copyright © Fleuronic LLC. All rights reserved.

import Schemata
import PersistDB
import MemberwiseInit
import struct Trivial.Answer
import struct Trivial.Question
import struct TrivialService.IdentifiedAnswer
import protocol Catena.Representable
import protocol Catenoid.Row
import protocol Catenoid.Model

@_UncheckedMemberwiseInit(.public)
public struct AnswerRow {
    public let id: Answer.ID

    private let text: String
    private let question: Question.IDFields
    @Init(default: false) private let isCorrect: Bool
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
    public var identifiedModelID: Answer.ID? { id }

    public var valueSet: ValueSet<Answer.Identified> {
        [
            \.value.text == text,
            \.value.isCorrect == isCorrect,
            \.question == question.id
        ]
    }
}
