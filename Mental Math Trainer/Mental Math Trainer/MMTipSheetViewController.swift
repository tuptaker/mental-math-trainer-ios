//
//  MMTipSheetViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 5/29/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMTipSheetViewController: UIViewController {

    @IBOutlet weak var tipSheetLabel: UILabel!
    var tipSheetText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tipSheetLabel.text = self.tipSheetText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func goBackToProblem(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: { 
            //
        })
    }

}
