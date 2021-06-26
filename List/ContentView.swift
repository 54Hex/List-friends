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
        friend(name: "Human", icon: "lock.open.fill", school: "School", Image: "cloud"),
        friend(name: "Human1", icon: "lock.open.fill", school: "School 1", Image: "cloud"),
        friend(name: "Human2", icon: "lock.open.fill", school: "School 2", Image: "cloud"),
        friend(name: "Human3", icon: "lock.open.fill", school: "School 3", Image: "cloud")]
    
    
    var body: some View {
        NavigationView {
            List(friends) { friend in
                Image(systemName: friend.icon)
                    .frame(width: 50)
                VStack(alignment: .leading) {
                    Text(friend.name)
                        .bold()
                    Text(friend.school)
                        .font(.subheadline)
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
