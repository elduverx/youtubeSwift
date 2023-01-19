//
//  RootPageViewController.swift
//  youtubeClon
//
//  Created by Duver on 18/1/23.
//

import UIKit

class RootPageViewController: UIPageViewController {
  
  var subViewControllers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

      delegate = self
      dataSource = self
      setupViewControllers()
    }
    
  private func setupViewControllers(){
    subViewControllers = [
      HomeViewController(),
      VideosViewController(),
      PlaylistsViewController(),
      ChannelViewController(),
      AboutViewController()
    ]
    setViewControllerFromIndex(index: 0, direction: .forward)
  }
  
  func setViewControllerFromIndex(index: Int, direction: NavigationDirection, animated: Bool = true){
    setViewControllers([subViewControllers[index]], direction: direction, animated: animated)
  }
  
//
//  override func setViewControllers(_ viewControllers: [UIViewController]?, direction: UIPageViewController.NavigationDirection, animated: Bool, completion: ((Bool) -> Void)? = nil) {
//    <#code#>
//  }
    
}

extension RootPageViewController: UIPageViewControllerDelegate,UIPageViewControllerDataSource{
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return subViewControllers.count
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    let index: Int = subViewControllers.firstIndex(of: viewController) ?? 0
    if index <= 0{
      return nil
    }
    return subViewControllers[index-1]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    let index: Int = subViewControllers.firstIndex(of: viewController) ?? 0
    if index  >= (subViewControllers.count-1) {
      return nil
    }
    return subViewControllers[index+1]
  }
  }
  
  
}
