//
//  MMTipSheetViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 5/29/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMTipSheetViewController: UIViewController {

    @IBOutlet weak var tipSheetTextView: UITextView!
    var tipSheetText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tipSheetTextView.text = self.tipSheetText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func goBackToProblem(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: { 
        })
    }

}
