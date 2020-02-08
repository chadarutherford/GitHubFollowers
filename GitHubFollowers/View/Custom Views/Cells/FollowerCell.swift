//
//  FollowerCell.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/8/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    var follower: Follower? {
        didSet {
            updateViews()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        updateViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func updateViews() {
        guard let follower = follower else { return }
        usernameLabel.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarURL)
    }
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
