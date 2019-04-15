//
//  MMTrueOrFalseViewController.swift
//  Mental Math Trainer
//
//  Created by Fabrizio Machado on 11/11/18.
//  Copyright © 2018 Fabricio Machado. All rights reserved.
//

import UIKit

class MMTrueOrFalseViewController: MMBaseProblemViewController {
    @IBOutlet weak var problemLabel: UILabel!
    @IBOutlet weak var solutionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.problemLabel.text = self.currentProblem?.expressionText
        self.solutionLabel.text = ""
    }
    
    @IBAction func answerTrue(_ sender: UIButton) {
        if (self.currentProblem?.solution == 1.0) {
            self.solutionLabel.text = "Correct!"
            self.solutionLabel.textColor = UIColor.blue
        } else {
            self.solutionLabel.text = "Incorrect!"
            self.solutionLabel.textColor = UIColor.red
        }
    }
    
    @IBAction func answerFalse(_ sender: UIButton) {
        if (self.currentProblem?.solution == 0.0) {
            self.solutionLabel.text = "Correct!"
            self.solutionLabel.textColor = UIColor.blue
        } else {
            self.solutionLabel.text = "Incorrect!"
            self.solutionLabel.textColor = UIColor.red
        }
    }
    
    @IBAction func checkYourAnswer(_ sender: UIButton) {
        if (self.currentProblem?.solution == 0.0) {
            self.solutionLabel.text = "The answer is FALSE"
            self.solutionLabel.textColor = UIColor.blue
        } else {
            self.solutionLabel.text = "The answer is TRUE"
            self.solutionLabel.textColor = UIColor.blue
        }
    }
    
    @IBAction func goToNextProblem(_ sender: UIButton) {
        if let parentVC = self.parent as? MMProblemContainerViewController {
            parentVC.generateNextProblemAndRefresh()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
