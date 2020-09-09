//
//  SQLITE.swift
//  Api_Json_Database
//
//  Created by swapnil jadhav on 14/04/20.
//  Copyright © 2020 t. All rights reserved.
//

import UIKit
import SQLite3

class SQLITE: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tables: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        get()
        sqls()
    }
    
    var users = [user]()
    var model = [Users]()
    
    
    func sqls()
    {
        var urls = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        var dbpath = urls.appendingPathComponent("Employees.sqlite")
        
        
        print(dbpath)
        
        var ptr : OpaquePointer?
        
        var result : OpaquePointer?
        
        if sqlite3_open(dbpath.path, &ptr) == SQLITE_OK
        {
          let query = "select * from Emp"
            
            if sqlite3_prepare(ptr, query, -1, &result, nil) == SQLITE_OK
            {
                while sqlite3_step(result) == SQLITE_ROW
                {
                    var t1 = sqlite3_column_int(result, 0)
                   
                   var t2 = String.init(format: "%s", sqlite3_column_text(result, 1))
                   
                    var t3 = String.init(format: "%s", sqlite3_column_text(result, 2))
                    
                    var t4 = String.init(format: "%s", sqlite3_column_text(result, 3))
                    var t5 = String.init(format: "%s", sqlite3_column_text(result, 4))
                    var t6 = String.init(format: "%s", sqlite3_column_text(result, 5))
                    var t7 = String.init(format: "%s", sqlite3_column_text(result, 6))
                    var t8 = String.init(format: "%s", sqlite3_column_text(result, 7))
                    var t9 = String.init(format: "%s", sqlite3_column_text(result, 8))
                    var t10 = String.init(format: "%s", sqlite3_column_text(result, 9))
                    var t11 = String.init(format: "%s", sqlite3_column_text(result, 10))
                    
                    var t12 = String.init(format: "%s", sqlite3_column_text(result, 11))
                    var t13 = String.init(format: "%s", sqlite3_column_text(result, 12))
                    var t14 = String.init(format: "%s", sqlite3_column_text(result, 13))
                    var t15 = String.init(format: "%s", sqlite3_column_text(result, 14))
                    
                    self.model.append(Users(id: Int(t1) , name: t2, username: t3, email: t4, street: t5, suit: t6, city: t7, zipcode: t8, lat: t9, lng: t10, phone: t11, website: t12, cname: t13, catchp: t14, bs: t15)) //model.append(t1,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15)
                
                   // print(t1,t2,t3,t4,t5,t6,t6,t7,t8,t9,t10,t11,t12,t13,t14)
                }
                
               
             for i in model
             {
                print(i.id,i.name,i.username,i.email,i.phone,i.website,i.lat,i.lng,i.cname,i.catchp,i.bs,i.suite,i.street,i.city,i.zipcode)
            }
            
            }
            
        }
        
    }
                
                func get()
                {
                    let url =  URL(string: "https://jsonplaceholder.typicode.com/users")
                    
                    
                    //var urls = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                    
                    //var dbpath = urls.appendingPathComponent("Employees.sqlite")
                    
                    //var ptr : OpaquePointer?
                    
                    
                    URLSession.shared.dataTask(with: url!) { (data, response, error) in
                        
                        
                        if error == nil && data != nil
                        {
                            
                            do
                            {
                                self.users = try JSONDecoder().decode([user].self, from: data!)
                                
                                
                                for i in self.users
                                {
                                    
                                    var  us = Users(id: i.id!, name: i.name!, username: i.username!, email: i.email!, street: (i.address?.street)!, suit: (i.address?.suite)!, city: (i.address?.city)!, zipcode: (i.address?.zipcode)!, lat: (i.address?.geo?.lat)!, lng: (i.address?.geo?.lng)!, phone: i.phone!, website: (i.website!), cname: (i.company?.name)!, catchp: (i.company?.catchPhrase)!, bs: (i.company?.bs)!)
                                    //self.model.append(Users(id: i.id!, name: i.name!, username: i.username!, email: i.email!, street: (i.address?.street)!, suit: (i.address?.suite)!, city: (i.address?.city)!, zipcode: (i.address?.zipcode)!, lat: (i.address?.geo?.lat)!, lng: (i.address?.geo?.lng)!, phone: i.phone!, website: (i.website!), cname: (i.company?.name)!, catchp: (i.company?.catchPhrase)!, bs: (i.company?.bs)!))
                                    
                                    
                                    self.model.append(us)
                                    //
                                    //                        if sqlite3_open(dbpath.path, &ptr) == SQLITE_OK
                                    //                        {
                                    //                            let query = "insert into Emp values(\(us.id),'\(us.name)','\(us.email)','\(us.username)','\(us.street)','\(us.suite)','\(us.city)','\(us.zipcode)','\(us.lat)','\(us.lng)','\(us.phone)','\(us.website)','\(us.cname)','\(us.catchp)','\(us.bs)')"
                                    //
                                    //                            if sqlite3_exec(ptr, query, nil, nil, nil) == SQLITE_OK
                                    //                            {
                                    //                                print("insert successfully")
                                    //                            }
                                    //                            else
                                    //                            {
                                    //                                print("fail to insert ")
                                    //                            }
                                    //                        }
                                    //                        else
                                    //                        {
                                    //                            print("fail to open database")
                                    //                        }
                                    //                        sqlite3_close(ptr)
                                    
                                    
                                }
                                
                                DispatchQueue.main.async {
                                    self.tables.reloadData()
                                }
                            }
                            catch
                            {
                                print(error.localizedDescription)
                            }
                        }
                        else
                        {
                            print("error to fetch")
                        }
                    }.resume()
                }
                
                
                func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    
                    print(model.count)
                    return model.count
                }
                
                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    let cell = tables.dequeueReusableCell(withIdentifier: "cell") as! sql
                    
                    cell.idlbl.text =  "\(model[indexPath.row].id)"
                    cell.namelbl.text = model[indexPath.row].name
                    
                    return  cell
                }
                
                func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                    return 300
                }
}
