//
//  SATScoresAPI.swift
//  20201005-ChristianLorenzo-NYCSchools
//
//  Created by Christian Lorenzo on 10/5/20.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class SATScoresAPI {
    static let apiEndpoints = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json"
    
    func getItemOfDBN(_ dbn: String, completion: @escaping (_ items: SATScores?, _ error: Error?)->Void) {
        Alamofire.request(SATScoresAPI.apiEndpoints)
            .validate(statusCode: 200..<300)
            .responseArray { (response: DataResponse<[SATScores]>) in
                switch response.result {
                case .success(let items):
                    
                    for item in items {
                        if item.dbn == dbn {
                            completion(item, nil)
                            return
                        }
                    }
                    
                    completion(nil, nil)
                    return
                    
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
}
