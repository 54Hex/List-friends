//
//  FriendsData.swift
//  List
//
//  Created by Conqueriings on 10/7/21.
//

import Foundation
import SwiftUI

class FriendsData: ObservableObject {
    @Published var friends: [Friend] = []
    
    
    let sampleFriends = [Friend(name: "Wei Xuan", icon: "bolt.horizontal", school: "Presbyterian High", Image: "ws", attack: 90.0, defence: 100.0, replySpeed: 80.0, types: [.normal, .water, .ice]),
        Friend(name: "TraceTogether", icon: "shield.lefthalf.fill", school: "GovTech", Image: "RickQR", attack: 100.0, defence: 100.0, replySpeed: 100.0, types: [.command]),
        Friend(name: "🦁", icon: "person.fill", school: "School", Image: "ws", attack: 0.0, defence: 0.0, replySpeed: 0.0, types: [.normal])]
    
    
    func getArchiveURL() -> URL {
        let plistName = "friends.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName)
    }
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedFriends = try? propertyListEncoder.encode(friends)
        try? encodedFriends?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalFriends: [Friend]!
        
        if let retrievedFriendsData = try? Data(contentsOf: archiveURL),
           let decodedFriends = try? propertyListDecoder.decode(Array<Friend>.self, from: retrievedFriendsData) {
            finalFriends = decodedFriends
        } else {
            finalFriends = sampleFriends
        }
        friends = finalFriends
    }
}
