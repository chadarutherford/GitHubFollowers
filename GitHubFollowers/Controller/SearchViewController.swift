//
//  SearchViewController.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/6/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import SwiftUI
import UIKit

class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}

struct SearchViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func updateUIViewController(_ uiViewController: SearchViewControllerPreview.ContainerView.UIViewControllerType,
                                    context: UIViewControllerRepresentableContext<SearchViewControllerPreview.ContainerView>) {
            
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SearchViewControllerPreview.ContainerView>) -> UIViewController {
            SearchViewController()
        }
    }
}
