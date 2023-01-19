//
//  PayllistModel.swift
//  youtubeClon
//
//  Created by Duver on 17/1/23.
//

import Foundation


struct PlaylistModel: Decodable {
  let kind, etag, nextPageToken, regionCode: String
  let pageInfo: PageInfo
  let items: [Item]
}

// MARK: - Item
struct Item: Codable {
  var kind, etag: String
  var id: ID
}

// MARK: - ID
struct ID: Codable {
  var kind, videoID: String
  
  enum CodingKeys: String, CodingKey {
    case kind
    case videoID = "videoId"
  }
}

// MARK: - PageInfo
struct PageInfo: Decodable {
  var totalResults, resultsPerPage: Int
}

struct Items: Decodable{
  let kind: String
  let etag : String
  let id: String
  let snippet: Snippet
  let contentDetails: ContentDetail
  
  struct Snippet: Decodable{
    let publishedAt: String
    let channelId: String
    let title: String
    let thumbnails: Thumbnails
    let description: String
    
    let channelTitle: String
    let localized: Localized
    
    struct Thumbnails : Decodable{
      let medium : Medium
      struct Medium : Decodable{
        let url: String
        let width: Int
        let height: Int
      }
    }
    
    struct Localized: Decodable{
      let title: String
      let description: String
    }
  }
  struct ContentDetail: Decodable{
    let itemCount: Int
  }
  
}



struct mainKeys{
  let api_KEY: String = "AIzaSyCZRsFZbm-T3xUg3sfXMa3h9v4eAlrPgwU"
  let baseUrl: String = "https://www.googleapis.com/youtube/v3"
}

//GET https://www.googleapis.com/youtube/v3/playlistItems
