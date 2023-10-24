//
//  KudosListElement.swift
//  DALI Kudos App
//
//  Created by Jonah Bard on 10/15/23.
//

import SwiftUI


struct KudosListElement: View {
    var kudos: Kudos
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(kudos.type)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .shadow(radius: 3)
                    VStack(alignment: .leading) {
                        Text(kudos.type)
                            .font(.title2)
                            .bold()
                            .padding(.bottom, 5)
                        Group { Text("from ") + Text(kudos.from.name!).bold()}
                            .opacity(0.75)
                            .padding(.bottom, -5)
                        Group { Text("to ") + Text(kudos.to.name!).bold()}
                            .opacity(0.75)
                    }
                    .padding(.leading, 10)
                    
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(.gray).opacity(0.1)
                        .cornerRadius(5)
                    ScrollView {
                        Text("\"\(kudos.text)\"")
                            .italic()
                    }.padding(10)
                }
                .padding(EdgeInsets(top: 5, leading: 20, bottom: 0, trailing: 20))
                .frame(maxHeight: 100)
                
                
            }
            .frame(alignment: .center)
            //.padding()
        }
        
    }
}

struct KudosListElement_Previews: PreviewProvider {
    static var previews: some View {
        KudosListElement(kudos: Kudos(type: "gratitude", text: "thanks", from: Member(name: "Jonah Bard", year: "2027", dev: true, des: true, pm: true, core: false, mentor: false, major: "Computer Science", minor: nil, birthday: "03-10", home: "Los Angeles, CA", quote: "quote", favoriteThing1: "coding", favoriteThing2: "climbing", favoriteThing3: "food", favoriteDartmouthTradition: "bonfire", funFact: "I can do a backflip", picture: "https://media.licdn.com/dms/image/D5603AQH8OP5IzwadlQ/profile-displayphoto-shrink_400_400/0/1694294670860?e=1703116800&v=beta&t=Atx5aMDRJqN8-u28tiHifLVUpJEcRC0az5njHO_y8EI"), to: Member(name: "Jonah Bard", year: "2027", dev: true, des: true, pm: true, core: false, mentor: false, major: "Computer Science", minor: nil, birthday: "03-10", home: "Los Angeles, CA", quote: "quote", favoriteThing1: "coding", favoriteThing2: "climbing", favoriteThing3: "food", favoriteDartmouthTradition: "bonfire", funFact: "I can do a backflip", picture: "https://media.licdn.com/dms/image/D5603AQH8OP5IzwadlQ/profile-displayphoto-shrink_400_400/0/1694294670860?e=1703116800&v=beta&t=Atx5aMDRJqN8-u28tiHifLVUpJEcRC0az5njHO_y8EI"))
        )
    }
}
