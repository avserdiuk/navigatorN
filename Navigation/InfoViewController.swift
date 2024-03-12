//
//  InfoViewController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 18.12.2023.
//

import UIKit

struct Resident : Decodable {
    let name: String
}

class InfoViewController : UIViewController {
    
    private lazy var button : UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        btn.tintColor = .white
        btn.backgroundColor = .systemBlue
        btn.setTitle("Show Alert!", for: .normal)
        btn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
        return btn
    }()
    
    private lazy var label : UILabel = {
        let label = UILabel(frame: CGRect(x: view.center.x-75, y: view.center.y-100, width: 150, height: 50))
        label.textAlignment = .center
        label.text = "test"
        return label
    }()
    
    private lazy var table : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemBackground
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    var residents : [String] = []
    var model : Planet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        //        self.view.addSubview(button)
        //        self.view.addSubview(label)
        //        self.button.center = self.view.center
        
        view.addSubview(table)
        
        NSLayoutConstraint.activate([
            
            table.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
            
        ])
        
        NetworkManager.requestJsonCodable { model in
            self.model = model
            
            model.residents.forEach {
                if let request = URL(string: $0) {
                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        if let data {
                            if let name = try? JSONDecoder().decode(Resident.self, from: data){
                                self.residents.append(name.name)
                            }
                        }
                    }
                    task.resume()
                }
            }
            
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        residents.removeAll()
    }
    
    @objc func didTapBtn(){
        
        //        NetworkManager.requestJson { title in
        //            DispatchQueue.main.async {
        //                self.label.text = title
        //            }
        //        }
        
        //        let alert = UIAlertController(title: "Pay attention please!", message: "This is an alert.", preferredStyle: .alert)
        //        alert.addAction(UIAlertAction(title: "Print", style: .default){ _ in
        //            print("alert is work")
        //        })
        //        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        //        self.present(alert, animated: true, completion: nil)
        
    }
}

extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model?.residents.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = residents[indexPath.row]
        return cell
    }
    
    
}
