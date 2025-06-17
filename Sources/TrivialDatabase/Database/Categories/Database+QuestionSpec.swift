// Copyright © Fleuronic LLC. All rights reserved.

import PersistDB
import struct Trivial.Question
import struct Trivial.Category
import protocol Catena.Scoped
import protocol TrivialService.QuestionSpec

extension Database: QuestionSpec {
	#if swift(<6.0)
	public typealias QuestionListFields = QuestionSpecifiedFields
	#endif

    public func fetchQuestion(with id: Question.ID) async -> SingleResult<QuestionSpecifiedFields> {
        await fetch(with: id)
    }

    public func listQuestions(of type: Question.QuestionType? = nil, inCategoryWith categoryID: Category.ID? = nil, with difficulty: Question.Difficulty? = nil, count: Int? = nil) async -> Results<Question.IDFields> {
        await fetch()
	}
}
