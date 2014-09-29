//
//  ViewController.swift
//  FullTableView
//
//  Created by Valerio Ferrucci on 29/09/14.
//  Copyright (c) 2014 Tabasoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    let nRows = 5
    
    /*
    iOS 7.1
    viewDidLoad tableH=548.0, rowHeight=44.0
    viewWillAppear
    viewDidLayoutSubviews tableH=548.0
    viewDidAppear

    iOS 8.0
    viewDidLoad tableH=548.0, rowHeight=-1.0    // default rowHeight is -1 (UITableViewAutomaticDimension)
    viewWillAppear
    viewDidLayoutSubviews tableH=548.0
    viewDidLayoutSubviews tableH=548.0          // mmh... 2 volte?
    viewDidAppear

    */
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        /*
        Se sei su iOS7 e non hai una launch image 640x1136, la app parte a 480 di H
        */
        let tableH = tableView.bounds.size.height
        let version:NSString = UIDevice.currentDevice().systemVersion as NSString
        println("iOS \(version)")
        println("viewDidLoad tableH=\(tableH), rowHeight=\(tableView.rowHeight)")

    }

    //MARK: Subview layout finished
    override func viewWillAppear(animated: Bool) {
        
        println("viewWillAppear")
    }
    override func viewDidAppear(animated: Bool) {
        
        println("viewDidAppear")
    }
    override func viewDidLayoutSubviews() {
        
        let tableH = tableView.bounds.size.height
        let rowH = tableH / CGFloat(nRows)
        tableView.rowHeight = rowH

        println("viewDidLayoutSubviews tableH=\(tableH)")

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

