//
//  ContentView.swift
//  List
//
//  Created by Conqueriings on 26/6/21.
//

import SwiftUI

struct ContentView: View {
    // array 
    var friends = [
        friend(name: "1", icon: "lock.open.fill", school: "PHS", Image: "sloth1"),
        friend(name: "2", icon: "lock.open.fill", school: "School 1", Image: "sloth2"),
        friend(name: "3", icon: "lock.open.fill", school: "School 2", Image: "sloth3")]
    
    
    var body: some View {
        NavigationView {
            List(friends) { friend in
                NavigationLink(destination: VictimDetailView(friend: friend)) {
                    Image(systemName: friend.icon)
                    
                    //vstack
                    VStack(alignment: .leading) {
                        Text(friend.name)
                            .bold()
                        Text(friend.school)
                            .frame(height: 30)
                    }
                    
                }
            }
            //title >:D
            .navigationTitle("Innocent Victims >:D")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
