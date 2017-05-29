//
//  MMProblemSetViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 5/28/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMProblemSetViewController: UIViewController {
    var currentCategory = Category(rawValue: 0)
    var problemGenerator = MMProblemGenerator.sharedInstance
    var currentProblem: MMProblem?
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var solutionField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addDoneButtonOnKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.currentProblem = self.generateProblem()
        self.updateProblemLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkYourAnswer(_ sender: UIButton) {
        print("Tapped checkYourAnswer")
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
        print("Tapped moveToNextProblem")
        self.doneButtonAction()
        self.solutionField.text = ""
        self.answerLabel.text = ""
        self.answerLabel.alpha  = 0
        self.currentProblem = self.generateProblem()
        self.updateProblemLabels()
    }
    
    @IBAction func showTipSheetForThisProblemSet(_ sender: UIButton) {
        print("Tapped showTipSheetForThisProblemSet")
        self.doneButtonAction()
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
    
    func generateProblem() -> MMProblem {
        let currentProblem = self.problemGenerator.generateFor(problemCategory: self.currentCategory!)
        return currentProblem
    }
    
    func updateProblemLabels() {
        self.problemLabel.text = self.currentProblem?.expressionText
    }

}
