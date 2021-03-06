//
//  VictimDetailView.swift
//  List
//
//  Created by Conqueriings on 26/6/21.
//

import SwiftUI

struct VictimDetailView: View {
    
    @Binding var friend: Friend
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Image(friend.Image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .scaledToFill()
                
                
                Image(friend.name)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    
                    .mask(Circle())
                    
                    
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 5)
                            .foregroundColor(.white)
                    )
                    .offset(x: 0, y: -250 / 2)
                    .shadow(radius: 6)
                    .padding(.bottom, -250 / 2)
                    .offset(x: 0, y: -00)
                
                HStack {
                    ForEach(friend.types, id: \.rawValue) { type in
                        Label(type.rawValue, systemImage: type.getSymbolName())
                            .padding(10)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                }
                .padding()
                
                Text("\(Image(systemName: friend.icon)) \(friend.school)")
                    .font(.system(size: 24))
                    .offset(x: 0, y: 10)
                    .padding()
                
                VStack {
                    Text("Attack")
                    Slider(value: $friend.attack, in: 0...100, step: 1)
                    
                    Text("Defence")
                    Slider(value: $friend.defence, in: 0...100, step: 1)
                    
                    Text("Reply speed")
                    Slider(value: $friend.replySpeed, in: 0...100, step: 1)
                }
                .padding()
                Spacer()
                
            }
        }
        .navigationTitle(friend.name)
        
    }
    
}

struct VictimDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VictimDetailView(friend: .constant(Friend(name: "Wei Xuan", icon: "bolt.horizontal", school: "Presbyterian High", Image: "ws", attack: 100.0, defence: 100.0, replySpeed: 100.0, types: [.normal, .ice, .water])))
    }
}
