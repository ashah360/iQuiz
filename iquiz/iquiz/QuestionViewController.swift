//
//  QuestionViewController.swift
//  iquiz
//
//  Created by Arman Shah on 11/5/18.
//  Copyright © 2018 Arman Shah. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    var appData = AppData.shared
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var a4: UIButton!
    @IBOutlet weak var submit: UIButton!
    
    var jsonData: [Quiz]? = nil
    var categoryIndex: Int = -1
    var pressedTime = 0
    var guessed = ""
    var totalAnswered = 0
    var score = 0
    var currentQuestion = 0
    var correctAns = 0
    var numOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeRight.direction = .right
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        if (sender.direction == .right) {
            performSegue(withIdentifier: "segueAnswer", sender: self)
        } else if (sender.direction == .left) {
            totalAnswered = 0
            correctAns = 0
            performSegue(withIdentifier: "goBackHome", sender: self)
        }
    }
    
    
    @IBAction func A1_Action(_ sender: Any) {
        clearAnswer()
        a1.setTitleColor(.red, for: .normal)
        pressedTime += 1
        guessed = a1.title(for: .normal)!
    }
    
    
    @IBAction func A2_Action(_ sender: Any) {
        clearAnswer()
        a2.setTitleColor(.red, for: .normal)
        pressedTime += 1
        guessed = a2.title(for: .normal)!
    }
    
    @IBAction func A3_Action(_ sender: Any) {
        clearAnswer()
        a3.setTitleColor(.red, for: .normal)
        pressedTime += 1
        guessed = a3.title(for: .normal)!
    }
    
    @IBAction func A4_Action(_ sender: Any) {
        clearAnswer()
        a4.setTitleColor(.red, for: .normal)
        pressedTime += 1
        guessed = a4.title(for: .normal)!
    }
    
  
    func newQuestion() {
        question.numberOfLines = 3
        question.text = jsonData?[categoryIndex].questions[currentQuestion].text
        question.font = UIFont.italicSystemFont(ofSize: 18.0)
        numOfQuestions = (jsonData?[categoryIndex].questions.count)!
        print(categoryIndex)
        print(currentQuestion)
        a1.setTitle(jsonData?[categoryIndex].questions[currentQuestion].answers[0], for: .normal)
        a2.setTitle(jsonData?[categoryIndex].questions[currentQuestion].answers[1], for: .normal)
        a3.setTitle(jsonData?[categoryIndex].questions[currentQuestion].answers[2], for: .normal)
        a4.setTitle(jsonData?[categoryIndex].questions[currentQuestion].answers[3], for: .normal)
        correctAns = Int((jsonData?[categoryIndex].questions[currentQuestion].answer)!)!
    }
    
    func clearAnswer() {
        if (pressedTime == 1) {
            a1.setTitleColor(UIView().tintColor, for: .normal)
            a2.setTitleColor(UIView().tintColor, for: .normal)
            a3.setTitleColor(UIView().tintColor, for: .normal)
            a4.setTitleColor(UIView().tintColor, for: .normal)
            pressedTime = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(_ sender: Any) {
        performSegue(withIdentifier: "goBackHome", sender: self)
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        totalAnswered += 1
        let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "AnswerViewController") as! AnswerViewController
        thirdVC.guessed = guessed
        thirdVC.que = question.text!
        thirdVC.ans = correctAns
        thirdVC.totalAnswered = totalAnswered
        thirdVC.score = score
        thirdVC.curQue = currentQuestion
        thirdVC.categoryIndex = categoryIndex
        thirdVC.jsonData = jsonData
        thirdVC.numOfQuestions = numOfQuestions
        self.present(thirdVC, animated: false, completion: nil)
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
