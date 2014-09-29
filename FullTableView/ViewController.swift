//
//  ViewController.swift
//  FullTableView
//
//  Created by Valerio Ferrucci on 29/09/14.
//  Copyright (c) 2014 Tabasoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let nRows = 50
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: Subview layout finished
    override func viewDidLayoutSubviews() {
        
        let tableH = tableView.bounds.size.height
        let rowH = tableH / CGFloat(nRows)
        tableView.rowHeight = rowH
        
        //view.layoutIfNeeded()
    }

    
    //MARK: TableView data source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return nRows
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        cell.textLabel?.text = String(indexPath.row)
        
        return cell
    }

}

