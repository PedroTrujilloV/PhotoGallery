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
    
    @Published var removedIndexes:Array<Int> = []{
        didSet{ didChange.send(self) }
    }
    
    private var byFavoriteGallery:Array<PhotoViewModel> = []
    private var byDateGallery:Array<PhotoViewModel> = []
    
    var allPhotos:PHFetchResult<PHAsset> {
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
        if !byFavoriteGallery.isEmpty {
            currentGallery = byFavoriteGallery
            return
        }
        if let collection = smarthAlbums.firstObject {
            let fetchResult = PHAsset.fetchAssets(in: collection, options: nil)
            for i in 0..<fetchResult.count {
                let asset = fetchResult.object(at: i)
                let vm = PhotoViewModel(asset)
                byFavoriteGallery.append(vm)
            }
            currentGallery = byFavoriteGallery
        } else {
            print("PhotoStore.fetchByFavorite: Problem fetching smarthAlbums")
        }
    }
    
    func fetchByDate(){
        if !byDateGallery.isEmpty {
            currentGallery = byDateGallery
            return
        }
        if allPhotos.count > 0 {
            for i in 0..<allPhotos.count{
                let asset = allPhotos.object(at: i)
                let vm = PhotoViewModel(asset)
                byDateGallery.append(vm)
                if asset.isFavorite == false {
                    removedIndexes.append( allPhotos.index(of: asset) )
                }
            }
            currentGallery = byDateGallery
        } else {
            print("PhotoStore.fetchByDate: Problem fetching allPhotos")
        }
    }
 
}


