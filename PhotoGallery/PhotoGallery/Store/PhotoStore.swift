//
//  PhotoStore.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 12/30/20.
//  Copyright © 2020 Pedro Trujillo V. All rights reserved.
//

import Foundation
import Photos
import Combine

class PhotoStore: ObservableObject{
    
    var didChange = PassthroughSubject<PhotoStore,Never>()
    
    @Published var currentGallery:Array<PhotoViewModel> = []{
        didSet{ didChange.send(self) }
    }
    
    private var byFavoriteGallery:Array<PhotoViewModel> = [] 
    
    private var byDateGallery:Array<PhotoViewModel> = []
    
    @Published var allPhotos:PHFetchResult<PHAsset> {
        didSet{ didChange.send(self) }
    }
    
    var smarthAlbums: PHFetchResult<PHAssetCollection> 
    
    var userCollections: PHFetchResult<PHAssetCollection>
    
    init(){
        let allPhotosOptions = PHFetchOptions()
        allPhotosOptions.sortDescriptors = [ NSSortDescriptor(key: "creationDate", ascending: true)]
        
        allPhotos = PHAsset.fetchAssets(with: allPhotosOptions)
        smarthAlbums = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumFavorites, options: nil)
        userCollections = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .albumRegular, options: nil)
    }
    
    func fetchByFavorite(){
        if let collection = smarthAlbums.firstObject {
            let fetchResult = PHAsset.fetchAssets(in: collection, options: nil)
            for i in 0..<fetchResult.count {
                let asset = fetchResult.object(at: i)
                print(asset)
                let vm = PhotoViewModel(asset)
                byFavoriteGallery.append(vm)
            }
            currentGallery = byFavoriteGallery
        } else {
            print("PhotoStore.fetchByFavorite: Problem fetching smarthAlbums")
        }
    }
    
    func fetchByDate(){
        print(userCollections)
        if let collection = userCollections.firstObject {
            print(collection)
            let fetchResult = PHAsset.fetchAssets(in: collection, options: nil)
            for i in 0..<fetchResult.count {
                let asset = fetchResult.object(at: i)
                print(asset)
                let vm = PhotoViewModel(asset)
                byDateGallery.append(vm)
            }
            currentGallery = byDateGallery
        } else {
            print("PhotoStore.fetchByDate: Problem fetching userCollections")
        }
    }
 
}


