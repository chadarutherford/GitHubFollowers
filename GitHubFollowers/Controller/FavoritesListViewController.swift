//
//  FavoritesListViewController.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/6/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import SwiftUI
import UIKit

class FavoritesListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}

struct FavoritesListViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func updateUIViewController(_ uiViewController: FavoritesListViewControllerPreview.ContainerView.UIViewControllerType,
                                    context: UIViewControllerRepresentableContext<FavoritesListViewControllerPreview.ContainerView>) {
            
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<FavoritesListViewControllerPreview.ContainerView>) -> UIViewController {
            FavoritesListViewController()
        }
    }
}
