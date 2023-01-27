//
//  UILabel+Extension.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/26/23.
//

import Foundation
import UIKit

// TODO: Can be moved to a UI repo and used across different domains
class BodyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        font = .systemFont(ofSize: 16.0)
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        textAlignment = .natural
        textColor = Color.darkBlue
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class SectionTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        font = .boldSystemFont(ofSize: 20.0)
        numberOfLines = 0
        lineBreakMode = .byTruncatingTail
        textAlignment = .natural
        textColor = .black
        translatesAutoresizingMaskIntoConstraints = false
    }
}
