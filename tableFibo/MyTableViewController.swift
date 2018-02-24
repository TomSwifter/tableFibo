//
//  MyTableViewController.swift
//  tableFibo
//
//  Created by Tomer Aharoni on 2/23/18.
//  Copyright © 2018 Tomer Aharoni. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    var n = 2 //compute fib up to this value
    var fibArray : [Double] = []
    var lastfib = 1
    var secLastFib = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //init an array with all the fib values up to MAX_INt
        //getNextFibTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Int(INT_MAX)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.label.text = String(getNextfib(idx: indexPath.row))
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let actualPosition: CGFloat = scrollView.contentOffset.y
        let contentHeight: CGFloat = scrollView.contentSize.height - 10
        if actualPosition > contentHeight
        {
            
            print("user scrolled gettine next fib")
            tableView.reloadData()
        }
        
    }
    

    func getNextfib(idx: Int) -> Int {
        if (idx == 0 || idx == 1)
        {
            return 1
        }
        else
        {
            return getNextfib(idx: idx-1) + getNextfib(idx: idx-2)
        }
        
    }
    


}
