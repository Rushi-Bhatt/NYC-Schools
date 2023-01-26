//
//  SchoolDetail.swift
//  NYCSchools
//
//  Created by Rushi Bhatt on 1/22/23.
//

import Foundation

struct SchoolSATDetail: Codable {
    
    let dbn: String
    let name: String
    let totalSATTakers: String
    var satAvgReadingScore: String
    let satAvgMathScore: String
    let satAvgWritingScore: String
    
    enum CodingKeys: String, CodingKey {
        case dbn = "dbn"
        case name = "school_name"
        case totalSATTakers = "num_of_sat_test_takers"
        case satAvgReadingScore = "sat_critical_reading_avg_score"
        case satAvgMathScore = "sat_math_avg_score"
        case satAvgWritingScore = "sat_writing_avg_score"
    }
}
