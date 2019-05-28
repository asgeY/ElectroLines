//
//  LognInVC.swift
//  ElectroLine
//
//  Created by Asgedom Yohannes on 5/27/19.
//  Copyright © 2019 Asgedom Yohannes. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func forgetClicked(_ sender: Any) {
        
    }
    
    @IBAction func logInClicked(_ sender: Any) {
        
        guard let email = emailTxt.text, email.isEmpty,
            let password = passwordTxt.text, password.isEmpty else {return}
        self.spinner.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password ) { (result, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
                
                return
            }
            self.spinner.stopAnimating()
            self.dismiss(animated: true, completion: nil)
        }
    }
}




