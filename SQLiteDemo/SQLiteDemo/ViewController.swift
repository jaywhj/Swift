//
//  ViewController.swift
//  SQLiteDemo
//
//  Created by JayWon on 14-11-6.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var data = [Person]()
    private let identify:String = "kCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //注册单元格的类型
        table.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: identify)
    }
    /*
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        data = Database.instance.findAllUsers()
        if data.count == 0 {
            for i in 0..<20 {
                var ps = Person(name:"无限互联\(i)", pwd:"admin\(i)", email:"123@qq.com", age:23)
                println("add user\(i) result \(Database.instance.addUser(ps))")
                
                data += [ps]
            }
        }
        
        table.reloadData()
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // UITableView Delegates
    func tableView(tv:UITableView, numberOfRowsInSection section:Int) -> Int {
        return data.count
    }
    
    func tableView(tv:UITableView, cellForRowAtIndexPath indexPath:NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tv.dequeueReusableCellWithIdentifier(identify, forIndexPath: indexPath) as UITableViewCell
        
        let user = data[indexPath.row]
        cell.textLabel.text = "用户名:" + user.name! + "   密码:" + user.password!

        return cell
    }

}

