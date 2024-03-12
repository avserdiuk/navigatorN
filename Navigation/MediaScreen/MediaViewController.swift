//
//  MediaViewController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 07.03.2024.
//

import UIKit
import AVFoundation

class MediaViewController: UIViewController {
    
    private let videos : [String] = ["video", "video2"]
    
    private var player : AVPlayer = AVPlayer()
    private var playerPause = false
    private var currentIndex = -1
    
    private lazy var playerLayer : AVPlayerLayer = {
        let layer = AVPlayerLayer(player: player)
        layer.frame = CGRect(x: 0, y: 0, width: 350, height: 250)
        return layer
    }()
    
    private lazy var videoview : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGroupedBackground
        view.layer.addSublayer(playerLayer)
        return view
    }()
    
    private lazy var tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .systemGroupedBackground
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(videoview)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            videoview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            videoview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            videoview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            videoview.heightAnchor.constraint(equalToConstant: 220),
            
            tableView.topAnchor.constraint(equalTo: videoview.bottomAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: CGFloat(videos.count * 44)),
        ])
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        player.replaceCurrentItem(with: nil)
        currentIndex = -1
        tableView.reloadData()
        
    }
    
    private func startPlayer(url: URL){
        player = AVPlayer(url: url)
        playerLayer.player = player
        player.play()
    }
    
}

extension MediaViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(videos[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row != currentIndex {
            guard let url = Bundle.main.url(forResource: "\(videos[indexPath.row])", withExtension: "mp4") else {
                return
            }
            startPlayer(url: url)
            currentIndex = indexPath.row
        } else if (indexPath.row == currentIndex) && (playerPause ==  false){
            player.pause()
            playerPause.toggle()
        } else if (indexPath.row == currentIndex) && (playerPause ==  true){
            player.play()
            playerPause.toggle()
        }
    }
}
