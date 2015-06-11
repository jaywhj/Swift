//
//  DataBase.swift
//  SQLiteDemo
//
//  Created by JayWon on 14-11-6.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

import Foundation
import UIKit

class Database {

    let dbName = "mydatabase.sqlite"
    
    //不透明指针，对应C语言里面的void *，这里指sqlite3指针
    private var db:COpaquePointer = nil
    
    
    //Database 单例，第一种写法
    class var instance: Database {
        struct Singleton{
            static let instance = Database()
        }
        return Singleton.instance
    }
    
    /*
    //Database 单例，第二种写法
    struct Static {
        static var instance:Database? = nil
        static var onceToken:dispatch_once_t = 0
    }
    
    class func sharedInstance() -> Database! {
        /*
        //普通闭包写法
        dispatch_once(&Static.onceToken, { () -> Void in
            Static.instance = Database()
        })
        */
        //尾随闭包写法
        dispatch_once(&Static.onceToken) {
            Static.instance = Database()
        }
        
        return Static.instance!
    }
    */
    
    private func dbPath() -> String
    {
        return NSHomeDirectory().stringByAppendingFormat("/Documents/" + dbName)
    }
    
    //把数据库拷贝到沙盒路径
    private func copyDBFile() -> Bool{
        let fm = NSFileManager.defaultManager()
        if !(fm.fileExistsAtPath(dbPath())){
            if let srcDbPath = NSBundle.mainBundle().pathForResource(dbName, ofType: nil) {
                if !(fm.copyItemAtPath(srcDbPath, toPath: dbPath(), error: nil)) {
                    return false
                }
            }
        }
        
        return true
    }
    
    required init() {

        //如果沙盒路径有数据库文件则打开
        if copyDBFile(){
            let cpath = dbPath().cStringUsingEncoding(NSUTF8StringEncoding)
            println("db path:" + dbPath())
            let error = sqlite3_open(cpath!, &db)
            if error != SQLITE_OK {
                sqlite3_close(db)
            }
        }
    }
    
    deinit{
        sqlite3_close(db)
    }
    
    //代码创建表
    private func createTable() -> Bool{

        var sql = "CREATE TABLE UserTable(username TEXT NOT NULL PRIMARY KEY, password TEXT NOT NULL, email TEXT, age INTEGER)"
        
        var execResult = sqlite3_exec(db, sql.cStringUsingEncoding(NSUTF8StringEncoding)!, nil, nil, nil);
        if (execResult != SQLITE_OK) {
            return false
        }
        
        return true
    }
    
    
    func addUser(user: Person) -> Bool
    {
        var sql = "INSERT INTO UserTable (username, password, email, age) VALUES (?, ?, ?, ?);";
        
        //sqlite3_stmt 指针
        var stmt:COpaquePointer = nil
        var cSql = sql.cStringUsingEncoding(NSUTF8StringEncoding)
        
        //1.编译sql
        let prepare_result = sqlite3_prepare_v2(self.db, cSql!, -1, &stmt, nil)
        if prepare_result != SQLITE_OK {
            sqlite3_finalize(stmt)
            if let error = String.fromCString(sqlite3_errmsg(self.db)) {
                let msg = "SQLiteDB - failed to prepare SQL: \(sql), Error: \(error)"
                println(msg)
                self.alert(msg)
            }
            return false
        }
        
        //2.bind 绑定参数, 第二个参数 索引从1开始，最后一个参数为 函数指针
        let intTran = UnsafeMutablePointer<Int>(bitPattern: -1)
        let tranPointer = COpaquePointer(intTran)
        let transient = CFunctionPointer<((UnsafeMutablePointer<()>) -> Void)>(tranPointer)
        
        sqlite3_bind_text(stmt, 1, user.name!.cStringUsingEncoding(NSUTF8StringEncoding)!, -1, transient);
        sqlite3_bind_text(stmt, 2, user.password!.cStringUsingEncoding(NSUTF8StringEncoding)!, -1, transient);
        sqlite3_bind_text(stmt, 3, user.email!.cStringUsingEncoding(NSUTF8StringEncoding)!, -1, transient);
        sqlite3_bind_int(stmt, 4, CInt(user.age!));
        
        
        //3.step执行
        var step_result = sqlite3_step(stmt)
        if step_result != SQLITE_OK && step_result != SQLITE_DONE {
            sqlite3_finalize(stmt)
            if let err = String.fromCString(sqlite3_errmsg(self.db)) {
                let msg = "SQLiteDB - failed to execute SQL: \(sql), Error: \(err)"
                println(msg)
                self.alert(msg)
            }
            return false
        }
        
        //4.finalize
        sqlite3_finalize(stmt);
        
        return true
    }
    
    func findAllUsers() -> [Person]{
        var usersArr = [Person]()
        
        var sql = "SELECT * FROM UserTable;";
        
        //sqlite3_stmt 指针
        var stmt:COpaquePointer = nil
        var cSql = sql.cStringUsingEncoding(NSUTF8StringEncoding)
        
        //1.编译sql
        let prepare_result = sqlite3_prepare_v2(self.db, cSql!, -1, &stmt, nil)
        if prepare_result != SQLITE_OK {
            sqlite3_finalize(stmt)
            if let error = String.fromCString(sqlite3_errmsg(self.db)) {
                let msg = "SQLiteDB - failed to prepare SQL: \(sql), Error: \(error)"
                println(msg)
                self.alert(msg)
            }
            return usersArr
        }
        
        //2.step
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            var user = Person()
            
            //从数据库获取数据
            let cName = UnsafePointer<CChar>(sqlite3_column_text(stmt, 0))
            let cPwd = UnsafePointer<CChar>(sqlite3_column_text(stmt, 1))
            let cEmail = UnsafePointer<CChar>(sqlite3_column_text(stmt, 2))
            let cAge = sqlite3_column_int(stmt, 3)
            
            user.name = String.fromCString(cName)
            user.password = String.fromCString(cPwd)
            user.email = String.fromCString(cEmail)
            user.age = Int(cAge)
            
            usersArr += [user]
        }
        
        //3.finalize
        sqlite3_finalize(stmt);
        
        return usersArr
    }
    
    
    func alert(msg:String) {
        dispatch_async(dispatch_get_main_queue()) {
            let alert = UIAlertView(title: "SQLiteDB", message:msg, delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
    }
}