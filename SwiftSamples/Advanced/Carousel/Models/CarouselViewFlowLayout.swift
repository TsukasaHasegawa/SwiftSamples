//
//  CarouselViewFlowLayout.swift
//  SwiftSamples
//
//  Created by Tsukasa Hasegawa on 2019/01/10.
//  Copyright © 2019 Tsukasa Hasegawa. All rights reserved.
//

import UIKit

class CarouselViewFlowLayout: UICollectionViewFlowLayout {
    
    private let cellWidth: CGFloat = CarouselViewCell().cellWidth
    private let cellHeight: CGFloat = CarouselViewCell().cellHeight
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.itemSize = CGSize(width: cellWidth, height: cellHeight)
        self.scrollDirection = .horizontal
        self.minimumLineSpacing = 20
        self.sectionInset = UIEdgeInsets(top: 0, left: screenWidth / 2 - 125.0, bottom: 0, right: screenWidth / 2 - 125.0)
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = self.collectionView else { return CGPoint.zero }
        let targetRect = CGRect(x:proposedContentOffset.x,
                                y:0,
                                width: collectionView.bounds.size.width,
                                height: collectionView.bounds.size.height)
        guard let layoutAttributes = super.layoutAttributesForElements(in: targetRect) else { return CGPoint.zero }
        var offsetAdjustment:CGFloat = CGFloat(MAXFLOAT)
        let horizontalOffest:CGFloat = proposedContentOffset.x + ( screenWidth - cellWidth ) / 2
        for layoutAttribute in layoutAttributes {
            let itemOffset = layoutAttribute.frame.origin.x
            if abs(itemOffset - horizontalOffest) < abs(offsetAdjustment) {
                offsetAdjustment = itemOffset - horizontalOffest
            }
        }
        return CGPoint(x:proposedContentOffset.x + offsetAdjustment, y:proposedContentOffset.y)
    }
}
