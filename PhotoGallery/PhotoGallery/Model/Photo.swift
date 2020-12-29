//
//  Photo.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 12/29/20.
//  Copyright © 2020 Pedro Trujillo V. All rights reserved.
//

import Foundation
import CoreLocation

struct Photo {
    var name:String
    var date:Date
    var image:Data
    var location:CLLocation
    var favorite:Bool
}
