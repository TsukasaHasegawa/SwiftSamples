//
//  CarouselViewController.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/04.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var width: CGFloat {
        return self.view.frame.width
    }
    
    var height: CGFloat {
        return self.view.frame.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CarouselViewCell", bundle: nil), forCellWithReuseIdentifier: "CarouselViewCell")
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func changeScale(cell: UICollectionViewCell) {
        let cellCenter:CGPoint = self.collectionView.convert(cell.center, to: nil) //セルの中心座標
        let screenCenterX:CGFloat = UIScreen.main.bounds.width / 2  //画面の中心座標x
        let reductionRatio:CGFloat = -0.0005                        //縮小率
        let maxScale:CGFloat = 1                                    //最大値
        let cellCenterDisX:CGFloat = abs(screenCenterX - cellCenter.x)   //中心までの距離
        let newScale = reductionRatio * cellCenterDisX + maxScale   //新しいスケール
        cell.transform = CGAffineTransform(scaleX:newScale, y:newScale)
    }
}

extension CarouselViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Carousel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let defaultCell = UICollectionViewCell()
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselViewCell", for: indexPath) as? CarouselViewCell else { return defaultCell }
        let item = Carousel.items[indexPath.row]
        cell.configure(title: item.title, color: item.themeColor)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
