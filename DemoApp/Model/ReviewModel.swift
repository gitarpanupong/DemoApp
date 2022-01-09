//
//  ReviewModel.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import Foundation
import Alamofire
import ObjectMapper

class ReviewDB: NSObject {
    var completionHandler: (_ demoModel: Results?) -> Void = { _ in }
    var id: Int?
    
    func getId(id: Int){
        self.id = id
    }
    
    func handleManagementRequest(block: @escaping (_ demoModel: Results?) -> Void) {
        completionHandler = block
        fetchData()
    }
    
    func fetchData() {
        AF.request("https://api.themoviedb.org/3/movie/\(id!)/reviews?api_key=dfe81f5913e2ea08ab5bd8cb9aedb811&language=en-US&page=1",method: .get).responseJSON { [self] (response) in
            let data = Mapper<Results>().map(JSON: response.value as! [String : Any])
            print(data!.toJSONString(prettyPrint: true)!)
            completionHandler(data)
        }
    }
}

struct ReviewContent: Mappable {
    
    init(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        author <- map["author"]
        content <- map["content"]
        created_at <- map["created_at"]
        id <- map["id"]
        updated_at <- map["updated_at"]
        url <- map["url"]
    }
    var author: String?
    var content: String?
    var created_at: String?
    var id: String?
    var updated_at: String?
    var url: String?
}

struct Results: Mappable {
    
    init(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        results <- map["results"]
    }
    var id: Int?
    var results: [ReviewContent]?
}
