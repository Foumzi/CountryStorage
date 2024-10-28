//
//  Country.swift
//  CountryStorage
//
//  Created by Amine Nakhle on 27/10/2024.
//

import Foundation

struct CountryResult: Codable {
    var name: CountryName
    var flags: CountryFlag
    
}

struct CountryName: Codable {
    var common: String
}

struct CountryFlag: Codable {
    var png: String
}
