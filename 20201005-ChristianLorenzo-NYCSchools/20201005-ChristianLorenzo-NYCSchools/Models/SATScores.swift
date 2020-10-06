//
//  SATScores.swift
//  20201005-ChristianLorenzo-NYCSchools
//
//  Created by Christian Lorenzo on 10/5/20.
//

import ObjectMapper

class SATScores: Mappable {
    @objc dynamic var dbn: String = ""
    @objc dynamic var school_name: String = ""
    @objc dynamic var num_of_sat_test_takers: String = ""
    @objc dynamic var sat_critical_reading_avg_score: String = ""
    @objc dynamic var sat_math_avg_score: String = ""
    @objc dynamic var sat_writing_avg_score: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        self.dbn <- map["dbn"]
        self.school_name <- map["school_name"]
        self.num_of_sat_test_takers <- map["num_of_sat_test_takers"]
        self.sat_critical_reading_avg_score <- map["sat_critical_reading_avg_score"]
        self.sat_math_avg_score <- map["sat_math_avg_score"]
        self.sat_writing_avg_score <- map["sat_writing_avg_score"]
    }
}
