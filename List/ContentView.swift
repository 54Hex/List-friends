//
//  ContentView.swift
//  List
//
//  Created by Conqueriings on 26/6/21.
//

import SwiftUI

struct ContentView: View {
    // array 
    //@State var friends = [
        //Friend(name: "Wei Xuan", icon: "bolt.horizontal", school: "Presbyterian High", Image: "ws", attack: 90.0, defence: 100.0, replySpeed: 80.0, types: [.normal, .water, .ice]),
        //Friend(name: "TraceTogether", icon: "shield.lefthalf.fill", school: "GovTech", Image: "RickQR", attack: 100.0, defence: 100.0, replySpeed: 100.0, types: [.command]),
       // Friend(name: "Mg 🌊🏌️🦁", icon: "person.fill", school: "Presbyterian High", Image: "ws", attack: 100.0, defence: 100.0, replySpeed: 0.0, types: [.normal, .grass, .fire])]
    
    @Binding var friends: [Friend]
    
    @State var isSheetPresented = false
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(friends) { friend in
                    let friendIndex = friends.firstIndex(of: friend)!
                    
                    NavigationLink(destination: VictimDetailView(friend: $friends[friendIndex])) {
                        Image(systemName: friend.icon)
                        
                        VStack(alignment: .leading) {
                            Text(friend.name)
                                .bold()
                            HStack {
                                Text(friend.school)
                                
                                Spacer()
                                
                                ForEach(friend.types, id: \.rawValue) { type in
                                    Image(systemName: type.getSymbolName())
                                }
                            }
                        }
                    }
                }.onDelete { offsets in
                    friends.remove(atOffsets: offsets)
                }.onMove { source, destination in
                    friends.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationTitle("Friends")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                    isSheetPresented = true
                                }, label: {
                                    Image(systemName: "plus")
                                }))
        }.sheet(isPresented: $isSheetPresented) {
            NewFriendType(friends: $friends)
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(friends: .constant([Friend(name: "Wei Xuan", icon: "bolt.horizontal", school: "Presbyterian High", Image: "ws", attack: 90.0, defence: 100.0, replySpeed: 80.0, types: [.normal, .water, .ice]), Friend(name: "TraceTogether", icon: "shield.lefthalf.fill", school: "GovTech", Image: "RickQR", attack: 100.0, defence: 100.0, replySpeed: 100.0, types: [.command]), Friend(name: "Mg 🌊🏌️🦁", icon: "person.fill", school: "Presbyterian High", Image: "ws", attack: 100.0, defence: 100.0, replySpeed: 0.0, types: [.normal, .grass, .fire])]))
    }
}
