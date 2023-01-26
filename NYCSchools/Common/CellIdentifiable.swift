//
//  CellIdentifiable.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/23/23.
//

import Foundation

protocol CellIdentifiable {
    static var cellIdentifier: String { get }
}

extension CellIdentifiable {
    static var cellIdentifier: String { String(describing: Self.self) }
}
