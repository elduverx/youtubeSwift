//
//  RootPageViewController.swift
//  youtubeClon
//
//  Created by Duver on 18/1/23.
//

import UIKit

protocol RootPageProtocol: AnyObject{
  func currentPage(_ index: Int)
  
}

class RootPageViewController: UIPageViewController {
  
  var subViewControllers = [UIViewController]()
  var currentIndex = 0
  weak var delegateRoot: RootPageProtocol?
  
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
    _ = subViewControllers.enumerated().map({$0.element.view.tag = $0.offset})
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
  
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    print("finished:", finished)
    if let index = subViewControllers.first?.view.tag{
      currentIndex = index
      delegateRoot?.currentPage(index)
    }
  }
  
}



