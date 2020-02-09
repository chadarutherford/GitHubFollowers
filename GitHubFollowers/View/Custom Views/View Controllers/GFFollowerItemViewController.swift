//
//  GFFollowerItemViewController.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/9/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import UIKit

class GFFollowerItemViewController: GFItemInfoViewController {
    override var user: User! {
        didSet {
            configureItems()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        guard let user = user, self.isViewLoaded else { return }
        itemInfoView1.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoView2.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
