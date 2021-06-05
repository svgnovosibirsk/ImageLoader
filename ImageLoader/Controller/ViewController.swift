//
//  ViewController.swift
//  ImageLoader
//
//  Created by Sergey Golovin on 05.06.2021.
//  Copyright © 2021 GoldenWindGames LLC. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var indexes = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Image Loader"
        
        for i in 1...100 {
            indexes.append(i)
        }
        
        tableView.register(UINib(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return indexes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexes[indexPath.row]
        guard let url = URL(string: "http://placehold.it/375x150?text=\(index)") else { return UITableViewCell() }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as? ImageTableViewCell {
            ImageFetcher.shared.downloadImage(withURL: url, forCell: cell)
            return cell
        }
        
        return UITableViewCell()
    }
}
