//
//  ViewController.swift
//  CoreData
//
//  Created by JayWon on 14-11-11.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext!
        
        var error:NSError?
        
        //创建User对象
        var oneUser = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: context) as! User
        oneUser.userID = 1
        oneUser.userEmail = "junfei521@126.com"
        oneUser.userPawd = "18500"
        
        //保存
        if(!context.save(&error))
        {
            println("不能保存：\(error?.localizedDescription)");
        }
        
        
        //查询
        var fetchRequest:NSFetchRequest = NSFetchRequest()
        fetchRequest.fetchLimit = 10// 限定查询结果的数量
        fetchRequest.fetchOffset = 0// 查询的偏移量
        
        
        var entity:NSEntityDescription? = NSEntityDescription.entityForName("User", inManagedObjectContext: context)
        
        fetchRequest.entity = entity
        
        var fetchedObjects:[AnyObject]? = context.executeFetchRequest(fetchRequest, error: &error)
        for info:User in fetchedObjects as! [User] {
            
            println("userID = \(info.userID)")
            println("userEmail = \(info.userEmail)")
            println("userPawd = \(info.userPawd)")
            println("++++++++++++++++++++++++++++++++++++++")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

