//
//  ViewController.swift
//  HackrBlog
//
//  Created by Tyler Furby on 5/3/18.
//  Copyright © 2018 Furby Studios. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func loginButton(_ sender: UIButton) {
        // Grab email and password values from UITextFields
        let email = emailField.text
        let password = passwordField.text
        
        // Authenticate email and password for user through Firebase
        Auth.auth().signIn(withEmail: email!, password: password!, completion: { (user: User?, error) in
                // If there are no errors
                if error == nil{
                    // Continue to Forum View Controller
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    
                    let forumViewController = storyBoard.instantiateViewController(withIdentifier: "forumViewController") as UIViewController
                    self.present(forumViewController, animated:true, completion:nil)
                // Otherwise, if there's an error with the username/password combination
                } else {
                    // Alert the user there was a problem signing in
                    let alert = UIAlertController(title: "Error", message: "Incorrect email/password combination.", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        switch action.style{
                        case .default:
                            print("default")
                            
                        case .cancel:
                            print("cancel")
                            
                        case .destructive:
                            print("destructive")
                            
                            
                        }}))
                    self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let emailBorder = CALayer()
        let passwordBorder = CALayer()
        let width = CGFloat(2.0)
        let pinkColor = UIColor(red: 255/255, green: 75/255, blue: 102/255, alpha: 1.0)
        emailBorder.borderColor = pinkColor.cgColor
        passwordBorder.borderColor = pinkColor.cgColor
        emailBorder.frame = CGRect(x: 0, y: emailField.frame.size.height - width, width:  emailField.frame.size.width, height: emailField.frame.size.height)
        passwordBorder.frame = CGRect(x: 0, y: passwordField.frame.size.height - width, width:  emailField.frame.size.width, height: passwordField.frame.size.height)
        
        emailBorder.borderWidth = width
        emailField.layer.addSublayer(emailBorder)
        emailField.layer.masksToBounds = true
        passwordBorder.borderWidth = width
        passwordField.layer.addSublayer(passwordBorder)
        passwordField.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

