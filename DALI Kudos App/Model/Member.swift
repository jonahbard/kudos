//
//  Member.swift
//  DALI Kudos App
//
//  Created by Jonah Bard on 10/15/23.
//

import Foundation

struct Member: Identifiable, Codable, Hashable {
    let id = UUID()
    let name: String?
    let year: String?
    let dev: Bool?
    let des: Bool?
    let pm: Bool?
    let core: Bool?
    let mentor: Bool?
    let major: String?
    let minor: String?
    let birthday: String?
    let home: String?
    let quote: String?
    let favoriteThing1: String?
    let favoriteThing2: String?
    let favoriteThing3: String?
    let favoriteDartmouthTradition: String?
    let funFact: String?
    let picture: String?
    
    enum CodingKeys: String, CodingKey { //the keys that it looks for in JSON
        case name, year, dev, des, pm, core, mentor, major, minor, birthday, home, quote, picture
        case favoriteThing1 = "favorite thing 1"
        case favoriteThing2 = "favorite thing 2"
        case favoriteThing3 = "favorite thing 3"
        case favoriteDartmouthTradition = "favorite dartmouth tradition"
        case funFact = "fun fact"
    }
}
