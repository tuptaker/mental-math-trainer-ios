//
//  MMEightByNineViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 6/3/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMEightByNineViewController: MMBaseProblemViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var multTableCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellView =  UINib(nibName: "MMMultTableCollectionViewCell", bundle: nil)

        self.multTableCollectionView.register(cellView, forCellWithReuseIdentifier: "multTableCell")
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let multTableCell = collectionView.dequeueReusableCell(withReuseIdentifier: "multTableCell", for: indexPath)
        return multTableCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 9
    }
}
