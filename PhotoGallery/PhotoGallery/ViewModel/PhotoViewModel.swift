//
//  PhotoViewModel.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 12/30/20.
//  Copyright © 2020 Pedro Trujillo V. All rights reserved.
//

import Foundation
import Photos
import UIKit

class PhotoViewModel {
    
    let model: PHAsset
    private let imageManager = PHCachingImageManager()
    let scale = UIScreen.main.scale
    
    var creationDate:Date? {
        return model.creationDate
    }

    var location:CLLocation? {
        return model.location
    }
    var favorite:Bool {
        return model.isFavorite
    }
    
    init(_ model: PHAsset) {
        self.model = model
    }
    
    func requestImage(cellSize: CGSize, completion:@escaping (UIImage) -> Void ) {
        let thumbnailSize = CGSize(width: cellSize.width * scale, height: cellSize.height * scale)
        imageManager.requestImage(for: model,
                                  targetSize: thumbnailSize,
                                  contentMode: .aspectFit,
                                  options: nil,
                                  resultHandler: { image, _ in
                                    
                                    if let image = image {
                                        completion(image)
                                    }
        })
    }
}

