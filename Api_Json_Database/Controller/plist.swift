//
//  plist.swift
//  Api_Json_Database
//
//  Created by swapnil jadhav on 12/04/20.
//  Copyright © 2020 t. All rights reserved.
//

import UIKit

class plist: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tables: UITableView!
    
    let urls = try! FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("UserApi.plist")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GetApi()
        //Datas()
        
        
        loadItems()
        //print(urls)
        
    }
    
    var users = [user]()
    var data = [Users]()

    func Datas()
    {
        //print(data.count)
    }
    
    
    
    //let dbpath = urls.appendingPathComponent("UserApi.plist")
    

    func GetApi()
    {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        
      
        
        
        

        //let dict = NSMutableDictionary.init(contentsOf: dbpath)
        
        //let us = NSMutableDictionary()
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil
            {
                
                do
                {
                    
                    //self.users = try JSONDecoder().decode([user].self, from: data!)
                    
                    self.users = try! JSONDecoder().decode([user].self, from: data!)
                    
                   // print(response)
                    
                    
                    for i in self.users
                    {
                        
                       
                        let u1 = Users(id: i.id!, name: i.name!, username: i.username!, email: i.email!, street: (i.address?.street)!, suit: (i.address?.suite)!, city: (i.address?.city)!, zipcode: (i.address?.zipcode)!, lat: (i.address?.geo?.lat)!, lng: (i.address?.geo?.lng)!, phone: i.phone!, website: (i.website!), cname: (i.company?.name)!, catchp: (i.company?.catchPhrase)!, bs: (i.company?.bs)!)
                        
                        //print(i.id!)
                        
                        self.data.append(u1)
             
                        self.saveItem()
                        
//                        us.setValue(u1, forKey: "user")
//
//
//                        dict?.setValue(us, forKey: "us")
//
//                        dict?.write(to: dbpath
//                            , atomically: true)
//
                        
                        
                    }
                    
                    //print(dict?.value(forKey: "us"))
                  
                    
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
                print("error to response")
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tables.dequeueReusableCell(withIdentifier: "cell") as! plistView
        
        cell.idlbl.text = "\(data[indexPath.row].id)"
        cell.namelbl.text = data[indexPath.row].name
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func saveItem()
    {
        let encoder = PropertyListEncoder()
        
        do
        {
            let data = try encoder.encode(self.data)
            try data.write(to: self.urls!)
           
        }
        catch
        {
            print("error encoding \(error)")
        }
        
                    //self.tableView.reloadData()

    }
    
    func loadItems()
    {
        
        if let datas = try? Data(contentsOf: urls!)
        {
            let decoder = PropertyListDecoder()

            do
            {
                data = try decoder.decode([Users].self, from: datas)
                
                for i in data
                {
                    
                    
                    print(i.id,i.name,i.city)
                }
            }
            catch
            {
                print("cannot load data")
            }
            
        }
}
}
