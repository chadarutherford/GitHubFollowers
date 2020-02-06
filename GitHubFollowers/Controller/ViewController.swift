//
//  ViewController.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/6/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import SwiftUI
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func updateUIViewController(_ uiViewController: ViewControllerPreview.ContainerView.UIViewControllerType,
                                    context: UIViewControllerRepresentableContext<ViewControllerPreview.ContainerView>) {
            
        }
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerPreview.ContainerView>) -> UIViewController {
            ViewController()
        }
    }
}
