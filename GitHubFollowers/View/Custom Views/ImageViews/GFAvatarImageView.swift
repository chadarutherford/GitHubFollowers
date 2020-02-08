//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/8/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    let cache = NetworkManager.shared.cache
    let placeholderImage = UIImage(named: "avatar-placeholder")!
    var networkLoader: NetworkLoader { URLSession.shared }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        networkLoader.loadData(using: url) { [weak self] data, response, error in
            guard let self = self else { return }
            guard error == nil else { return }
            guard let response = response, response.statusCode == 200 else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async { self.image = image }
        }
    }
}
