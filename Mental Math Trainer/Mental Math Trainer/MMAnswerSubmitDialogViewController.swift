//
//  MMAnswerSubmitDialogViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 6/9/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMAnswerSubmitDialogViewController: UIViewController {

    @IBOutlet weak var solutionField: UITextField!
    @IBOutlet weak var problemLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addDoneButtonOnKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelAnswerSubmission(_ sender: UIButton) {
    }
    
    @IBAction func submitAnswer(_ sender: UIButton) {
    }
    
    // NOTE: this addDoneButtonOnKeyboard method should be factored out into a protocol or something
    // because MMProblemSetViewController has this same code
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(MMProblemSetViewController.doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.solutionField.inputAccessoryView = doneToolbar
    }
    
    func doneButtonAction() {
        self.solutionField.resignFirstResponder()
    }
    

}
