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
    
    var correctAnswer = false
    var numGuessed = 0
    var questionCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appData.numGuessed+=1
        
        question.text = appData.questionText
        answer.text = appData.answerText
        if appData.correctAnswer {
            appData.numRight+=1
        }
        
        reaction.text = appData.correctAnswer ? "Awesome!" : ":("
        
        answer.backgroundColor = appData.correctAnswer ? #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) : #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        answer.textColor = UIColor.white
        
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
        let numGuessed = appData.numGuessed
        print(numGuessed)
        if (numGuessed < 4) {
            let destination = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
            self.present(destination, animated: true, completion: nil)
        } else {
            let destination = self.storyboard?.instantiateViewController(withIdentifier: "CompleteViewController") as! CompleteViewController
            self.present(destination, animated: true, completion: nil)
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
