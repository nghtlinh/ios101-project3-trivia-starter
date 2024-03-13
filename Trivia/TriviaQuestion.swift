//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Linh on 3/13/24.
//

import Foundation
import UIKit

struct TriviaQuestion {
  let category: String
  let question: TrviaQuestionCode
  let correctAnswer: String
  let incorrectAnswers: [String]
  let questionNum: Int
    
}

enum TrviaQuestionCode {
  case question1
  case question2
  case question3
  case question4
  case question5
    
  var description: String {
    switch self {
    case .question1:
      return "What year did BigBang debut?"
    case .question2:
      return "Who is the leader of BigBang?"
    case .question3:
      return "Which member of BigBang is known for his solo hits like Eyes, Nose, Lips?"
    case .question4:
      return "Which member has a nickname Lady Smell?"
    case .question5:
      return "Which member was selected to go to the moon?"
    }
  }
    
    func getQuestionData(questionCode: TrviaQuestionCode) -> TriviaQuestion {
         switch questionCode {
         case .question1:
             return TriviaQuestion(category: "Debut Year", question: .question1, correctAnswer: "2006", incorrectAnswers: ["2004", "2008", "2010"], questionNum: 1)
         case .question2:
             return TriviaQuestion(category: "Leadership", question: .question2, correctAnswer: "G-Dragon", incorrectAnswers: ["TOP", "Taeyang", "Daesung"], questionNum: 2)
         case .question3:
             return TriviaQuestion(category: "Solo Hits", question: .question3, correctAnswer: "Taeyang", incorrectAnswers: ["G-Dragon", "TOP", "Daesung"], questionNum: 3)
         case .question4:
             return TriviaQuestion(category: "Nicknames", question: .question4, correctAnswer: "Daesung", incorrectAnswers: ["G-Dragon", "TOP", "Taeyang"], questionNum: 4)
         case .question5:
             return TriviaQuestion(category: "Moon Selection", question: .question5, correctAnswer: "TOP", incorrectAnswers: ["G-Dragon", "Taeyang", "Daesung"], questionNum: 5)
         }
     }
}
