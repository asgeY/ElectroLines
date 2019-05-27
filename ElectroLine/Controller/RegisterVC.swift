//
//  RegisterVC.swift
//  ElectroLine
//
//  Created by Asgedom Yohannes on 5/27/19.
//  Copyright © 2019 Asgedom Yohannes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterVC: UIViewController {
    
    @IBOutlet weak var userLbl: UITextField!
    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var newPassLbl: UITextField!
    @IBOutlet weak var confirmPassLbl: UITextField!
    @IBOutlet weak var passCheckImg: UIImageView!
    @IBOutlet weak var confirmPassCheckImg: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newPassLbl.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: UIControl.Event.editingChanged)
        confirmPassLbl.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: UIControl.Event.editingChanged)
    }
    
    //Mark:- checkImage function check new paswword and confirm password match change to green
    
    @objc func textFieldDidChanged (_ textField: UITextField ) {
        
        //when we start typing we need to show the checkmarks.
        
        if textField == confirmPassLbl {
            passCheckImg.isHidden = false
            confirmPassCheckImg.isHidden = false
            
        } else if textField.text == "" {
            passCheckImg.isHidden = true
            confirmPassCheckImg.isHidden = true
        }
        
        if newPassLbl.text == confirmPassLbl.text {
            passCheckImg.image = UIImage(named: AppImages.GreenCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.GreenCheck)
        }else {
            passCheckImg.image = UIImage(named: AppImages.redCheck)
            confirmPassCheckImg.image = UIImage(named: AppImages.redCheck)
        }
    }
    
    
@IBAction func registerBtn(_ sender: Any) {
        
        guard let email = emailLbl.text, email.isNotEmpty,
            let userName = userLbl.text, userName.isNotEmpty,
            let password = newPassLbl.text, !password.isEmpty else {return}
        spinner.startAnimating()
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                debugPrint(error)
                return
            }
            self.spinner.startAnimating()
            print("registred user")
        }
        
    }
    
}

//if emailLbl.text == "" {
//    let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
//
//    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//    alertController.addAction(defaultAction)
//    spinner.stopAnimating()
//    present(alertController, animated: true, completion: nil)
//
//} else {
//    Auth.auth().createUser(withEmail: emailLbl.text!, password: newPassdLbl.text!) { (user, error) in
//
//        if error == nil {
//            self.spinner.stopAnimating()
//            debugPrint(error .customMirror, "You have successfully signed up")
//
//            //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
//
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
//            self.present(vc!, animated: true, completion: nil)
//
//        } else {
//            let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//
//            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//            alertController.addAction(defaultAction)
//
//            self.present(alertController, animated: true, completion: nil)
//        }
//    }
//}
//}
//
