//
//  NewFriendType.swift
//  List
//
//  Created by Conqueriings on 10/7/21.
//

import SwiftUI

struct NewFriendType: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var friends: [Friend]
    
    @State var friend = Friend(name: "",
                               icon: "triangle",
                               school: "",
                               Image: "",
                               attack: 0,
                               defence: 0,
                               types: [.normal])
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Information")) {
                    TextField("Name", text: $friend.name)
                    TextField("School", text: $friend.school)
                    
                    HStack {
                        Image(systemName: friend.icon)
                        TextField("Icon", text: $friend.icon)
                            .autocapitalization(.none)
                    }
                    
                    TextField("Sloth Image", text: $friend.Image)
                        .autocapitalization(.none)
                }
                
                Section(header: Text("Attributes")) {
                    Picker("Type", selection: $friend.types[0]) {
                        Text("normal")
                            .tag(FriendType.normal)
                        Text("fire")
                            .tag(FriendType.fire)
                        Text("water")
                            .tag(FriendType.water)
                        Text("grass")
                            .tag(FriendType.grass)
                        Text("electric")
                            .tag(FriendType.electric)
                        Text("ice")
                            .tag(FriendType.ice)
                    }
                    
                    HStack {
                        Text("Attack")
                            .frame(width: 100, alignment: .leading)
                        
                        Slider(value: $friend.attack,
                               in: 0...15,
                               step: 1)
                    }
                    
                    HStack {
                        Text("Defence")
                            .frame(width: 100, alignment: .leading)
                        
                        Slider(value: $friend.defence,
                               in: 0...15,
                               step: 1)
                    }
                }
                
                Section {
                    Button("Save") {
                        friends.append(friend)
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    Button("Discard Friend") {
                        presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("New Victims")
        }
    }
}




struct NewFriendType_Previews: PreviewProvider {
    static var previews: some View {
        NewFriendType(friends: .constant([]))
    }
}
