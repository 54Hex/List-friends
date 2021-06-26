//
//  VictimDetailView.swift
//  List
//
//  Created by Conqueriings on 26/6/21.
//

import SwiftUI

struct VictimDetailView: View {
    
    var friend: friend
    
    var body: some View {
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
        }
        .navigationTitle(friend.name)
    }
}

struct VictimDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VictimDetailView(friend: friend(name: "1", icon: "lock.open.fill", school: "School", Image: "sloth1"))
    }
}
