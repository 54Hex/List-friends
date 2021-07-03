//
//  victim.swift
//  List
//
//  Created by Conqueriings on 26/6/21.
//

import Foundation


//list
struct friend: Identifiable {
    // Identifier. Something like IC liddat
    var id = UUID()
    
    var name: String
    //profile picture
    var icon: String
    var school: String
    //banner image
    var Image: String
    
    // special skills 😎
    var attack: Double = Double.random(in: 0...100)
    var defence: Double = Double.random(in: 0...100)
    var replySpeed: Double = Double.random(in: 0...100)
}
