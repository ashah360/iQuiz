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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if (appData.numRight == 4) {
            reaction.text = "Flawless!"
        }
        else if (appData.numRight == 2 || appData.numRight == 3) {
            reaction.text = "You were close!"
        }
        else {
            reaction.text = "*cue sad violin*"
        }
        result.text = "You answered " + String(appData.numRight) + " out of 4 questions correctly"
        
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
