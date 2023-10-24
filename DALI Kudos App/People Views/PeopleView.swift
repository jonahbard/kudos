//
//  PeopleView.swift
//  DALI Kudos App
//
//  Created by Jonah Bard on 10/15/23.
//

import SwiftUI


struct PeopleView: View {
    
    @EnvironmentObject var contentDataModel: ContentDataModel

    
    @State private var searchFieldText = ""
    
    let genericPhoto = "https://www.digitary.net/wp-content/uploads/2021/07/Generic-Profile-Image.png"
    
    var filteredMembers: [Member] {
        guard !searchFieldText.isEmpty else { return contentDataModel.members }
        return contentDataModel.members.filter { $0.name!.range(of: searchFieldText, options: .caseInsensitive) != nil }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredMembers, id: \.self) { member in
                    NavigationLink {
                        ProfileView(member: member)
                            .environmentObject(contentDataModel)
                    } label: {
                        HStack {
                            ///todo: make this a method that all views can call + make genericPhoto globally accessible variable
                            //Image loader same as in profile view. if image doesn't exist load generic photo
                            AsyncImage(url: URL(string: member.picture ?? genericPhoto)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                            } placeholder : { //grey circle while loading
                                Circle()
                                    .foregroundColor(.gray).opacity(0.5)
                            }
                            .frame(width:44, height: 44)
                            
                            Text("\(member.name!)")
                        }
                        
                    }
                }
            }
            .searchable(text: $searchFieldText)
            .navigationTitle("people")
        }
    }
}

struct PeopleView_Previews: PreviewProvider {
    
    static var previews: some View {
        PeopleView()
            .environmentObject(ContentDataModel())
    }
}
