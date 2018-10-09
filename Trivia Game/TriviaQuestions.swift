//
//  TriviaQuestions.swift
//  Trivia Game
//
//  Created by Jamie Cummings on 10/9/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import Foundation

class TriviaQuestions {
    // string storing the text of the question
    let question: String
    
    // string array storing the potential answers to the question
    let answers: [String]
    
    //store the index of the correct answer in the answers array
    let correctAnswerIndex: Int
    
    // computed property that returns the correct answer for the Trivia
    var correctAnswer: String {
        return answers[correctAnswerIndex]
        
    }
    
    init(question:String, answers:[String], correctAnswerIndex:Int) {
        self.question = question
        self.answers = answers
        self.correctAnswerIndex = correctAnswerIndex
        
    }
    
}
