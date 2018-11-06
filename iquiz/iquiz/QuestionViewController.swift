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
    var answerSelected = ""
    var numRight = 0
    var questionCount = 0
    
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
            appData.numGuessed = 0
            appData.numRight = 0
            performSegue(withIdentifier: "goBackHome", sender: self)
        }
    }
    
    
    @IBAction func A1_Action(_ sender: Any) {
        buttonClicked()
        answerSelected = a1.titleLabel!.text!
        a1.backgroundColor = UIColor.lightGray
        a1.setTitleColor(UIColor.white, for: .normal)
        appData.correctAnswer = (answerSelected == appData.answerText)
    }
    
    
    @IBAction func A2_Action(_ sender: Any) {
        buttonClicked()
        answerSelected = a2.titleLabel!.text!
        a2.backgroundColor = UIColor.lightGray
        a2.setTitleColor(UIColor.white, for: .normal)
        appData.correctAnswer = (answerSelected == appData.answerText)
    }
    
    @IBAction func A3_Action(_ sender: Any) {
        buttonClicked()
        answerSelected = a3.titleLabel!.text!
        a3.backgroundColor = UIColor.lightGray
        a3.setTitleColor(UIColor.white, for: .normal)
        appData.correctAnswer = (answerSelected == appData.answerText)
    }
    
    @IBAction func A4_Action(_ sender: Any) {
        buttonClicked()
        answerSelected = a4.titleLabel!.text!
        a4.backgroundColor = UIColor.lightGray
        a4.setTitleColor(UIColor.white, for: .normal)
        appData.correctAnswer = (answerSelected == appData.answerText)
    }
    
    func buttonClicked() {
        a1.backgroundColor = UIColor.white
        a1.setTitleColor(UIColor.black, for: .normal)
        
        a2.backgroundColor = UIColor.white
        a2.setTitleColor(UIColor.black, for: .normal)
        
        a3.backgroundColor = UIColor.white
        a3.setTitleColor(UIColor.black, for: .normal)
        
        a4.backgroundColor = UIColor.white
        a4.setTitleColor(UIColor.black, for: .normal)
    }

    func newQuestion() {
        let numGuessed = appData.numGuessed
        switch appData.topicIndex {
        case 0:
            question.text = appData.sportsQuestions[numGuessed]
            appData.questionText = appData.sportsQuestions[numGuessed]
            a1.setTitle(appData.sportsChoices[numGuessed][0], for: .normal)
            a2.setTitle(appData.sportsChoices[numGuessed][1], for: .normal)
            a3.setTitle(appData.sportsChoices[numGuessed][2], for: .normal)
            a4.setTitle(appData.sportsChoices[numGuessed][3], for: .normal)
            appData.answerText = appData.sportsAnswers[numGuessed]
        case 1:
            question.text = appData.gameQuestions[numGuessed]
            appData.questionText = appData.gameQuestions[numGuessed]
            a1.setTitle(appData.gameChoices[numGuessed][0], for: .normal)
            a2.setTitle(appData.gameChoices[numGuessed][1], for: .normal)
            a3.setTitle(appData.gameChoices[numGuessed][2], for: .normal)
            a4.setTitle(appData.gameChoices[numGuessed][3], for: .normal)
            appData.answerText = appData.gameAnswers[numGuessed]
        default:
            question.text = appData.musicQuestions[numGuessed]
            appData.questionText = appData.musicQuestions[numGuessed]
            a1.setTitle(appData.musicChoices[numGuessed][0], for: .normal)
            a2.setTitle(appData.musicChoices[numGuessed][1], for: .normal)
            a3.setTitle(appData.musicChoices[numGuessed][2], for: .normal)
            a4.setTitle(appData.musicChoices[numGuessed][3], for: .normal)
            appData.answerText = appData.musicAnswers[numGuessed]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backPressed(_ sender: Any) {
        performSegue(withIdentifier: "goBackHome", sender: self)
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
