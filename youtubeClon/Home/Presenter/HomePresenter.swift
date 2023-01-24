//
//  HomePresenter.swift
//  youtubeClon
//
//  Created by Duver on 24/1/23.
//

import Foundation

protocol HomeViewProtocol{
  func getData(list: [[Any]])
}

class HomePresenter{
  
    var provider: HomeProviderProtocol
  var delegate: HomeViewProtocol?
  
  init(delegate: HomeViewProtocol, provider: HomeProviderProtocol = HomeProvider()){
      self.provider = provider
      self.delegate = delegate
    }
  func getVideos(){
  }
}
