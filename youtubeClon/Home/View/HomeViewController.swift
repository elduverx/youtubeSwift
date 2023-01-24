//
//  HomeViewController.swift
//  youtubeClon
//
//  Created by Duver on 19/1/23.
//

import UIKit

class HomeViewController: UIViewController {

  lazy var presenter = HomePresenter(delegate: self)
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }



}

extension HomeViewController: HomeViewProtocol{
  func getData(list: [[Any]]) {
    print("list:\(list)")
  }
}
