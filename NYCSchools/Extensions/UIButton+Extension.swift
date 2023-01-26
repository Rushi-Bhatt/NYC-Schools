//
//  UIButton+Extension.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/26/23.
//

import Foundation
import UIKit

class Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setTitleColor(.black, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 14.0)
        layer.cornerRadius = 10
        layer.masksToBounds = true
        backgroundColor = .secondarySystemBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
}
