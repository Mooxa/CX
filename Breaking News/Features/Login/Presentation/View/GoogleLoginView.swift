//
//  GoogleLoginView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 16/06/2021.
//

import Foundation
import SwiftUI
import GoogleSignIn
import Firebase

struct GoogleLoginView: UIViewRepresentable {
    

    var onCompletion: ((_ success: Bool) -> Void)
     
     // Here I am using FirebaseAuth for Authetication mechanism, feel free you use your own & just replace type.
    init( onCompletion: @escaping (_ success: Bool) -> Void) {
        self.onCompletion = onCompletion
     }
    
    func makeCoordinator() -> GoogleLoginView.Coordinator {
        return GoogleLoginView.Coordinator(self)
    }
    
    class Coordinator: NSObject, GIDSignInDelegate {
        var control:GoogleLoginView

            init(_ control:GoogleLoginView) {
                self.control = control
            }
        
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
            if error != nil {
            control.onCompletion(false)
            return
          }

          guard let authentication = user.authentication else { return }
          let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                            accessToken: authentication.accessToken)
          Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
              print(error.localizedDescription)
              return
            }
            print("signIn result: " + authResult!.user.email!)
            self.control.onCompletion(true)
          }
            
        }
    }
    
    func makeUIView(context: UIViewRepresentableContext<GoogleLoginView>) -> GIDSignInButton {
        let view = GIDSignInButton()
         

        
           // Set style as wide, you are free here to use your choice
        view.style = .wide
        
        view.tintColor = .red
        view.layer.cornerRadius = 10
        
        view.layer.backgroundColor  = UIColor.red.cgColor
        GIDSignIn.sharedInstance().delegate = context.coordinator
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.last?.rootViewController
        return view
    }
    
    func updateUIView(_ uiView: GIDSignInButton, context: UIViewRepresentableContext<GoogleLoginView>) { }
}
