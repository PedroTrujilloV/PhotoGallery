//
//  Photo.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 12/29/20.
//  Copyright © 2020 Pedro Trujillo V. All rights reserved.
//

import Foundation
import CoreLocation
import Photos

struct Photo {
    var date:Date
    var asset:PHAsset
    var location:CLLocation
    var favorite:Bool
}
