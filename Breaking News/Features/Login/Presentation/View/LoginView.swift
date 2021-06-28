//
//  LoginView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 10/06/2021.
//

import SwiftUI
import GoogleSignIn
import FBSDKLoginKit

struct LoginView: View {
    @State var selection: Int? = nil
    @ObservedObject var viewModel =  LoginViewModel()
    @State var showLoading: Bool = false
    
    var body: some View {
        VStack(alignment: .center){
            LoadingView(isShowing: $showLoading) {
                NavigationLink(destination: HomeView().navigationBarHidden(true), tag: 1, selection: $selection) {
                    EmptyView()
                }
                .frame(width: 0, alignment: .center).opacity(0.0)
                
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            VStack{
                Image("iconx")
                    .resizable()
                    .background(Color.red)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                Text("Create an Account to have full Access")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(12.0)
            }
            
            .frame(maxHeight: .infinity,
                   alignment: .bottom
            )
            
            ZStack(alignment: .bottom) {
                
                VStack {
                    
                    
                    //                    FaceBookLoginView{ result in
                    //                        print(result)
                    //                        
                    //                    }
                    //                    .frame(width: 295, height: 55)
                    //                    .background(Color.blue)
                    //                    .cornerRadius(50.0)
                    //                    .foregroundColor(Color.white)
                    
                    
                    GoogleLoginView{ result in
                        self.showLoading = true
                        viewModel.createAccount{ result in
                            self.showLoading = false
                            self.selection = 1
                        }
                        
                        
                    }
                    .frame(width: 295, height: 55)
                    
                    
                    
                    
                    Divider()
                    Button(action: {
                        self.selection = 1
                    }) {
                        Text("Skip for Now")
                            .padding()
                            .frame(width: 295, height: 55)
                            .background(Color.clear)
                            .foregroundColor(Color.black)
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(lineWidth: 2.0)
                                    .foregroundColor(Color.black)
                                
                            )
                    }
                }
            }
            .frame(maxHeight: .infinity,
                   alignment: .bottom
            )
        }
        
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity
        )
        
    }
    
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
