//
//  AcopiosViewController.swift
//  Sismo
//
//  Created by Alberto Huerdo on 9/21/17.
//  Copyright © 2017 huerdo. All rights reserved.
//

import UIKit

class AcopiosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var table = UITableView()
    var centers = NSArray ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUIElements()
//        ApiManager.shared.getAcopios { (response, error) in
//            print(response)
//            print(error as Any)
//        }
        ApiManager.shared.getAcopios2 { (data, result) -> Void in
            
            if (result){
                self.centers = data
                self.table.reloadData()
            }
            else{
                // something wrong
            }
            
        }
        
    }
    func loadUIElements(){
        table.frame = UIElements.createFrame(x: 0, y: 0, w: self.view.frame.size.width, h: self.view.frame.size.height)
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = Colors.gray
        table.rowHeight     = 300 // idn
        table.register(CenterTableViewCell.self, forCellReuseIdentifier: "CentersCells")
        
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        

        self.view.addSubview(table)
        
    }
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.centers.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.table.dequeueReusableCell(withIdentifier: "CentersCells", for: indexPath) as! CenterTableViewCell
        cell.useData(self.centers[(indexPath as NSIndexPath).row] as! NSDictionary)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

