//
//  HomeViewController.swift
//  youtubeClon
//
//  Created by Duver on 19/1/23.
//

import UIKit
import Foundation

class HomeViewController: UIViewController {

    lazy var presenter = HomePresenter(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
      Task{
        await presenter.getHomeObjects()
      }
    }
}

extension HomeViewController : HomeViewProtocol{
    func getData(list: [[Any]]) {
      print("list: ", list)
    }
}
