//
//  coredata.swift
//  Api_Json_Database
//
//  Created by swapnil jadhav on 13/04/20.
//  Copyright © 2020 t. All rights reserved.
//

import UIKit
import CoreData
class coredata:  UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tables: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // batch delete beacause of previous data also added everytime
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")

        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(batchDeleteRequest)

        } catch {
            // Error Handling
        }
 
        
        
 
        gets()
        
        
        sets()
    }
    
    var users = [user]()
    //var stud : [NSManagedObject] = []
    var model : [Users] = []
    
    var emp = [Employee]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
         
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        context.delete(emp[indexPath.row])
        emp.remove(at: indexPath.row)

        tables.reloadData()
        
        
    }
    
    
    func sets()
    {
        
        
        
//        let query = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
//
//        let result = try! context.fetch(query)
//
//
//        for st in result
//        {
//            let s1 = st as! Employee
//
//            //stud.append(s1)
//
//            print(s1.name)
//
//
//        }
//
        
        let request : NSFetchRequest<Employee> = Employee.fetchRequest()
        
         emp = try! context.fetch(request)
        
         print(emp.count)
         
        
        
    }
    
    
    func gets()
    {
        
        
        
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            
            
            if error == nil && data != nil
            {
                
                
                do
                {
                    
                    self.users = try! JSONDecoder().decode([user].self, from: data!)
                    
                   
                    //let e1 = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: self.context) as! Employee
                    
                    
                    for i in self.users
                    {
                        
                        
                        //self.model.append(Users(id: i.id!, name: i.name!, username: i.username!, email: i.email!, street: (i.address?.street)!, suit: (i.address?.suite)!, city: (i.address?.city)!, zipcode: (i.address?.zipcode)!, lat: (i.address?.geo?.lat)!, lng: (i.address?.geo?.lng)!, phone: i.phone!, website: (i.website!), cname: (i.company?.name)!, catchp: (i.company?.catchPhrase)!, bs: (i.company?.bs)!))
                        
                        
                        // let e1 = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: self.context) as! Employee
                        
                        
                        var us = Users(id: i.id!, name: i.name!, username: i.username!, email: i.email!, street: (i.address?.street)!, suit: (i.address?.suite)!, city: (i.address?.city)!, zipcode: (i.address?.zipcode)!, lat: (i.address?.geo?.lat)!, lng: (i.address?.geo?.lng)!, phone: i.phone!, website: (i.website!), cname: (i.company?.name)!, catchp: (i.company?.catchPhrase)!, bs: (i.company?.bs)!)
                        
                        
                        self.model.append(us)
                       
    }
                    
                    
                    for t in self.model
                    {
                        
                        
                        let emp = Employee(context: self.context)
                        //emp.id = i.id as! Int16
                        emp.name = t.name
                        emp.phone = t.phone
                        emp.email = t.email
                        emp.username = t.username
                        emp.street = t.street
                        emp.suite = t.suite
                        emp.city = t.city
                        emp.zipcode = t.zipcode
                        emp.lat = t.lat
                        emp.lng = t.lng
                        emp.website = t.website
                        emp.cname = t.name
                        emp.catchp = t.catchp
                        emp.bs = t.bs
                        
                        self.emp.append(emp)
                        
                        self.saveitem()
                    }
                }
                catch
                {
                    print(error.localizedDescription)
                }
                
                
                
                //                for n in self.users
                //                {
                //                    guard let emp = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: self.context) as? Employee else {
                //
                //                        print("failt to new object")
                //                        return
                //                    }
                //
                
                
                //emp.id = n.id as! Int16
                //emp.name = n.name
                //emp.email = n.email
            }
            
            DispatchQueue.main.async {
                self.tables.reloadData()
            }
        }.resume()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(model.count)
        
        
        return emp.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tables.dequeueReusableCell(withIdentifier: "cell") as! Corecell
        
//        cell.idlbl.text = "\(model[indexPath.row].id)"
//        cell.namelbl.text = model[indexPath.row].name
//
//        cell.namelbl.text = emp[indexPath.row].name
//        //cell.idlbl.text = emp[indexPath.row].id as! String
//        cell.username.text = emp[indexPath.row].username
//        cell.email.text = emp[indexPath.row].email
//        cell.street.text = emp[indexPath.row].street
//        cell.suite.text = emp[indexPath.row].suite
//        cell.city.text = emp[indexPath.row].city
//        cell.zipcode.text = emp[indexPath.row].zipcode
//        cell.lat.text = emp[indexPath.row].lat
//        cell.phone.text = emp[indexPath.row].phone
//        cell.cname.text = emp[indexPath.row].cname
//        cell.bs.text = emp[indexPath.row].bs
        
         //instead of above use didset which set in cell file
        
        cell.emp = emp[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 370
    }
    
    func  saveitem()
        
    {
        try! self.context.save()
    }
    
//    func loadItems()
//       {
//           do
//           {
//               let request : NSFetchRequest<Employee> = Employee.fetchRequest()
//
//               emp = try context.fetch(request)
//
//            print(emp.count)
//           }
//           catch
//           {
//               print("cannot load data")
//           }
//
//       }
}
