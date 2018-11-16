//
//  AnswerViewController.swift
//  iquiz
//
//  Created by Arman Shah on 11/5/18.
//  Copyright © 2018 Arman Shah. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var appData = AppData.shared
    
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var reaction: UILabel!
    
    var que = ""
    var ans = 0
    var guessed = ""
    var totalAnswered = 0
    var score = 0
    var result = ""
    var curQue = 0
    var categoryIndex = -1
    var jsonData: [Quiz]? = nil
    var numOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question.numberOfLines = 5
        question.text = que
        question.font = UIFont.italicSystemFont(ofSize: 15.0)
        answer.text = jsonData?[categoryIndex].questions[curQue].answers[ans-1]
        answer.textColor = UIColor.orange
        answer.text = appData.answerText
        
        if (answer.text == guessed) {
            score += 1
            result = "Awesome, correct!"
        }
        else {
            result = "Oops, incorrect :("
        }
        
        reaction.numberOfLines = 5
        reaction.text = result
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeRight.direction = .right
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)

        // Do any additional setup after loading the view.
    }
    
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        if (sender.direction == .right) {
            nextPressed(sender)
        } else if (sender.direction == .left) {
            appData.numRight = 0
            appData.numGuessed = 0
            performSegue(withIdentifier: "goBackHome", sender: self)
        }
    }
    
    @IBAction func nextPressed(_ sender: Any) {
        if (totalAnswered < numOfQuestions) {
            let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
            secondVC.totalAnswered = self.totalAnswered
            secondVC.score = score
            secondVC.currentQuestion = curQue + 1
            secondVC.categoryIndex = categoryIndex
            secondVC.jsonData = jsonData
            secondVC.numOfQuestions = numOfQuestions
            self.present(secondVC, animated: false, completion: nil)
        } else {
            let fourthVC = self.storyboard?.instantiateViewController(withIdentifier: "CompleteViewController") as! CompleteViewController
            fourthVC.finalScore = score
            fourthVC.numOfQuestions = numOfQuestions
            self.present(fourthVC, animated: false, completion: nil)
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
