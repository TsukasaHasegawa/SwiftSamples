//
//  PagingTabMenuViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/02.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class PagingTabMenuViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    var contents: [ContentViewController] = []
    
    var menuViewController: MenuViewController?
    var pageViewController: UIPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupSubViews() {
        for index in 0..<PagingMenu.items.count {
            guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else { return }
            viewController.index = index
            contents.append(viewController)
        }
        
        for child in self.children {
            if type(of: child) == UIPageViewController.self {
                self.pageViewController = child as? UIPageViewController
                break;
            }
        }
        guard let pageViewController = self.pageViewController else { return }
        pageViewController.dataSource = self
        pageViewController.setViewControllers([contents[0]], direction: .forward, animated: false, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? MenuViewController, segue.identifier == "embedMenuViewController" {
            menuViewController = viewController
            menuViewController?.delegate = self
        } else if let viewController = segue.destination as? UIPageViewController, segue.identifier == "embedPageViewController" {
            pageViewController = viewController
            pageViewController?.dataSource = self
        }
    }
}

extension PagingTabMenuViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerBefore = viewController as? ContentViewController,
        let previousPageIndex = viewControllerBefore.index.flatMap({ $0 - 1 }), 0 <= previousPageIndex,
        let previousViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else {
            return nil
        }
        previousViewController.index = previousPageIndex
        return previousViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerAfter = viewController as? ContentViewController,
        let nextPageIndex = viewControllerAfter.index.flatMap({ $0 + 1 }), nextPageIndex < PagingMenu.items.count,
        let nextViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else {
                return nil
        }
        nextViewController.index = nextPageIndex
        return nextViewController
    }
}

extension PagingTabMenuViewController: MenuViewControllerDelegate {
    func menuViewController(viewController: MenuViewController, at index: Int) {
        // 現在表示されているViewControllerを取得する
        guard let currentContentViewController = pageViewController?.viewControllers?.first as? ContentViewController,
        let currentIndex = currentContentViewController.index,
        currentIndex != index else {
                return
        }

        // 選択したindexと現在表示されているindexを比較して、ページングの方法を決める
        let direction :UIPageViewController.NavigationDirection = currentIndex < index ? .forward : .reverse
        let viewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        viewController.index = index
        // 新しくViewControllerを設定する　※　下のスワイプと組み合わせる時はanimatedはfalseに設定しておいたほうが無難
        pageViewController?.setViewControllers([viewController], direction: direction, animated: true) { _ in }
    }
}
