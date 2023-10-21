//
//  DALI_Kudos_AppApp.swift
//  DALI Kudos App
//
//  Created by Jonah Bard on 10/15/23.
//

import SwiftUI

@main
struct DALI_Kudos_AppApp: App {
    
    @ObservedObject var contentDataModel = ContentDataModel()
    
    var body: some Scene {
        WindowGroup {
            RootView(user: contentDataModel.user)
                .environmentObject(contentDataModel)
        }

    }
}
