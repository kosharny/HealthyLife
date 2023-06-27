//
//  User.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 07.06.2023.
//
import SwiftUI
import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let name: String
    let email: String
    var calorie = 0
    var speedResult = 0
    var lightResult = 0
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id }
}
