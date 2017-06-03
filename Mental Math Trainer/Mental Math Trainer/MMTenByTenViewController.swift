//
//  MMTenByTenViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 6/3/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMTenByTenViewController: MMBaseProblemViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func checkYourAnswer(_ sender: UIButton) {
    }

    @IBAction func moveToNextProblem(_ sender: UIButton) {
        if let parentVC = self.parent as? MMProblemContainerViewController {
            parentVC.generateNextProblemAndRefresh()
        }
    }
    
    @IBAction func showTipSheetForThisProblemSet(_ sender: UIButton) {
        if let parentVC = self.parent as? MMProblemContainerViewController, let tipText = self.currentProblem?.tipSheetText {
            parentVC.showTipSheet(tipVerbiage: tipText)
        }
    }
}
