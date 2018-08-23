//
//  ViewController.swift
//  Triviality
//
//  Created by DetroitLabs on 8/23/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

/**App Challenge #9: Triviality*
 
 Create a trivia game application consisting of at least 8 questions
 If the user guesses a question correctly, the background of the app should flash green, and the user should be taken to the next question
 If the user chooses an incorrect answer, the background of the app should flash red, and that answer should be disabled
 If the user gets more than 3 questions wrong, the user should lose the game
 At the end of the game, your app should show the user their score
 The user should be able to start over when the game ends
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    
    var questionsAndAnswers = [
        ("question1", ["rightAnswer1", "wrongAnswer1"]),
        ("question2", ["rightAnswer2", "wrongAnswer2"]),
        ("question3", ["rightAnswer3", "wrongAnswer3"]),
        ("question4", ["rightAnswer4", "wrongAnswer4"]),
    ]
    
    func displayQuestionAndAnswers() {
        var questionNumber = 0
        let theQuestion = questionsAndAnswers[questionNumber]
        
        questionLabel.text = theQuestion.0
        answerButton1.setTitle("\(theQuestion.1[0])", for: .normal)
        answerButton2.setTitle("\(theQuestion.1[1])", for: .normal)
        
        questionNumber += 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        displayQuestionAndAnswers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

