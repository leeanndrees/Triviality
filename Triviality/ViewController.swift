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
    
    // MARK: - Outlets
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // MARK: - Static Variables
    static var questionNumber = 0
    static var questionsWrong = 0
    static var questionsRight = 0
    static var userScore = 0
    static var green = UIColor(red:0.71, green:0.98, blue:0.79, alpha:1.0)
    static var red = UIColor(red:0.89, green:0.40, blue:0.36, alpha:1.0)
    static var defaultBG = UIColor(red:0.80, green:0.79, blue:0.91, alpha:1.0)
    
    var questionsAndAnswers = [
        ("In what year did French colonists settle in Detroit?", ["1701", "1799"]),
        ("When did indigenous people arrive in what is now the Detroit area?", ["As early as 11,000 years ago", "As early as 5,000 years ago"]),
        ("Which mayor was famous for creating \"ribbon farms\" in the city?", ["Hazen Pingree", "Coleman Young"]),
        ("In which year was Detroit officially declared the City of Champions?", ["1936", "1952"]),
        ("Is Vernor's medicinal?", ["Yes", "No"]),
        ("Which dictator received the Key to the City?", ["Saddam Hussein", "Idi Amin"]),
        ("First #1 Motown hit single?", ["Please Mr. Postman, The Marvelettes", "You've Really Got a Hold on Me, The Miracles"]),
    ]
    
    func displayQuestionAndAnswers() {
        if ViewController.questionNumber != questionsAndAnswers.count {
        let theQuestion = questionsAndAnswers[ViewController.questionNumber]
        
        questionLabel.text = theQuestion.0
        answerButton1.setTitle("\(theQuestion.1[0])", for: .normal)
        answerButton2.setTitle("\(theQuestion.1[1])", for: .normal)
        
        ViewController.questionNumber += 1
        }
    
        else {
            endGame()
        }
    }
    
    func enableButtons() {
        answerButton1.isEnabled = true
        answerButton2.isEnabled = true
    }
    
    func getScore() {
        ViewController.userScore = ViewController.questionsRight - ViewController.questionsWrong
        scoreLabel.text = "Your Score: \(String(ViewController.userScore))"
        scoreLabel.isHidden = false
    }
    
    func endGame() {
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        playAgainButton.isHidden = false
        getScore()
    }
    
    func loseGame() {
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        questionLabel.text = "You lose!"
        playAgainButton.isHidden = false
    }
    
    func playGame() {
        playAgainButton.isHidden = true
        scoreLabel.isHidden = true
        view.self.backgroundColor = ViewController.defaultBG
        displayQuestionAndAnswers()
        enableButtons()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        playGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func answerButton1(_ sender: Any) {
        self.view.backgroundColor = ViewController.green
        ViewController.questionsRight += 1
        let delayInSeconds = 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds) {
            self.playGame()
        }
    }
    
    @IBAction func answerButton2(_ sender: Any) {
        self.view.backgroundColor = ViewController.red
        answerButton2.isEnabled = false
        ViewController.questionsWrong += 1
        if ViewController.questionsWrong == 3 {
            loseGame()
        }
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        ViewController.questionNumber = 0
        ViewController.questionsWrong = 0
        ViewController.questionsRight = 0
        ViewController.userScore = 0
        playGame()
    }
    
    
}

