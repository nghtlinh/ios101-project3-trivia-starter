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
    
    var currentQuestionIndex = 0
    var questions: [TriviaQuestion] = [
        TriviaQuestion(questionText: "When did BigBang debut?", choices: ["2006", "2007", "2008", "2009"], correctAnswerIndex: 1, category: "Debut Time"),
        TriviaQuestion(questionText: "Who is the Lady Smell of BigBang?", choices: ["TOP", "Daesung", "G-Dragon", "Taeyang"], correctAnswerIndex: 2, category: "Funny Meme"),
        TriviaQuestion(questionText: "Who sang the song Eyes, Nose, Lips?", choices: ["TOP", "Daesung", "G-Dragon", "Taeyang"], correctAnswerIndex: 4, category: "Solo song"),
        TriviaQuestion(questionText: "Who was offered to go to the moon?", choices: ["TOP", "Daesung", "G-Dragon", "Taeyang"], correctAnswerIndex: 1, category: "Other than music"),
    ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            displayQuestion()
            let backgroundImage = UIImageView(image: UIImage(named: "bigbang2.jpg"))
                            backgroundImage.contentMode = .scaleAspectFill
                            backgroundImage.frame = view.bounds
                            view.addSubview(backgroundImage)
                            view.sendSubviewToBack(backgroundImage)
        }
    
    func displayQuestion(){
        let currentQuestion = questions[currentQuestionIndex]
        questionText.text = currentQuestion.questionText
        questionText.font = UIFont.boldSystemFont(ofSize: 40)
        currentQuestionNumber.font = UIFont.boldSystemFont(ofSize: 30)
        currentQuestionNumber.text="Question \(currentQuestionIndex + 1)/\(questions.count)"
        
        answerButton1.setTitle(currentQuestion.choices[0], for: .normal)
        answerButton1.setTitleColor(.black, for: .normal)
        answerButton2.setTitle(currentQuestion.choices[1], for: .normal)
        answerButton2.setTitleColor(.black, for: .normal)
        answerButton3.setTitle(currentQuestion.choices[2], for: .normal)
        answerButton3.setTitleColor(.black, for: .normal)
        answerButton4.setTitle(currentQuestion.choices[3], for: .normal)
        answerButton4.setTitleColor(.black, for: .normal)
    }
        
    @IBAction func didTapButton1(_ sender: UIButton) {
        handleAnswerTapped(choiceIndex: 0)
    }
    
    @IBAction func didTapButton2(_ sender: UIButton) {
        handleAnswerTapped(choiceIndex: 1)
    }
    
    @IBAction func didTapButton3(_ sender: UIButton) {
        handleAnswerTapped(choiceIndex: 2)
    }
    
    @IBAction func didTapButton4(_ sender: UIButton) {
        handleAnswerTapped(choiceIndex: 3)
    }
    
    func handleAnswerTapped(choiceIndex: Int) {
            let currentQuestion = questions[currentQuestionIndex]
            
            // Check if the selected answer is correct
            if choiceIndex == currentQuestion.correctAnswerIndex {
                print("Correct!")
                // Handle correct answer logic
            } else {
                print("Incorrect!")
                // Handle incorrect answer logic
            }
            // Move to the next question
            currentQuestionIndex += 1
            if currentQuestionIndex < questions.count {
                displayQuestion()
            } else {
                displaySummary()
            }
        }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor(red: 0.54, green: 0.88, blue: 0.99, alpha: 1.00).cgColor,
                                UIColor(red: 0.51, green: 0.81, blue: 0.97, alpha: 1.00).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func displaySummary() {
            let alertController = UIAlertController(title: "Game Done!", 
                                                    message: "Thanks for playing the game!",
                                                    preferredStyle: .alert)
            present(alertController, animated: true, completion: nil)
        }
}
