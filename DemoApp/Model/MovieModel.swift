//
//  MovieModel.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import Foundation
import ObjectMapper
import Alamofire

class MovieDB: NSObject {
    var completionHandler: (_ demoModel: Items?) -> Void = { _ in }
    
    func handleManagementRequest(block: @escaping (_ demoModel: Items?) -> Void) {
        completionHandler = block
        fetchData()
    }
    
    func fetchData() {
        AF.request("https://api.themoviedb.org/3/list/1?api_key=dfe81f5913e2ea08ab5bd8cb9aedb811&language=en-US",method: .get).responseJSON { [self] (response) in
            let data = Mapper<Items>().map(JSON: response.value as! [String : Any])
            print(data!.toJSONString(prettyPrint: true)!)
            completionHandler(data)
        }
    }
}

struct MovieDetail: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        adult <- map["adult"]
        backdrop_path <- map["backdrop_path"]
        genre_ids <- map["genre_ids"]
        id <- map["id"]
        media_type <- map["media_type"]
        original_language <- map["original_language"]
        original_title <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        poster_path <- map["poster_path"]
        release_date <- map["release_date"]
        title <- map["title"]
        video <- map["video"]
        vote_average <- map["vote_average"]
        vote_count <- map["vote_count"]
    }
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var id: Int?
    var media_type: String?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Float?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Float?
    var vote_count: Int?
}

struct Items: Mappable {
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        items <- map["items"]
    }
    var items: [MovieDetail]?
    
}
