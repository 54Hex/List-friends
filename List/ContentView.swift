//
//  ContentView.swift
//  List
//
//  Created by Conqueriings on 26/6/21.
//

import SwiftUI

struct ContentView: View {
    // array 
    @State var friends = [
        Friend(name: "Wei Xuan", icon: "bolt.horizontal", school: "Presbyterian High", Image: "ws", attack: 90.0, defence: 100.0, replySpeed: 80.0, types: [.normal, .water, .ice]),
        Friend(name: "TraceTogether", icon: "shield.lefthalf.fill", school: "GovTech", Image: "RickQR", attack: 100.0, defence: 100.0, replySpeed: 100.0, types: [.command]),
        Friend(name: "Mg 🌊🏌️🦁", icon: "person.fill", school: "Presbyterian High", Image: "ws", attack: 100.0, defence: 100.0, replySpeed: 0.0, types: [.normal, .grass, .fire])]
    
    @State var isSheetPresented = false
    
    
    var body: some View {
        NavigationView {
            List (0..<friends.count) { index in
                NavigationLink(destination: VictimDetailView(friend: $friends[index])) {
                    Image(systemName: friends[index].icon)
                    
                    VStack(alignment: .leading) {
                        Text(friends[index].name)
                            .bold()
                        
                        HStack {
                            Text(friends[index].school)
                            
                            Spacer()
                            
                            ForEach(friends[index].types, id: \.rawValue) { type in
                                Image(systemName: type.getSymbolName())
                            }

                        }
                        .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Innocent Victims >:D")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: { isSheetPresented = true}, label: {
                Image(systemName: "plus")
            }))
        }.sheet(isPresented: $isSheetPresented) {
            NewFriendType(friends: $friends)
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
