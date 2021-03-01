//
//  School.swift
//  LocalJSONTableView
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 01/03/21.
//

import Foundation

struct School: Codable{
    var className: String
    var member: [Student]
    
    struct Student: Codable{
        var name: String
        var gender: Gender
        var rank: Int
        var hoby: String
        var council: Bool
        var club: String
    }
    
    enum Gender: String, Codable{
        case male, female
    }
}
