//
//  ViewController.swift
//  ElectroLine
//
//  Created by Asgedom Yohannes on 5/27/19.
//  Copyright © 2019 Asgedom Yohannes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    override func viewDidAppear(_ animated: Bool) {
        let storyBoard = UIStoryboard(name: Storyboard.LogInStoryboard, bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: StoryboardId.LogInVC)
        present(controller, animated: true, completion: nil)
    }

}

