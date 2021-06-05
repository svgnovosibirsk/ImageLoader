//
//  ImageFetcher.swift
//  ImageLoader
//
//  Created by Sergey Golovin on 05.06.2021.
//  Copyright © 2021 GoldenWindGames LLC. All rights reserved.
//

import UIKit

class ImageFetcher {
    static let shared = ImageFetcher()
    
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) {
        let session = URLSession.shared
        let request = URLRequest(url: url)
        DispatchQueue.global().async {
            let task = session.dataTask(with: request, completionHandler: { data, response, error in
                guard error == nil else { return }
                
                guard let data = data else { return }
                
                DispatchQueue.main.async {
                    if let cell = cell as? ImageTableViewCell {
                        cell.cellImageView.image = UIImage(data: data)
                    } else {
                        print(error?.localizedDescription ?? "ImageTableViewCell typecasting error")
                    }
                }
            })
            
            task.resume()
        }
    }
}
