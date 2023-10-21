//
//  UserDataModel.swift
//  DALI Kudos App
//
//  Created by Jonah Bard on 10/15/23.
//

import Foundation

class MemberDataModel: ObservableObject {
    @Published var members = [Member]()
    
    init() {
        loadMembers()
    }
    
    func loadMembers() {
        if let membersListFile = Bundle.main.url(forResource: "dali_social_media", withExtension: ".json") {
            do {
                let data = try Data(contentsOf: membersListFile)

                let jsonDecoder = JSONDecoder()
                
                let jsonData = try jsonDecoder.decode([Member].self, from: data)
                
                self.members = jsonData
            } catch {
                print("\(error)\ncouldn't load members!")
            }
        }
    }
}
