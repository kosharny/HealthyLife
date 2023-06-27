//
//  PostInfo.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 05.06.2023.
//

import FirebaseFirestoreSwift
import Firebase

struct PostInfo: Identifiable, Decodable, Hashable {
   
    @DocumentID var id: String?
    var imageName: String
    var textLabel: String?
    var titleName: String
    var category: String?
    var date: Timestamp?
    
    
    var isSave: Bool? = false
}
