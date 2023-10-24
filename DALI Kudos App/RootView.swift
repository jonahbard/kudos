//
//  RootView.swift
//  DALI Kudos App
//
//  Created by Jonah Bard on 10/15/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var contentDataModel: ContentDataModel
    
    var user: Member
    
    
    var body: some View {
        TabView { // tab view containing each screen
            HomeView()
                .environmentObject(contentDataModel)
                .tabItem {
                Image(systemName: "house")
                Text("home")
            }
            PeopleView()
                .environmentObject(contentDataModel)
                .tabItem {
                    Image(systemName: "person.3.sequence")
                    Text("people")
                }
            ProfileView(member: user)
                .environmentObject(contentDataModel)
                .tabItem {
                    Image(systemName: "person")
                    Text("my profile")
                }
        }
        .environmentObject(contentDataModel)
        .tint(.pink)
        

    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        let contentDataModel = ContentDataModel()

        RootView(user: contentDataModel.user)
            .environmentObject(contentDataModel)
    }
}
