//
//  OnboardingView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import SwiftUI

struct OnboardingView: View {
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView{
            GeometryReader { geo in
                VStack{
                    roundedCurveEdge(image: UIImage(named: "gdbrpic") ?? UIImage(), curvedPercent: 0.2)
                        .frame(width: geo.size.width, height: geo.size.height * 0.50 )
                    
                    NavigationLink(destination: LanguageView(), tag: 2, selection: $selection) {
                        EmptyView()
                    }
                    .frame(width: 0).opacity(0.0)
                    .navigationBarBackButtonHidden(true)
                    
                    VStack(alignment: .center)  {
                        Text("Breaking News")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .padding()
                        Text("The New Social Network")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        Text("By using the app you agree our TOS and our Privacy Policy. Click her for more information.")
                        Spacer()
                        VStack {
                            Text("I ACCEPT")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                                .background(
                                    Capsule()
                                        .fill(Color.red)
                                        .frame(height: 50)
                                )
                                .padding()
                        }
                        .onTapGesture {
                            self.selection = 2
                        }
                        HStack{
                            Text("Are you news/media organization?")
                                .font(.subheadline)
                                .padding(2)
                            Link("click here", destination: URL(string: "https://emma.sh")!)
                        }
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.40)
                }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
