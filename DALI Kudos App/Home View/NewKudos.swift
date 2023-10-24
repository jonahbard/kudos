//
//  NewKudos.swift
//  DALI Kudos App
//
//  Created by Jonah Bard on 10/15/23.
//

import SwiftUI

struct NewKudos: View {
    
    @EnvironmentObject var contentDataModel: ContentDataModel
    @Environment(\.dismiss) var dismiss
    
    @State var wrongNameDialogPresented = false


    @State var type = "gratitude"
    @State var to = ""
    @State var text = ""
    let kudosTypes = ["gratitude", "approval", "support", "praise"]
    
    func checkForPerson(person: String) -> Member? { // return first instance with matching name
        return contentDataModel.members.first { member in
            person.lowercased() == member.name!.lowercased() //works even when input is not capitalized
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                // input fields
                Section(){ //everything is in 1 section
                    VStack {
                        Image(type)
                            .padding()
                            .shadow(radius: 5)
                        Picker(selection: $type) { //kudos type selector
                            ForEach(kudosTypes, id: \.self) {
                                Text($0)
                                    .fontWeight(.medium)
                            }
                        } label: {
                            Text("type:")
                                .font(.title3).fontWeight(.medium)
                                .padding(12)
                        }
                    }
                    HStack {
                        Spacer()
                        Text("to:") //receiver
                            .font(.title3).fontWeight(.medium)
                            .padding(7)
                        TextField("full name" , text: $to)
                            .font(.title3).fontWeight(.medium)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Spacer()
                        Text("for:") //sender
                            .font(.title3).fontWeight(.medium)
                            .padding(7)
                        TextField("what?" , text: $text)
                            .font(.title3).fontWeight(.medium)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationBarTitle("new kudos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button("send!"){
                        let receiver = checkForPerson(person: to)
                        if receiver == nil { //name is not correct
                            wrongNameDialogPresented = true
                        } else if text != "" { //only send if there's a name
                            contentDataModel.allKudos.insert(Kudos(type: type, text: text, from: contentDataModel.user, to: receiver!), at: 0)
                            print("sent!")
                            dismiss()
                        }
                    }
                    .alert(isPresented: $wrongNameDialogPresented){
                        Alert(title: Text("uh oh"), message: Text("member name not found!"))
                    }
                    .foregroundColor(.pink)
                })
            }
        }
    }
}

struct NewKudos_Previews: PreviewProvider {
    static var previews: some View {
        NewKudos()
            .environmentObject(ContentDataModel())
    }
}
