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
    
    var photoImage:UIImageView = {
       let imageV = UIImageView()
       imageV.contentMode = .scaleToFill
       imageV.backgroundColor = .gray
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
    
    func setup() {
        backgroundColor = .orange
        setupViewHierarchy()
        setupConstrains()
    }
    
    func setupViewHierarchy(){
        self.addSubview(stackV)
        stackV.addArrangedSubview(photoImage)
    }
    
    func setupConstrains(){
        photoImage.heightAnchor.constraint(equalToConstant: 210.0).isActive = true
        photoImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        photoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        stackV.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        stackV.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        stackV.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackV.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
