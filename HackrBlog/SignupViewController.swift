//
//  ViewController.swift
//  HackrBlog
//
//  Created by Tyler Furby on 5/3/18.
//  Copyright © 2018 Furby Studios. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var fullNameField: UITextField!
    
    @IBAction func signupButton(_ sender: UIButton) {
        // Grab email and password values from UITextFields
        let email = emailField.text
        let password = passwordField.text
        let username = usernameField.text
        let fullName = fullNameField.text
        
        // Authenticate and create email and password for user through Firebase
        Auth.auth().createUser(withEmail: email!, password: password!, completion: { (user: User?, error) in
            // If there are no errors
            if error == nil {
                // Continue to Forum View Controller
                let ref = Database.database().reference()
                
                let post = [
                    "username":  username,
                    "fullname": fullName,
                    "email":   email
                ]
                
                ref.child("users").child((user?.uid)!).setValue(post)
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                
                let forumViewController = storyBoard.instantiateViewController(withIdentifier: "forumViewController") as UIViewController
                self.present(forumViewController, animated:true, completion:nil)
            // Otherwise, if there's an error with the username/password combination
            } else {
                // Alert the user there was a problem signing up
                let alert = UIAlertController(title: "Error", message: "This account already exists, please try signing in.", preferredStyle: UIAlertControllerStyle.alert)
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
        let usernameBorder = CALayer()
        let fullNameBorder = CALayer()
        let width = CGFloat(2.0)
        let pinkColor = UIColor(red: 255/255, green: 75/255, blue: 102/255, alpha: 1.0)
        emailBorder.borderColor = pinkColor.cgColor
        passwordBorder.borderColor = pinkColor.cgColor
        usernameBorder.borderColor = pinkColor.cgColor
        fullNameBorder.borderColor = pinkColor.cgColor
        emailBorder.frame = CGRect(x: 0, y: emailField.frame.size.height - width, width:  emailField.frame.size.width, height: emailField.frame.size.height)
        passwordBorder.frame = CGRect(x: 0, y: passwordField.frame.size.height - width, width:  passwordField.frame.size.width, height: passwordField.frame.size.height)
        usernameBorder.frame = CGRect(x: 0, y: usernameField.frame.size.height - width, width:  usernameField.frame.size.width, height: usernameField.frame.size.height)
        fullNameBorder.frame = CGRect(x: 0, y: fullNameField.frame.size.height - width, width:  fullNameField.frame.size.width, height: fullNameField.frame.size.height)
        
        emailBorder.borderWidth = width
        emailField.layer.addSublayer(emailBorder)
        emailField.layer.masksToBounds = true
        passwordBorder.borderWidth = width
        passwordField.layer.addSublayer(passwordBorder)
        passwordField.layer.masksToBounds = true
        usernameBorder.borderWidth = width
        usernameField.layer.addSublayer(usernameBorder)
        usernameField.layer.masksToBounds = true
        fullNameBorder.borderWidth = width
        fullNameField.layer.addSublayer(fullNameBorder)
        fullNameField.layer.masksToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

