//
//  NYCSchoolAPI.swift
//  20201005-ChristianLorenzo-NYCSchools
//
//  Created by Christian Lorenzo on 10/5/20.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class NYCSchoolAPI {
    static let apiEndpoints = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
    
    func getItems(completion: @escaping (_ items: [NYCSchool]?, _ error: Error?)->Void) {
        Alamofire.request(NYCSchoolAPI.apiEndpoints)
            .validate(statusCode: 200..<300)
            .responseArray { (response: DataResponse<[NYCSchool]>) in
                switch response.result {
                case .success(let items):
                    completion(items, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
}
