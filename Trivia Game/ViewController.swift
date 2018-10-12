//
//  ViewController.swift
//  Trivia Game
//
//  Created by Jamie Cummings on 10/8/18.
//  Copyright © 2018 Jamie Cummings. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var categorySpinner: UIPickerView!
    @IBOutlet weak var allCatButton: UIButton!
    
    var spinnerData: [String] = [String]()
    var questions : [TriviaQuestions] = []
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        spinnerData = ["Science Trivia", "Movie Quotes", "Sports Trivia", "Music Trivia", "All Categories"]
        categorySpinner.delegate = self
        categorySpinner.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewControllerPage2 {
            if categorySpinner.selectedRow(inComponent: 0) == 0 {
                destination.questions = scienceQuestion
            } else if categorySpinner.selectedRow(inComponent: 0) == 1{
                destination.questions = movieQuestion
            }else if categorySpinner.selectedRow(inComponent: 0) == 2{
                destination.questions = sportsQuestion
            } else if categorySpinner.selectedRow(inComponent: 0) == 3 {
                destination.questions = musicQuestion
            } else {
                let questions = scienceQuestion + movieQuestion + sportsQuestion + musicQuestion
                destination.questions = questions
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return spinnerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(spinnerData[row])"
    }
    
    
    

    
    @IBAction func allCatButtonPush(_ sender: Any) {
        
    }
    @IBAction func unwindToQuizScreen(segue: UIStoryboardSegue){
        
    }
}

