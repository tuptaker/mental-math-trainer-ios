//
//  MMBaseProblemViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 6/3/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMBaseProblemViewController: UIViewController {
    var currentProblem: MMProblem?
    var currentlySelectedIndexPath: IndexPath?
    var rightAnswers = 0
    var wrongAnswers = 0
    var mmBlueColor = UIColor(colorLiteralRed: 87.0/255.0, green: 147.0/255.0, blue: 247.0/255.0, alpha: 1)
    var mmGreenColor = UIColor(colorLiteralRed: 61.0/255.0, green: 132.0/255.0, blue: 79.0/255.0, alpha: 1)
    var mmRedColor = UIColor(colorLiteralRed: 167.0/255.0, green: 42.0/255.0, blue: 36.0/255.0, alpha: 1)
    @IBOutlet weak var multTableCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func dismissAndUpdateCellWithAnswer(answer: Int, for path: IndexPath) {
    }
    
    func dismissAnswerDialog() {
    }
    
    func updateVisualizationForCurrentAnswers() {
    }
}
