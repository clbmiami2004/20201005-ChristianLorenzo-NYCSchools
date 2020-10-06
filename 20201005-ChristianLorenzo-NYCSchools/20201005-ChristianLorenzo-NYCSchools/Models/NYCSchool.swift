//
//  NYCSchool.swift
//  20201005-ChristianLorenzo-NYCSchools
//
//  Created by Christian Lorenzo on 10/5/20.
//

import ObjectMapper

class NYCSchool: Mappable {
    @objc dynamic var dbn: String = ""
    @objc dynamic var school_name: String = ""
    @objc dynamic var city: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.dbn <- map["dbn"]
        self.school_name <- map["school_name"]
        self.city <- map["city"]
    }
}
