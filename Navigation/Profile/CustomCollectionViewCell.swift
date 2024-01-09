//
//  CustomCollectionViewCell.swift
//  Navigation
//
//  Created by Алексей Сердюк on 09.01.2024.
//

import UIKit

class CustomCollectionViewCell : UICollectionViewCell {
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView(image: UIImage())
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        addSubview(image)
        
        NSLayoutConstraint.activate([
        
            image.topAnchor.constraint(equalTo: super.topAnchor),
            image.leadingAnchor.constraint(equalTo: super.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: super.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: super.bottomAnchor)
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImage(name: String){
        image.image = UIImage(named: "\(name)")
    }
}
