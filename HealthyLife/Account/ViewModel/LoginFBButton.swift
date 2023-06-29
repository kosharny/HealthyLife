//
//  LoginFBButton.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 27.06.2023.
//

import SwiftUI
import FBSDKLoginKit
import Firebase

struct login: UIViewRepresentable {
    
    
    func makeCoordinator() -> login.Coordinator {
        return login.Coordinator()
    }
    
    func makeUIView(context: UIViewRepresentableContext<login>) -> FBLoginButton {
        let button = FBLoginButton()
        button.permissions = ["email"]
        button.delegate = context.coordinator
        return button
    }
    
    func updateUIView(_ uiView: FBLoginButton, context: UIViewRepresentableContext<login>) {
        
    }
    
    class Coordinator: NSObject, LoginButtonDelegate {
        
        
        
        func loginButton(_ loginButton: FBSDKLoginKit.FBLoginButton, didCompleteWith result: FBSDKLoginKit.LoginManagerLoginResult?, error: Error?) {
            
            
            if error != nil {
                print((error?.localizedDescription)!)
                return
            }
            
            if AccessToken.current != nil {
                
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                
                Auth.auth().signIn(with: credential) { result, error in
                    if let error = error {
                        print("DEBUG: Failed to register with error \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else { return }
//                    self.tempUserSession = user
                    let name = String(result!.user.email?.dropLast(10) ?? "")
                    let data = ["email": result!.user.email,
                                "name": name,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
//                        self.didAuthUser = true
                    }
//                    self.userSession = user
                    print("DEBUG: sucess")
                }
            }
        }
        
        func loginButtonDidLogOut(_ loginButton: FBSDKLoginKit.FBLoginButton) {
            try! Auth.auth().signOut()
        }
        
        
    }
}
