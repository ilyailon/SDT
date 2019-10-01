
//
//  ViewController.swift
//  myChat
//
//  Created by Sunrise on 19/04/2019.
//  Copyright © 2019 Sunrise. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper


class LoginVC: UIViewController {
    
    var userUid: String!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: "uid"){
            performSegue(withIdentifier: "toMessages", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSignUp" {
            if  let destination = segue.destination as? SignUpVC {
                if self.userUid != nil {
                    destination.userUid = userUid
                }
                if self.emailField.text != nil {
                    destination.emailField = emailField.text
                }
                
                if self.passwordField.text != nil {
                    destination.passwordField = passwordField.text
                }
            }
        }
    }
    @IBAction func SingIn (_ sender: AnyObject){
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
                guard self != nil else { return }
                if error == nil  {
                    self!.userUid = user?.user.uid
                    KeychainWrapper.standard.set(self!.userUid, forKey: "uid")
                    self?.performSegue(withIdentifier: "toMessages", sender: nil)
                } else {
                    self?.performSegue(withIdentifier: "toSignUp", sender: nil)
                }
                
            }
        }
    }
}
