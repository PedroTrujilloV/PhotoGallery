//
//  ViewController+UICollectionViewDelegateFlowLayout.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 1/2/21.
//  Copyright © 2021 Pedro Trujillo V. All rights reserved.
//  Important: Use only for custom cell sizes

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let extraSpace = ( CGFloat(columns) * spacing ) + spacing
        let sideLenght = ( view.frame.width - extraSpace ) / 3
        return CGSize(width: sideLenght, height: sideLenght)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return  UIEdgeInsets(top: 10, left: spacing, bottom: 10, right: spacing)
    }
}
