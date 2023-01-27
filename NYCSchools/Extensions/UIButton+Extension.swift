//
//  UIButton+Extension.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/26/23.
//

import Foundation
import UIKit

// TODO: Can be moved to a UI repo and used across different domains
final class Button: UIButton {
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
        backgroundColor = .secondarySystemBackground
        translatesAutoresizingMaskIntoConstraints = false
        
        // Shadow Color and Radius
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        layer.masksToBounds = false
        layer.cornerRadius = 8.0
    }
}
