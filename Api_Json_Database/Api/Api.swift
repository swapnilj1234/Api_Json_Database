struct user : Codable
{
    var id : Int?
    var name : String?
    var username : String?
    var email : String?
    var address : ads?
    var phone : String?
    var website : String?
    var company : companys?
}

struct  ads : Codable {
    var street : String?
    var suite : String?
    var city : String?
    var zipcode : String?
    var geo : g?
}
struct  g : Codable {
    var lat : String?
    var lng : String?
}

struct companys : Codable {
    var name : String?
    var catchPhrase : String?
    var bs : String?
}
