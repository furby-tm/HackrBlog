//
//  ViewController.swift
//  HackrBlog
//
//  Created by Tyler Furby on 5/3/18.
//  Copyright © 2018 Furby Studios. All rights reserved.
//

import UIKit
import Firebase

class ForumViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var displayUser: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let examplePosts = ["Programming in Swift is great", "Xcode is really buggy", "Does anyone who works at Apple actually use Xcode","Hello World"]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if (cell == nil) {
            cell = ThreadCell()
        }
        
        (cell as! ThreadCell).threadTitleCell.text = examplePosts[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examplePosts.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let userID = Auth.auth().currentUser?.uid
        
        // TODO: Set up for userID
        let ref = Database.database().reference().child("users").child((userID)!)
        
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            
            if !snapshot.exists() { return }
            if let fullName = snapshot.childSnapshot(forPath: "fullname").value as? String {
                //Do not cast print it directly may be score is Int not string
                self.displayUser.text = "Hello, " + fullName + "."
            }
        })
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

