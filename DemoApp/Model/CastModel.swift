//
//  CastModel.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import Foundation
import Alamofire
import ObjectMapper

class CreditDB: NSObject {
    var completionHandler: (_ demoModel: Content?) -> Void = { _ in }
    var id: Int?
    
    func getId(id: Int){
        self.id = id
    }
    
    func handleManagementRequest(block: @escaping (_ demoModel: Content?) -> Void) {
        completionHandler = block
        fetchData()
        
    }
    func fetchData() {
        AF.request("https://api.themoviedb.org/3/movie/\(id!)/credits?api_key=dfe81f5913e2ea08ab5bd8cb9aedb811&language=en-US",method: .get).responseJSON { [self] (response) in
            let data = Mapper<Content>().map(JSON: response.value as! [String : Any])
            print(data!.toJSONString(prettyPrint: true)!)
            completionHandler(data)
        }
    }
}

struct CreditContent: Mappable {
    
    init(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        adult <- map["adult"]
        gender <- map["gender"]
        id <- map["id"]
        known_for_department <- map["known_for_department"]
        name <- map["name"]
        original_name <- map["original_name"]
        popularity <- map["popularity"]
        profile_path <- map["profile_path"]
        cast_id <- map["cast_id"]
        character <- map["character"]
        credit_id <- map["credit_id"]
        order <- map["order"]
    }
    var adult: String?
    var gender: String?
    var id: String?
    var known_for_department: String?
    var name: String?
    var original_name: String?
    var popularity: String?
    var profile_path: String?
    var cast_id: String?
    var character: String?
    var credit_id: String?
    var order: String?
}
struct Content: Mappable {
    
    init(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        cast <- map["cast"]
        crew <- map["crew"]
    }
    var id: Int?
    var cast: [CreditContent]?
    var crew: [CreditContent]?
}
