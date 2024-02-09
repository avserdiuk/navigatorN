//
//  PhotosTbaleViewCell.swift
//  Navigation
//
//  Created by Алексей Сердюк on 09.01.2024.
//

import UIKit

class PhotosTableViewCell : UITableViewCell {
    
    private let itemSize = (UIScreen.main.bounds.width - 56) / 4
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var arrowIco : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        return imageView
    }()
    
    private lazy var layout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(title)
        addSubview(arrowIco)
        addSubview(collection)
        
        NSLayoutConstraint.activate([
        
            title.topAnchor.constraint(equalTo: super.topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 12),
            
            arrowIco.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            arrowIco.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -12),
            arrowIco.heightAnchor.constraint(equalToConstant: 24),
            
            collection.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            collection.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 12),
            collection.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -12),
            collection.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -12),
            collection.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48)/4)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell
        cell.setupImage(name: "\(indexPath.item+1)")
        return cell
    }
}

extension PhotosTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: itemSize, height: itemSize)
    }
}
