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
        friend(name: "Wei Xuan", icon: "bolt.horizontal", school: "Presbyterian High", Image: "ws", attack: 90.0, defence: 100.0, replySpeed: 80.0, types: [.normal, .water, .ice]),
        friend(name: "2", icon: "lock.open.fill", school: "School 1", Image: "sloth2", attack: 90.0, defence: 100.0, replySpeed: 50.0, types: [.normal]),
        friend(name: "Ms Goh", icon: "person.fill", school: "Presbyterian High", Image: "ws", attack: 100.0, defence: 100.0, replySpeed: 0.0, types: [.normal, .grass, .fire])]
    
    
    var body: some View {
        NavigationView {
            List(0..<friends.count) { index in
                NavigationLink(destination: VictimDetailView(friend: $friends[index])) {
                    Image(systemName: friends[index].icon)
                    VStack(alignment: .leading) {
                        Text(friends[index].name)
                            .font(.headline)
                        Text(friends[index].school)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        //vstack
                    }
                    
                }
            }
        }
        //title >:D
        .navigationTitle("Innocent Victims >:D")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
