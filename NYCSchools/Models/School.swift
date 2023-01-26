//
//  School.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/22/23.
//

import Foundation

struct School: Codable {
    
    let dbn: String
    let name: String
    let overview: String
    var totalStudents: String
    let address: String
    let city: String
    let zip: String
    let state: String
    let latitude: String?
    let longitude: String?
    let email: String?
    let phone: String
    let website: String
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case name = "school_name"
        case overview = "overview_paragraph"
        case totalStudents = "total_students"
        case address = "primary_address_line_1"
        case city = "city"
        case zip = "zip"
        case state = "state_code"
        case latitude = "latitude"
        case longitude = "longitude"
        case email = "school_email"
        case phone = "phone_number"
        case website = "website"
    }
}
