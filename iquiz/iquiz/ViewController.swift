//
//  ViewController.swift
//  iquiz
//
//  Created by Arman Shah on 10/29/18.
//  Copyright © 2018 Arman Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var appData = AppData.shared
    
    var quizSubjects = ["Sports", "Games", "Music"]
    var subjectDescs = ["Lets get sweaty", "Video Games", "Feel the melody"]
    var imgs = ["sports", "games", "music"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as! TableViewCell
        cell.subject.text = self.quizSubjects[indexPath.row]
        cell.subjectDesc.text = self.subjectDescs[indexPath.row]
        cell.imageView?.image = UIImage(named: self.imgs[indexPath.row])
        cell.imageView?.contentMode = .scaleAspectFit
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizSubjects.count //3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appData.topicIndex = indexPath.row
        performSegue(withIdentifier: "showQuestion", sender: self)
    }
    
    
    @IBAction func clickSettings(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Coming soon!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { _ in
                                        NSLog("OK button was pressed")
        }))
        self.present(alert, animated: true, completion: {
            NSLog("The completion handler fired")
        })
    }
    
    
}

