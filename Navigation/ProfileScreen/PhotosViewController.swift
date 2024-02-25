//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 09.01.2024.
//

import UIKit
import iOSIntPackage

class PhotosViewController : UIViewController {
    
    var images: [UIImage] = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "4")!, UIImage(named: "5")!, UIImage(named: "6")!, UIImage(named: "7")!]
    var imageProcess = ImageProcessor()
    
    private lazy var layout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //        layout.minimumLineSpacing = 8
        //        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return layout
    }()
    
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        return collection
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Gallery"
        view.backgroundColor = .systemGray6
        
        view.addSubview(collection)
        
        NSLayoutConstraint.activate([
            
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        imageProcess.processImagesOnThread(sourceImages: images, filter: .colorInvert, qos: .background) { img in
            self.images = []
            for i in 0...img.count-1 {
                self.images.append(UIImage(cgImage: img[i]!))
            }
            
            DispatchQueue.main.async {
                self.collection.reloadData()
            }
        }
    }
    
    
}


extension PhotosViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //15
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell
        //cell.setupImage(name: "\(indexPath.item + 1)")
        cell.setup(image: images[indexPath.item])
        return cell
        
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (UIScreen.main.bounds.width - 36) / 3
        return CGSize(width: itemSize, height: itemSize)
    }
}
