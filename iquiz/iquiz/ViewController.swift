//
//  ViewController.swift
//  iquiz
//
//  Created by Arman Shah on 10/29/18.
//  Copyright © 2018 Arman Shah. All rights reserved.
//

import UIKit

struct Quiz: Codable {
    let title: String
    let desc: String
    let questions: [Question]
}

struct Question: Codable {
    let text: String
    let answer: String
    let answers: [String]
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    var urlTextField: UITextField = UITextField()
    let defaults = UserDefaults.standard
    var jsonData: [Quiz]? = nil
    var titles: [String] = []
    var descriptions: [String] = []
    var elements: [String] = ["sports", "games", "music"]
    var jsonUrlString: String = UserDefaults.standard.string(forKey: "url") ?? "https://pastebin.com/raw/xqZCWZtS"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonData?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell") as! TableViewCell
        cell.subjectDesc.text = jsonData?[indexPath.row].desc
        cell.subject.text = jsonData?[indexPath.row].title
        cell.subject.font = UIFont.boldSystemFont(ofSize: 18.0)
        cell.quizImage.image = UIImage(named: "default")
        //check if title has icon if not use default.
        for  i  in 0...elements.count-1{
            if((cell.subject.text?.lowercased().range(of: elements[i])) != nil){
                cell.quizImage.image = UIImage(named: elements[i])
            }
        }
        
        return cell
    }
    
    @IBAction func settingsClicked(_ sender: Any) {
        let uiAlert = UIAlertController(title: "Settings", message: "JSON URL", preferredStyle: .alert)
        uiAlert.addTextField {(textField: UITextField) in
            self.urlTextField = textField
            self.urlTextField.placeholder = "Enter url"
        }
        uiAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        uiAlert.addAction(UIAlertAction(title: "Check", style: .default, handler:{
            (act: UIAlertAction) in
            if((self.urlTextField.text) != nil){
                self.fetchJson(self.urlTextField.text!)
            }
        }))
        self.present(uiAlert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showQuestion", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        if ((defaults.object(forKey: "url")) != nil) {
            self.jsonUrlString = defaults.object(forKey: "url") as! String
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(NetworkReachability.isConnectedToNetwork()){
            if(jsonData == nil){
                fetchJson(jsonUrlString)
            }
        }else{
            let alert = UIAlertController(title: "Offline", message: "Using local data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print("Offline, grabbing from user default");
            let anyData = defaults.object(forKey: "quizData")
            if(anyData == nil){
                let alert = UIAlertController(title: "No Local Data", message: "Connect to internet", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                let data = anyData as! Data
                do{
                    let questions = try JSONDecoder().decode([Quiz].self, from: data)
                    self.jsonData = questions
                    for q in questions{
                        self.titles.append(q.title)
                        self.descriptions.append(q.desc)
                    }
                }catch{
                    self.failDownloadAlert()
                }
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let categoryIndex = indexPath.row
            let questionView = segue.destination as! QuestionViewController
            questionView.jsonData = jsonData
            questionView.categoryIndex = categoryIndex
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchJson(_ fetchUrl: String){
        guard let url = URL(string: fetchUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {
                self.failDownloadAlert()
                return
            }
            self.defaults.set(fetchUrl, forKey: "url")
            self.defaults.set(data, forKey:"quizData")
            do{
                let questions = try JSONDecoder().decode([Quiz].self, from: data)
                self.jsonData = questions
                print(questions)
                for q in questions{
                    self.titles.append(q.title)
                    self.descriptions.append(q.desc)
                }
            }catch{
                self.failDownloadAlert()
            }
            
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
            }.resume()
    }
    
    func failDownloadAlert(){
        let alert = UIAlertController(title: "Failed to Download", message: "Please check internet or URL format", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
}

