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
    @IBAction func signUpButton(_ sender: UIButton) {
        let email = emailField.text
        let password = passwordField.text
        
        Auth.auth().createUser(withEmail: email!, password: password!, completion: { (user: User?, error) in
            if error == nil {
                print("WOO")
            }else{
                print("Boo")
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
