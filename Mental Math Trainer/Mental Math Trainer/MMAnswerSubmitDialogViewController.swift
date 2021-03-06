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
    var expressionText = ""
    var selectedIndexPath: IndexPath?
    var parentVC: MMBaseProblemViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let selectedPath = self.selectedIndexPath {
            self.expressionText = self.generateExpressionTextFromSelectedIndexPath(path:selectedPath)
        }
        
        self.addDoneButtonOnKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.problemLabel.text = self.expressionText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelAnswerSubmission(_ sender: UIButton) {
        self.parentVC?.dismissAnswerDialog()
    }
    
    @IBAction func submitAnswer(_ sender: UIButton) {
        if let answerText = self.solutionField.text, let answer = Int(answerText), let indexPath = self.selectedIndexPath {
            self.parentVC?.dismissAndUpdateCellWithAnswer(answer: answer, for: indexPath)
        }
    }
    
    func generateExpressionTextFromSelectedIndexPath(path: IndexPath) -> String {
        var expressionText = "Unable to generate expression"

        if let problemType = self.parentVC?.currentProblem?.problemType {
            switch problemType {
            case "eightByNineTable":
                expressionText = "\(path.row + 1) × \(path.section + 10)"
            case "tenByTenTable":
                expressionText = "\(path.row) × \(path.section)"
            case "elevenToNineteenTable":
                expressionText = "\(path.row + 10) × \(path.section + 10)"
            default:
                expressionText = "Unable to generate expression"
            }
        }
        
        return expressionText
    }
    
    // NOTE: this addDoneButtonOnKeyboard method should be factored out into a protocol or something
    // because MMProblemSetViewController has this same code
    func addDoneButtonOnKeyboard() {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(MMProblemSetViewController.doneButtonAction))
        
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
