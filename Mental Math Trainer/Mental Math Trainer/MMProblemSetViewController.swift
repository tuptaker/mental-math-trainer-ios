//
//  MMProblemSetViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 5/28/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMProblemSetViewController: MMBaseProblemViewController {
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var solutionField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addDoneButtonOnKeyboard()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            if (appDelegate.engine == nil)
            {
                print(appDelegate.engineErrorMessage!)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateProblemLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tipSheetVC = segue.destination as? MMTipSheetViewController,
            let tipSheetText = self.currentProblem?.tipSheetText {
            tipSheetVC.tipSheetText = tipSheetText
        }
    }
    
    @IBAction func checkYourAnswer(_ sender: UIButton) {
        self.doneButtonAction()
        
        let correctAnswer = Int((self.currentProblem?.solution)!)
        
        if let typedAnswer = self.solutionField.text, let typedAnswerInt = Int(typedAnswer), typedAnswerInt == correctAnswer {
                self.answerLabel.text = "Correct! Answer is \(correctAnswer)."
                self.answerLabel.textColor = UIColor.blue
        } else {
            self.answerLabel.text = "Incorrect! Answer is \(correctAnswer)."
            self.answerLabel.textColor = UIColor.red
        }

        self.answerLabel.alpha = 1
    }
    
    @IBAction func moveToNextProblem(_ sender: UIButton) {
        self.doneButtonAction()
        self.solutionField.text = ""
        self.answerLabel.text = ""
        self.answerLabel.alpha  = 0
        if let parentVC = self.parent as? MMProblemContainerViewController {
            parentVC.generateNextProblemAndRefresh()
        }
    }
    
    @IBAction func showTipSheetForThisProblemSet(_ sender: UIButton) {
        self.doneButtonAction()
        if let parentVC = self.parent as? MMProblemContainerViewController, let tipText = self.currentProblem?.tipSheetText {
            parentVC.showTipSheet(tipVerbiage: tipText)
        }
    }

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

    func updateProblemLabels() {
        self.problemLabel.text = self.currentProblem?.expressionText
    }

}
