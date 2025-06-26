// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Trivial.Category
import protocol Catena.Scoped
import protocol Catenoid.Fields
import protocol TrivialService.QuestionSpec

extension Database: QuestionSpec where QuestionSpecifiedFields: Catenoid.Fields<Question.Identified> & Decodable {
    public typealias QuestionFetch = SingleResult<QuestionSpecifiedFields>
    public typealias QuestionList = Results<Question.IDFields>
}
