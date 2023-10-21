//
//  ContentView.swift
//  DALI Kudos App
//
//  Created by Jonah Bard on 10/15/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var contentDataModel: ContentDataModel
    
    @State var newKudosSheetPresented = false;
    
    var body: some View {
            NavigationView {
                List {
                    ForEach(0..<contentDataModel.allKudos.count, id: \.self) { index in
                        HStack{                            KudosListElement(kudos: contentDataModel.allKudos[index])
                                .padding(.top, 20)
                                .padding(.bottom, 20)
                            Spacer()

                        }
                    }
                }
                    
                    .navigationBarTitle("kudos", displayMode: .large)
            }
            .overlay(alignment: .bottomTrailing){
                Button(
                    action: {
                        newKudosSheetPresented = true
                    }, label: {
                        ZStack() {
                            Circle()
                                .size(width: 75, height: 75)
                                .padding()
                                .foregroundColor(.pink)
                                .shadow(radius: 10)
                                
                            
                            
                            VStack {
                                Text("+")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .frame(width: 75, height: 75)
                                    .padding(15)
                            }
                                
                        }
                        .frame(width: 75, height: 75)
                        .padding(50)
                    }
                )
            }
            .sheet(isPresented: $newKudosSheetPresented){
                NewKudos()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
            .environmentObject(ContentDataModel())
    }
}
