//
//  Corecell.swift
//  Api_Json_Database
//
//  Created by swapnil jadhav on 13/04/20.
//  Copyright © 2020 t. All rights reserved.
//

import UIKit

class Corecell: UITableViewCell {

    @IBOutlet weak var idlbl: UILabel!
    
    @IBOutlet weak var namelbl: UILabel!
    
    @IBOutlet weak var username: UILabel!
    
   
    
    @IBOutlet weak var email: UILabel!
    
    
    
    @IBOutlet weak var street: UILabel!
    
    
    @IBOutlet weak var suite: UILabel!
    
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var zipcode: UILabel!
    
    
    @IBOutlet weak var lat: UILabel!
    
    
    @IBOutlet weak var phone: UILabel!
    
    
    @IBOutlet weak var cname: UILabel!
    
    
    @IBOutlet weak var bs: UILabel!
    
    var emp : Employee!
    {
        didSet
        {
            //idlbl.text = emp.id
            namelbl.text = emp.name
            username.text = emp.username
            email.text = emp.email
            street.text = emp.street
            suite.text = emp.suite
            city.text = emp.city
            zipcode.text = emp.zipcode
            lat.text = emp.lat
            phone.text = emp.phone
            cname.text = emp.cname
            bs.text = emp.bs

        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
