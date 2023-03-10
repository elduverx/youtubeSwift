//
//  RequestModel.swift
//  youtubeClon
//
//  Created by Duver on 21/1/23.
//

import Foundation


struct RequestModel  {
    let endpoint : Endpoints
    var queryItems : [String:String]?
    let httpMethod : HttpMethod = .GET
    var baseUrl : URLBase = .youtube
    
    func getURL() -> String{
        return baseUrl.rawValue + endpoint.rawValue
    }
    
    enum HttpMethod : String{
        case GET
        case POST
    }

    enum Endpoints : String   {
        case search = "/search"
      case playlist = "/playlists"
      case playlistItems = "/playlistItems"
      case channels = "/channels"

        case empty = ""
    }

    enum URLBase : String{
        case youtube = "https://youtube.googleapis.com/youtube/v3"
        case google = "https://othereweb.com/v2"
    }
}
