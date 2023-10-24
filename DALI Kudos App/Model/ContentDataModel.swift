//
//  DataModel.swift
//  DALI Kudos App
//
//  Created by Jonah Bard on 10/15/23.
//

import Foundation

class ContentDataModel: ObservableObject {
    
    @Published var user = Member(name: "Jonah Bard", year: "2027", dev: true, des: true, pm: nil, core: nil, mentor: nil, major: "Computer Science", minor: "Education", birthday: "03-10", home: "Los Angeles, CA", quote: "quote", favoriteThing1: "coding", favoriteThing2: "climbing", favoriteThing3: "food", favoriteDartmouthTradition: "Homecoming bonfire!", funFact: "I can do a backflip!", picture: "https://media.licdn.com/dms/image/D5603AQH8OP5IzwadlQ/profile-displayphoto-shrink_400_400/0/1694294670860?e=1703116800&v=beta&t=Atx5aMDRJqN8-u28tiHifLVUpJEcRC0az5njHO_y8EI")
    
    @Published var allKudos = [ //instantiated with sample kudos feed, with existing names
        Kudos(type: "gratitude", text: "thanks for bringing snacks to the lab yesterday!", from: Member(name: "Julian Wu", year: "2027", dev: true, des: true, pm: true, core: false, mentor: false, major: "Computer Science", minor: nil, birthday: "03-10", home: "Los Angeles, CA", quote: "quote", favoriteThing1: "coding", favoriteThing2: "climbing", favoriteThing3: "food", favoriteDartmouthTradition: nil, funFact: nil, picture: "https://media.licdn.com/dms/image/D5603AQH8OP5IzwadlQ/profile-displayphoto-shrink_400_400/0/1694294670860?e=1703116800&v=beta&t=Atx5aMDRJqN8-u28tiHifLVUpJEcRC0az5njHO_y8EI"), to: Member(name: "Georgia Dawahare", year: "2027", dev: true, des: true, pm: true, core: false, mentor: false, major: "Computer Science", minor: nil, birthday: "03-10", home: "Los Angeles, CA", quote: "quote", favoriteThing1: "coding", favoriteThing2: "climbing", favoriteThing3: "food", favoriteDartmouthTradition: nil, funFact: nil, picture: "https://media.licdn.com/dms/image/D5603AQH8OP5IzwadlQ/profile-displayphoto-shrink_400_400/0/1694294670860?e=1703116800&v=beta&t=Atx5aMDRJqN8-u28tiHifLVUpJEcRC0az5njHO_y8EI")),
        
        Kudos(type: "support", text: "feel better soon! can't wait to continue working with you", from: Member(name: "Kaylie Sampson", year: "2027", dev: true, des: true, pm: true, core: false, mentor: false, major: "Computer Science", minor: nil, birthday: "03-10", home: "Los Angeles, CA", quote: "quote", favoriteThing1: "coding", favoriteThing2: "climbing", favoriteThing3: "food", favoriteDartmouthTradition: nil, funFact: nil, picture: "https://media.licdn.com/dms/image/D5603AQH8OP5IzwadlQ/profile-displayphoto-shrink_400_400/0/1694294670860?e=1703116800&v=beta&t=Atx5aMDRJqN8-u28tiHifLVUpJEcRC0az5njHO_y8EI"), to: Member(name: "Annie Qiu", year: "2027", dev: true, des: true, pm: true, core: false, mentor: false, major: "Computer Science", minor: nil, birthday: "03-10", home: "Los Angeles, CA", quote: "quote", favoriteThing1: "coding", favoriteThing2: "climbing", favoriteThing3: "food", favoriteDartmouthTradition: nil, funFact: nil, picture: "https://media.licdn.com/dms/image/D5603AQH8OP5IzwadlQ/profile-displayphoto-shrink_400_400/0/1694294670860?e=1703116800&v=beta&t=Atx5aMDRJqN8-u28tiHifLVUpJEcRC0az5njHO_y8EI")),
        
        Kudos(type: "approval", text: "AMAZING job with the project wireframe, I'm super excited to update the main screen!", from: Member(name: "Jason Pak", year: "2027", dev: true, des: true, pm: true, core: false, mentor: false, major: "Computer Science", minor: nil, birthday: "03-10", home: "Los Angeles, CA", quote: "quote", favoriteThing1: "coding", favoriteThing2: "climbing", favoriteThing3: "food", favoriteDartmouthTradition: nil, funFact: nil, picture: "https://media.licdn.com/dms/image/D5603AQH8OP5IzwadlQ/profile-displayphoto-shrink_400_400/0/1694294670860?e=1703116800&v=beta&t=Atx5aMDRJqN8-u28tiHifLVUpJEcRC0az5njHO_y8EI"), to: Member(name: "Jennifer Xu", year: "2027", dev: true, des: true, pm: true, core: false, mentor: false, major: "Computer Science", minor: nil, birthday: "03-10", home: "Los Angeles, CA", quote: "quote", favoriteThing1: "coding", favoriteThing2: "climbing", favoriteThing3: "food", favoriteDartmouthTradition: nil, funFact: nil, picture: "https://media.licdn.com/dms/image/D5603AQH8OP5IzwadlQ/profile-displayphoto-shrink_400_400/0/1694294670860?e=1703116800&v=beta&t=Atx5aMDRJqN8-u28tiHifLVUpJEcRC0az5njHO_y8EI"))
        ]
    
    @Published var members = [Member]()
    
    init() {
        loadMembers()
    }
    
    func loadMembers() { //populate list of members from JSON
        if let membersListFile = Bundle.main.url(forResource: "dali_social_media", withExtension: ".json") {
            do {
                let data = try Data(contentsOf: membersListFile)
                let jsonDecoder = JSONDecoder()
                let jsonData = try jsonDecoder.decode([Member].self, from: data)
                
                self.members = jsonData
            } catch {
                print("\(error.localizedDescription)\ncouldn't load members!")
            }
        }
    }
    
}
