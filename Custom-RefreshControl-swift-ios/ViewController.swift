//
//  ViewController.swift
//  Custom-RefreshControl-swift-ios
//
//  Created by Aman Aggarwal on 12/05/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblList: UITableView!
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addRefreshControl()
    }
    
    func addRefreshControl() {
        
        guard let customView = Bundle.main.loadNibNamed("CustomRefreshView", owner: nil, options: nil) else {
            return
        }
        
        guard let refreshView = customView[0] as? UIView else {
            return
        }
        
        refreshView.tag = 12052018
        refreshView.frame = refreshControl.frame
        refreshControl.addSubview(refreshView)
        
        refreshControl.tintColor = UIColor.clear
        refreshControl.backgroundColor = UIColor.clear
        
        refreshControl.addTarget(self, action: #selector(refreshContents), for: .valueChanged)
        if #available(iOS 10.0, *) {
            tblList.refreshControl = refreshControl
        } else {
            tblList.addSubview(refreshControl)
        }
    }

    @objc func refreshContents() {
        let refreshView = refreshControl.viewWithTag(12052018)
        
        for vw in (refreshView?.subviews)! {
                if let titleLable = vw as? UILabel {
                    titleLable.text = "Refreshing contents"
                }
        }
        self.perform(#selector(finishedRefreshing), with: nil, afterDelay: 3.0)
    }
    
    @objc func finishedRefreshing() {
        refreshControl.endRefreshing()
        let refreshView = refreshControl.viewWithTag(12052018)
        
        for vw in (refreshView?.subviews)! {
            if let titleLable = vw as? UILabel {
                titleLable.text = "Pull down to refresh this list"
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

