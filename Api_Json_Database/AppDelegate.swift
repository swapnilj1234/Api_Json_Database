//
//  AppDelegate.swift
//  Api_Json_Database
//
//  Created by swapnil jadhav on 11/04/20.
//  Copyright © 2020 t. All rights reserved.
//

import UIKit
import CoreData
import SQLite3
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        print(url)
        
        
       // print(url)
        // Override point for customization after application launch.
        //CheckData()
        
        
        //sqls()
        return true
    }

    
    
    func sqls()
    
    {
        
        
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        
        let dbpath = url.appendingPathComponent("Employees.sqlite")
        
        
        let f = FileManager()
        
        
        
        if (f.fileExists(atPath: dbpath.path))
        {
            print("database Present")
        }
        
        
        else
        {
        var ptr : OpaquePointer?
        
            if(sqlite3_open(dbpath.path, &ptr)==SQLITE_OK)
        {
        
            let query = "create table Emp (eid varchar(10),ename varchar(30),email varchar(30),username varchar(30),street varchar(30),suite varchar(30),city varchar(30),zipcode varchar(30),lat varchar(30),lng varchar(50),phone varchar(20),website varchar(40),cname varchar(60),catchs varchar(200),bs varchar(100))"
            
            
            
            if sqlite3_exec(ptr, query, nil, nil, nil) == SQLITE_OK
            {
                print("table created")
            }
            else
            {
                print("fail to create")
            }
        }
            
            else
            {
                print("fail to open database")
            }
            
            sqlite3_close(ptr)
        
        
        }
    
    }
    
    func CheckData()
    {
        let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        let dbpath = url.appendingPathComponent("UserApi.plist")
        
        let f = FileManager()
        
        
        if f.fileExists(atPath: dbpath.path)
        {
            print("database already present")
        }
        
        else
        {
            var dict = NSMutableDictionary.init(contentsOf: dbpath)
            
            
            if dict == nil
            {
                dict = NSMutableDictionary()
            }
            
            dict?.write(toFile: dbpath.path, atomically: true)
            
        }
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Api_Json_Database")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

