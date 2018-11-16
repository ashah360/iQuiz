//
//  CompleteViewController.swift
//  iquiz
//
//  Created by Arman Shah on 11/5/18.
//  Copyright © 2018 Arman Shah. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {
    
    var appData = AppData.shared
    
    
    @IBOutlet weak var reaction: UILabel!
    @IBOutlet weak var result: UILabel!
    
    var finalScore = 0
    var subjectName = ""
    var res = ""
    var numOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (finalScore == numOfQuestions) {
            res = "Flawless!"
        }
        else if (finalScore > 0) {
            res = "Good"
        }
        else {
            res = "Try Again :("
        }
        reaction.numberOfLines = 2;
        reaction.text = res

        result.text = "You answered " + String(finalScore) + " out of " + String(numOfQuestions) + " questions correctly"
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func swipe(sender: UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            backPressed(sender)
        }
    }

    @IBAction func backPressed(_ sender: Any) {
        performSegue(withIdentifier: "goBackHome", sender: self)
        appData.numGuessed = 0
        appData.numRight = 0
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
