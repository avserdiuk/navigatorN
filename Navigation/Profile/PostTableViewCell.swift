//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Алексей Сердюк on 09.01.2024.
//

import UIKit
import StorageService

class PostTableViewCell : UITableViewCell {
    
    private lazy var autor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var image : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private lazy var desc : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var likes : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private lazy var views : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(autor)
        addSubview(image)
        addSubview(desc)
        addSubview(likes)
        addSubview(views)
        
        NSLayoutConstraint.activate([
            autor.topAnchor.constraint(equalTo: super.topAnchor, constant: 16),
            autor.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 16),
            autor.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -16),
            
            image.heightAnchor.constraint(equalToConstant: UIWindow().bounds.width),
            image.topAnchor.constraint(equalTo: autor.bottomAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 0),
            image.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: 0),
            
            desc.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            desc.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 16),
            desc.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -16),
            
            likes.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: 16),
            likes.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 16),
            likes.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -16),
            
            views.topAnchor.constraint(equalTo: desc.bottomAnchor, constant: 16),
            views.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -16),
            views.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -16),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(post: Post){
        autor.text = post.autor
        image.image = UIImage(named: "\(post.image)")
        desc.text = post.description
        likes.text = "Likes: \(post.likes)"
        views.text = "Views: \(post.views)"
    }
}
