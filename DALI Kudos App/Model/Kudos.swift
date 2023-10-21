//
//  Kudos.swift
//  DALI Kudos App
//
//  Created by Jonah Bard on 10/15/23.
//

import Foundation

struct Kudos: Identifiable, Codable, Hashable {
    var id = UUID()
    let type: String
    let text: String
    let from: Member
    let to: Member
}
