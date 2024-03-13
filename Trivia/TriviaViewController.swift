//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Linh on 3/13/24.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var questionWindow: UIView!
        
    @IBOutlet weak var questionText: UITextView!
    
    @IBOutlet weak var currentQuestionNumber: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var answerButton1: UIButton!
    
    @IBOutlet weak var answerButton2: UIButton!
    
    @IBOutlet weak var answerButton3: UIButton!
    
    @IBOutlet weak var answerButton4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fakeQuestion = TriviaQuestion(category: "Debut Year",
                                          question: .question1,
                                          correctAnswer: "2006",
                                          incorrectAnswers: ["2004", "2008", "2010"],
                                          questionNum: 1)
        configure(with: fakeQuestion)
    }
    private func configure(with question: TriviaQuestion) {
            categoryLabel.text = question.category
        questionText.text = question.question.description
            currentQuestionNumber.text = "Question:\(question.questionNum)/5"
            
            var answers = question.incorrectAnswers
            answers.append(question.correctAnswer)
            answers.shuffle()
    }
        

}
