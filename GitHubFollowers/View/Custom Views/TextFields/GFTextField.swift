//
//  GFTextField.swift
//  GitHubFollowers
//
//  Created by Chad Rutherford on 2/6/20.
//  Copyright © 2020 chadarutherford.com. All rights reserved.
//

import SwiftUI
import UIKit

class GFTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        returnKeyType = .go
        clearButtonMode = .whileEditing
        placeholder = "Enter a Username"
    }
}

struct GFTextFieldPreview: PreviewProvider {
    static var previews: some View {
        ContainerView()
    }
    
    struct ContainerView: UIViewRepresentable {
        func updateUIView(_ uiView: GFTextFieldPreview.ContainerView.UIViewType, context: UIViewRepresentableContext<GFTextFieldPreview.ContainerView>) {
            
        }
        
        func makeUIView(context: UIViewRepresentableContext<GFTextFieldPreview.ContainerView>) -> GFTextField {
            GFTextField()
        }
    }
}
