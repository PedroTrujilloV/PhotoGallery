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
import Combine

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
    var thumbnailImage:UIImage?
    
    init(_ model: PHAsset) {
        self.model = model
    }
    
    func requestThumbnailImage(cellSize: CGSize, completion:@escaping (UIImage) -> Void ) {
        if let image = thumbnailImage {
            completion(image)
            return
        }
        let thumbnailSize = CGSize(width: cellSize.width * self.scale, height: cellSize.height * self.scale)
        self.imageManager.requestImage(for: self.model,
                                  targetSize: thumbnailSize,
                                  contentMode: .aspectFit,
                                  options: nil,
                                  resultHandler: { image, _ in
                                    
                                    if let image = image {
                                        self.thumbnailImage = image
                                        completion(image)
                                    }
                                  })
    }
}

