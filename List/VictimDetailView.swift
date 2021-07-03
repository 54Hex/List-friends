//
//  VictimDetailView.swift
//  List
//
//  Created by Conqueriings on 26/6/21.
//

import SwiftUI

struct VictimDetailView: View {
    
    @Binding var friend: friend
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Image(friend.Image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                Spacer()
                
                Image(friend.name)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 250)
                    .mask(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 8)
                            .foregroundColor(.white)
                    )
                    .offset(x: 0, y: -250 / 2)
                    .shadow(radius: 6)
                    .padding(.bottom, -250 / 2)
                    .offset(x: 0, y: -300)
                
                Text("\(Image(systemName: friend.icon)) \(friend.school)")
                    .font(.system(size: 24))
                    .offset(x: 0, y: -300)
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
        VictimDetailView(friend: .constant(friend(name: "1", icon: "lock.open.fill", school: "School", Image: "sloth1", attack: 100.0, defence: 100.0, replySpeed: 100.0)))
    }
}
