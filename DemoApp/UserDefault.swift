//
//  UserDefault.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import Foundation
import ObjectMapper

struct UserDefault {
    private static let favoriteDefault = UserDefaults.standard
    static let favoriteSessionKey = "FavoriteKey"
    
    static func saveFavorite(movieDetail: MovieDetail){
        var favorites = getFavorite()
        favorites.append(movieDetail)
        favoriteDefault.set(favorites.toJSONString(prettyPrint: true), forKey: favoriteSessionKey)
        
    }
    static func getFavorite() -> [MovieDetail]{
        let favorites = favoriteDefault.string(forKey: favoriteSessionKey)
        let dataFavorites = Mapper<MovieDetail>().mapArray(JSONString: favorites ?? "") ?? [MovieDetail]()
        return dataFavorites
    }
    
    static func removeFavorite(id: Int){
        var favorites = getFavorite()
        //favorites.filter { $0.id != id }
        let getIndex = favorites.firstIndex(where: { $0.id == id })
        favorites.remove(at: getIndex!)
        favoriteDefault.set(favorites.toJSONString(prettyPrint: true), forKey: favoriteSessionKey)
    }
    
//    static func CheckFavorite(id: Int) -> Bool{
//        let Favorite = UserDefault.getFavorite()
//        let getIndex = Favorite.firstIndex(where: { $0.id == id })
//        if getIndex != nil{
//            return true
//        }
//        return false
//    }
    
}
