//
//  MainViewViewController.swift
//  youtubeClon
//
//  Created by Duver on 18/1/23.
//

import UIKit

class MainViewViewController: UIViewController {
  
  var rootPageViewController: RootPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? RootPageViewController{
      rootPageViewController = destination
    }
  }


}
