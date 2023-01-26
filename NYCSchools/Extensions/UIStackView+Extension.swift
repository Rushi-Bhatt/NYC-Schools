//
//  UIStackView+Extension.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/26/23.
//

import Foundation
import UIKit

class VStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        distribution = .fillEqually
        axis = .vertical
        alignment = .leading
        translatesAutoresizingMaskIntoConstraints = false
    }
}

class HStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        distribution = .fillEqually
        axis = .horizontal
        alignment = .center
        spacing = 15
        translatesAutoresizingMaskIntoConstraints = false
    }
}
