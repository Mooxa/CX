//
//  FaceBookLoginView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 16/06/2021.
//

import SwiftUI
import FBSDKLoginKit
import Firebase

struct FaceBookLoginView: UIViewRepresentable {
    
    var onCompletion: ((_ success: Bool) -> Void)
    
    func makeCoordinator() -> FaceBookLoginView.Coordinator {
        return FaceBookLoginView.Coordinator(self)
    }
    
    class Coordinator: NSObject, LoginButtonDelegate {
        
        var control:FaceBookLoginView
        
        init(_ control:FaceBookLoginView) {
            self.control = control
            
        }
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if error != nil {
                print("Error in line up")
                control.onCompletion(false)
                return
            }
            if let current = AccessToken.current?.tokenString {

                let credential = FacebookAuthProvider.credential(withAccessToken: current)
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error {
                        print("Facebook Sign failed")
                        print(error.localizedDescription)
                        return
                    }
                    print("Facebook Sign In")
                    self.control.onCompletion(true)
                }
                
            }

        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            try! Auth.auth().signOut()
        }
    }
    
    func makeUIView(context: UIViewRepresentableContext<FaceBookLoginView>) -> FBLoginButton {
        let view = FBLoginButton()
        view.permissions = ["public_profile", "email"]
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: FBLoginButton, context: UIViewRepresentableContext<FaceBookLoginView>) { }
}
