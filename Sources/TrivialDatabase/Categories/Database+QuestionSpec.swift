// Copyright © Fleuronic LLC. All rights reserved.

import struct Trivial.Question
import struct Trivial.Category
import protocol Catena.ResultProviding
import protocol Catenoid.Fields
import protocol TrivialService.QuestionSpec

extension Database: QuestionSpec where QuestionSpecifiedFields: Decodable {
	public typealias QuestionFetch = SingleResult<QuestionSpecifiedFields>
	public typealias QuestionList = Results<Question.IDFields>
}
