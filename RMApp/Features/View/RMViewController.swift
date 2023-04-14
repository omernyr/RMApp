//
//  ViewController.swift
//  RMApp
//
//  Created by macbook pro on 14.04.2023.
//

import UIKit
import SnapKit

class RMViewController: UIViewController {

    let RMLabel = UILabel()
    let indicator = UIActivityIndicatorView()
    let tableView = UITableView()
    var myList: [Character]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        RMAPIService().fetchData { characters in
            
            DispatchQueue.main.async {
                self.myList = characters
                self.tableView.reloadData()
            }
            
        }
        
        view.addSubview(RMLabel)
        RMLabel.addSubview(indicator)
        view.addSubview(tableView)
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .darkGray
        RMLabel.textAlignment = .left
        RMLabel.layer.borderWidth = 1.0
        RMLabel.layer.borderColor = UIColor.systemPink.cgColor
        RMLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        RMLabel.textColor = .systemMint
        RMLabel.text = "Rick and Morty"
        
        indicator.color = .systemGreen
        indicator.startAnimating()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.borderWidth = 1.0
        tableView.layer.borderColor = UIColor.white.cgColor
        tableView.separatorStyle = .none
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        RMLabel.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(40)
        }
        
        indicator.snp.makeConstraints { make in
            make.centerY.equalTo(RMLabel.snp.centerY)
            make.trailing.equalTo(-20)
        }
        
        tableView.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.top.equalTo(RMLabel.snp.bottom).offset(20)
        }
    }
}

extension RMViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = myList![indexPath.row].name
        return cell
    }
}
