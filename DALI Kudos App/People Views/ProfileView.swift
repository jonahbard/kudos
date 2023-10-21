//
//  UserView.swift
//  DALI Kudos App
//
//  Created by Jonah Bard on 10/15/23.
//

import SwiftUI

extension String {
    func convertBirthdayFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd"
        guard let date = dateFormatter.date(from: self) else { return "N/A" }
        dateFormatter.dateFormat = "MMMM dd"
        return dateFormatter.string(from: date)
    }
}

struct ProfileView: View {
    
    @State var member: Member
    @State private var profilePhoto: Image = Image(systemName: "photo")
    @EnvironmentObject var contentDataModel: ContentDataModel
    
    let genericPhoto = "https://www.digitary.net/wp-content/uploads/2021/07/Generic-Profile-Image.png"

    func loadRoles() -> [Text] {
        var rolesList = [Text]()
        if member.core ?? false {
            rolesList.append(Text("• core team").foregroundColor(.orange))}
        if member.pm ?? false {
            rolesList.append(Text("• pm").foregroundColor(.pink))}
        if member.dev ?? false {
            rolesList.append(Text("• developer").foregroundColor(.blue))}
        if member.des ?? false {
            rolesList.append(Text("• designer").foregroundColor(.green))}
        if member.mentor ?? false {
            rolesList.append(Text("• mentor").foregroundColor(.purple))}
        
        return rolesList
    }
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                VStack () {
                    HStack {
                        AsyncImage(url: URL(string: member.picture ?? genericPhoto)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                        } placeholder : {
                            Circle()
                                .foregroundColor(.gray)
                        }
                        .padding(EdgeInsets(top: 30, leading: 40, bottom: 20, trailing: 10))
                        VStack(alignment: .leading) {
                            Text(member.name!)
                                .font(.title2)
                                .bold()
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 3, trailing: 0))
                            Text(member.year! != "GR" ? ("class of " + member.year!) : ("graduate"))
                                .foregroundColor(.gray)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
                            ForEach(0..<loadRoles().count, id: \.self) { i in
                                loadRoles()[i]
                            }
                        }
                        .padding(.trailing, 40)
                        Spacer()
                        
                    }
                    ZStack(alignment: .topLeading) {
                        Rectangle()
                            .cornerRadius(20)
                            .frame(minHeight: 60)
                            .padding(EdgeInsets(top: 0, leading: 25, bottom: 10, trailing: 25))
                            .foregroundStyle(.thickMaterial)
                            .tint(.gray)
                        ScrollView {
                            VStack(alignment: .leading) {
                                Group {
                                    Group {
                                        Text("Major: ")
                                            .bold() +
                                        Text(member.major ?? "N/A")
                                        
                                    }
                                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)) // if I delete this line type checking is too slow for compiler
                                    Group {
                                        Text("Minor: ")
                                            .bold() +
                                        Text(member.minor ?? "N/A")
                                    }
                                    Group {
                                        Text("Hometown: ")
                                            .bold() +
                                        Text(member.home ?? "N/A")
                                    }
                                    Group {
                                        Text("Quote: ")
                                            .bold() +
                                        Text(member.quote ?? "N/A")
                                    }
                                    Group {
                                        Text("Birthday: ")
                                            .bold() +
                                        Text(member.birthday?.convertBirthdayFormat() ?? "N/A")
                                    }
                                    Group {
                                        Text("Fun fact: ")
                                            .bold() +
                                        Text(member.funFact ?? "N/A")
                                    }
                                }
                                .padding(EdgeInsets(top: 0, leading: 50, bottom: 10, trailing: 0))
                                Group {
                                    Text("Favorite things: ")
                                        .bold()
                                        .padding(.bottom, -10)
                                    Text(" • " + (member.favoriteThing1 ?? "N/A")) +
                                    Text(" • " + (member.favoriteThing2 ?? "N/A")) +
                                    Text(" • " + (member.favoriteThing3 ?? "N/A"))
    
                                }
                                .padding(EdgeInsets(top: 0, leading: 50, bottom: 10, trailing: 0))
                                Group {
                                    Text("Favorite Dartmouth tradition: ")
                                        .bold()
                                        .padding(.bottom, -10)
                                    Text((member.favoriteDartmouthTradition ?? "N/A"))
    
                                }
                                .padding(EdgeInsets(top: 0, leading: 50, bottom: 10, trailing: 0))

                                
                            }.frame(width: abs(geometry.size.width - 50), alignment: .leading)
                        }
                        .padding(.bottom, 30)
                        .padding(.top, 20)
                    }
                    Spacer()
                }
                .navigationBarTitle(member.name == contentDataModel.user.name ? "my profile" : "profile")
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(member: Member(name: "Jonah Bard", year: "2027", dev: true, des: true, pm: false, core: false, mentor: false, major: "Computer Science", minor: nil, birthday: "03-10", home: "Los Angeles, CA", quote: "“If the goal is to explore, it’s impossible not to find happiness.”", favoriteThing1: "coding", favoriteThing2: "climbing", favoriteThing3: "food", favoriteDartmouthTradition: "Homecoming bonfire", funFact: "I can do a backflip!", picture: "https://media.licdn.com/dms/image/D5603AQH8OP5IzwadlQ/profile-displayphoto-shrink_400_400/0/1694294670860?e=1703116800&v=beta&t=Atx5aMDRJqN8-u28tiHifLVUpJEcRC0az5njHO_y8EI"))
            .environmentObject(ContentDataModel())
    }
}
