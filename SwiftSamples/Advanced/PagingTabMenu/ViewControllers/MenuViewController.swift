//
//  MenuViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/02.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

protocol MenuViewControllerDelegate: class {
    func menuViewController(viewController: MenuViewController, at index: Int)
}

class MenuViewController: UIViewController {
    
    weak var delegate: MenuViewControllerDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "MenuViewCell", bundle: nil), forCellWithReuseIdentifier: "MenuViewCell")
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func focusCell(at indexPath: IndexPath) {
        if let previousCell = collectionView?.cellForItem(at: IndexPath(item: currentIndex, section: 0)) as? MenuViewCell {
            previousCell.focusCell(false)
        }
        if let nextCell = collectionView?.cellForItem(at: indexPath) as? MenuViewCell {
            nextCell.focusCell(true)
        }
        currentIndex = indexPath.row
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PagingMenu.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let defaultCell = UICollectionViewCell()
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuViewCell", for: indexPath) as? MenuViewCell else { return defaultCell }
        let item = PagingMenu.items[indexPath.row]
        let isMovable = (indexPath.row == currentIndex)
        cell.configure(title: item.menuTitle, color: item.themeColor, isMovable: isMovable)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension MenuViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        focusCell(at: indexPath)
        delegate?.menuViewController(viewController: self, at: indexPath.row)
    }
}
