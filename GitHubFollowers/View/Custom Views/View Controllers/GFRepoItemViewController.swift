//
//  GFRepoItemViewController.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/9/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import UIKit

class GFRepoItemViewController: GFItemInfoViewController {
    
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
        itemInfoView1.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoView2.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
}
