//
//  MMCategoriesTableViewController.swift
//  Mental Math Trainer
//
//  Created by Fabricio Machado on 5/27/17.
//  Copyright © 2017 Fabricio Machado. All rights reserved.
//

import UIKit

class MMCategoriesTableViewController: UITableViewController {
    
    var selectedCategory: Category?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Category.caseCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoryCell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)

        categoryCell.textLabel?.text = Category(rawValue: indexPath.row)?.summary().title
        categoryCell.detailTextLabel?.text = Category(rawValue: indexPath.row)?.summary().subTitle

        return categoryCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCategory = Category(rawValue: indexPath.row)
        self.performSegue(withIdentifier: "showProblemSet", sender: self)
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? MMProblemViewController {
            destinationVC.currentCategory = self.selectedCategory
        }
     }
    
}
