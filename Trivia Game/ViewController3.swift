//
//  ViewController3.swift
//  Trivia Game
//
//  Created by Jamie Cummings on 10/11/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var questionText: UITextField!
    @IBOutlet weak var answer0Box: UITextField!
    @IBOutlet weak var answer1Box: UITextField!
    @IBOutlet weak var answer2Box: UITextField!
    @IBOutlet weak var answer3Box: UITextField!
    @IBOutlet weak var answerSegment: UISegmentedControl!
    @IBOutlet weak var newQuestionButton: UIButton!
    @IBOutlet weak var categorySegment: UISegmentedControl!
    
    
    var newQuestion: TriviaQuestions!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewControllerPage2 {
            destination.questions.append(newQuestion)
        }
    }
    
    func showErrorAlert() {
        let errorAlert = UIAlertController(title: "Error", message: "Please enter text in all fields, or hit the back button to go back to the quiz.", preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        errorAlert.addAction(dismissAction)
        self.present(errorAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func submitNewQuestionButton(_ sender: Any) {
        guard let question = questionText.text, !question.isEmpty,
        let answer0 = answer0Box.text, !answer0.isEmpty,
        let answer1 = answer1Box.text, !answer1.isEmpty,
        let answer2 = answer2Box.text, !answer2.isEmpty,
        let answer3 = answer3Box.text, !answer3.isEmpty else {
            showErrorAlert()
            return
        }
        newQuestion = TriviaQuestions (question: question, answers: [answer0, answer1, answer2, answer3], correctAnswerIndex: answerSegment.selectedSegmentIndex)
        
        if categorySegment.selectedSegmentIndex == 0 {
            scienceQuestion.append(newQuestion)
        } else if categorySegment.selectedSegmentIndex == 1 {
            movieQuestion.append(newQuestion)
        } else if categorySegment.selectedSegmentIndex == 2 {
            sportsQuestion.append(newQuestion)
        } else {
            musicQuestion.append(newQuestion)
        }
        
        self.performSegue(withIdentifier: "unwindToQuizScreen", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

