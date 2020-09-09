//
//  Users.swift
//  Api_Json_Database
//
//  Created by swapnil jadhav on 12/04/20.
//  Copyright © 2020 t. All rights reserved.
//

import Foundation

class Users : Codable
{
    var id : Int = 0
    var name : String = ""
    var username : String = ""
    var email : String = ""
    var street : String = ""
    var suite : String = ""
    var city : String = ""
    var zipcode : String = ""
    var lat : String = ""
    var lng : String = ""
    var phone : String = ""
    var website : String = ""
    var cname : String = ""
    var catchp : String = ""
    var bs : String = ""
    
    init(id:Int,name:String,username:String,email:String,street:String,suit:String,city:String,zipcode:String,lat:String,lng:String,phone:String,website:String,cname:String,catchp:String,bs:String) {
        
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.street = street
        self.suite = suit
        self.city = city
        self.zipcode = zipcode
        self.phone = phone
        self.website = website
        self.cname = cname
        self.catchp = catchp
        self.bs = bs
        self.lat = lat
        self.lng = lng

    
    
    }
    

}
