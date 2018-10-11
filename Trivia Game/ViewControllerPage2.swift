//
//  ViewControllerPage2.swift
//  Trivia Game
//
//  Created by Jamie Cummings on 10/9/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//


import UIKit

class ViewControllerPage2: UIViewController {
    
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var triviaQuestionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score = 0 {
        didSet {
            // property observer for score
            scoreLabel.text = "\(score)"
        }
    }
    var randomIndex : Int!
    // this will store the current question
    var questions: [TriviaQuestions] = []
    // our array of questions for the game
    var questionsPlaceholder: [TriviaQuestions] = []
    // this array will hold al the question that have been answered
    var currentQuestion : TriviaQuestions!{
        // property observer for currentQuestion
        didSet {
            triviaQuestionLabel.text = currentQuestion.question
            answer0.setTitle(currentQuestion.answers[0], for: .normal)
            triviaQuestionLabel.text = currentQuestion.question
            answer1.setTitle(currentQuestion.answers[1], for: .normal)
            triviaQuestionLabel.text = currentQuestion.question
            answer2.setTitle(currentQuestion.answers[2], for: .normal)
            triviaQuestionLabel.text = currentQuestion.question
            answer3.setTitle(currentQuestion.answers[3], for: .normal)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.        
        getNewQuestions()
    }
    
    func getNewQuestions() {
        if questions.count > 0 {
            randomIndex =
                Int(arc4random_uniform(UInt32(questions.count)))
            currentQuestion = questions[randomIndex]
        }else{
            showRestGameAlert()
        }
    }
    
    
    // show an alert when the user gets the question right
    func showCorrectAnswerAlert (){
        let correctAlert = UIAlertController(title: "Correct", message: "\(currentQuestion.correctAnswer) was the correct answer", preferredStyle: .actionSheet)
        // UIAlertAction
        let closeAction = UIAlertAction(title:"close", style: .default) { _ in
            self.questionsPlaceholder.append(self.questions.remove(at: self.randomIndex))
            self.getNewQuestions()
        }
        // Add the action to the alert controller
        correctAlert.addAction(closeAction)
        // present the alert controller
        self.present(correctAlert,animated: true, completion: nil)
    }
    func showRestGameAlert(){
        let resetGameAlert = UIAlertController (title: "Game Over", message: "Total score \(score)", preferredStyle: .actionSheet)
        let closeAction = UIAlertAction(title:"close", style: .default)
        { _ in
            self.resetGame()}
        
            resetGameAlert.addAction(closeAction)
            self.present(resetGameAlert,animated: true, completion: nil)
        }
        func resetGame(){
            // this will reset the score, repopulate the questions array with the questions in the place holder, get a new question
            score = 0
            if !questions.isEmpty {
                questionsPlaceholder.append(contentsOf: questions)
            }
            questions = questionsPlaceholder
            questionsPlaceholder.removeAll()
            getNewQuestions()
        }
        // show an alert when the user gets the question wrong
        func showIncorrectAnswerAlert(){
            let incorrectAlert = UIAlertController(title: "Incorrect", message: "\(currentQuestion.correctAnswer) was the correct answer", preferredStyle: .actionSheet)
            // UIAlertAction
            let closeAction = UIAlertAction(title:"close", style: .default) { _ in
                self.questionsPlaceholder.append(self.questions.remove(at: self.randomIndex))
                self.getNewQuestions()
            }
            // Add the action to the alert controller
            incorrectAlert.addAction(closeAction)
            // present the alert controller
            self.present(incorrectAlert,animated: true, completion: nil)
        }
        
        
        
        @IBAction func buttonTapped(_ sender: UIButton) {
            if sender.tag == currentQuestion.correctAnswerIndex {
                // they got the question right, so we need to let them know
                showCorrectAnswerAlert()
                score += 1
            } else {
                // they got the question wrong, so we need to let them know
                showIncorrectAnswerAlert()
                
            }
        }
        
}

