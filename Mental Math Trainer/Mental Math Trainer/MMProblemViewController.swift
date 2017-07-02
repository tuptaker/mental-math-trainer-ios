//
//  MMProblemViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 5/30/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMProblemViewController: UIViewController {
    var currentCategory = Category(rawValue: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? MMProblemContainerViewController {
            destinationVC.currentCategory = self.currentCategory
        }
    }

}
