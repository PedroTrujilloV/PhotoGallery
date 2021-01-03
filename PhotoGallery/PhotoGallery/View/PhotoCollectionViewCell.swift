//
//  PhotoCollectionViewCell.swift
//  PhotoGallery
//
//  Created by Pedro Trujillo on 12/29/20.
//  Copyright © 2020 Pedro Trujillo V. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let cellReuseID = "CollectionViewCell"
    
    var stackV:UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 5.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var photoThumbnailImage:UIImageView = {
       let imageV = UIImageView()
       imageV.contentMode = .scaleAspectFill
        imageV.clipsToBounds = true
       imageV.backgroundColor = .white
       imageV.translatesAutoresizingMaskIntoConstraints = false
       imageV.image = UIImage(named: "cat_icon")
       return imageV
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .orange
        setupViewHierarchy()
        setupConstrains()
    }
    
    func setCellProperites(_ viewModel:PhotoViewModel){
        viewModel.requestThumbnailImage(cellSize: self.frame.size) {[weak self] (image) in
            DispatchQueue.main.async {
                self?.photoThumbnailImage.image = image
            }
        }
    }
    
    private func setupViewHierarchy(){
        self.addSubview(stackV)
        stackV.addArrangedSubview(photoThumbnailImage)
    }
    
    private func setupConstrains(){
        photoThumbnailImage.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        photoThumbnailImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        photoThumbnailImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        photoThumbnailImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        stackV.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        stackV.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        stackV.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackV.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoThumbnailImage.image = nil
    }
}
