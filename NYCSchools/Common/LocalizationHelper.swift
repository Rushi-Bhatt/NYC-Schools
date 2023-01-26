//
//  LocalizationHelper.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/25/23.
//

import Foundation

// TODO: Can be moved to a Localization repo and used across different domains
/// Generic Localization Utility
final class LocalizationHelper {
    static var localizationTableName: String?
    static var localizationBundle: Bundle { Bundle.main }
    
    static func localize(key: String, params: CustomStringConvertible...) -> String {
        let formatString = NSLocalizedString(key, tableName: localizationTableName, bundle: localizationBundle, value: "", comment: "")
        return String(format: formatString, arguments: params.map { "\($0)" })
    }
}
