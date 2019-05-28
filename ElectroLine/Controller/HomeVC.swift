//
//  ViewController.swift
//  ElectroLine
//
//  Created by Asgedom Yohannes on 5/27/19.
//  Copyright © 2019 Asgedom Yohannes. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class HomeVC: UIViewController {

    @IBOutlet weak var logInOutBtn: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = Auth.auth().currentUser {
            logInOutBtn.title = "LogOut"
        }else {
            logInOutBtn.title = "LogIn"
        }
    }
    
    fileprivate func PresentLogInController() {
        let storyBoard = UIStoryboard(name: Storyboard.LoginStoryboard, bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: StoryboardId.LoginVC)
        present(controller, animated: true, completion: nil)
    }
    
   
    @IBAction func logInOutAction(_ sender: Any) {
        
        if let _ = Auth.auth().currentUser {
            do {
                try Auth.auth().signOut()
                PresentLogInController()
            }catch {
                debugPrint(error.localizedDescription)
                
            }
        }else {
            PresentLogInController()
        }
    }
    
}

