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
    @IBOutlet weak var playAgainButton: UIButton!
    
    static var questionNumber = 0
    static var questionsWrong = 0
    static var questionsRight = 0
    
    var questionsAndAnswers = [
        ("question1", ["rightAnswer1", "wrongAnswer1"]),
        ("question2", ["rightAnswer2", "wrongAnswer2"]),
        ("question3", ["rightAnswer3", "wrongAnswer3"]),
        ("question4", ["rightAnswer4", "wrongAnswer4"]),
    ]
    
    func displayQuestionAndAnswers() {
        if ViewController.questionNumber != questionsAndAnswers.count {
        let theQuestion = questionsAndAnswers[ViewController.questionNumber]
        
        questionLabel.text = theQuestion.0
        answerButton1.setTitle("\(theQuestion.1[0])", for: .normal)
        answerButton2.setTitle("\(theQuestion.1[1])", for: .normal)
        
        ViewController.questionNumber += 1
        print(ViewController.questionNumber)
        }
    
        else {
            endGame()
        }
    }
    
    func enableButtons() {
        answerButton1.isEnabled = true
        answerButton2.isEnabled = true
    }
    
    func endGame() {
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        playAgainButton.isHidden = false
    }
    
    func loseGame() {
        if ViewController.questionsWrong == 3 {
            answerButton1.isEnabled = false
            answerButton2.isEnabled = false
            questionLabel.text = "You lose!"
        }
    }
    
    func playGame() {
        displayQuestionAndAnswers()
        enableButtons()
        loseGame()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playAgainButton.isHidden = true
        playGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func answerButton1(_ sender: Any) {
        self.view.backgroundColor = UIColor.green
        ViewController.questionsRight += 1
        playGame()
    }
    
    @IBAction func answerButton2(_ sender: Any) {
        self.view.backgroundColor = UIColor.red
        answerButton2.isEnabled = false
        ViewController.questionsWrong += 1
    }
    
    
}

