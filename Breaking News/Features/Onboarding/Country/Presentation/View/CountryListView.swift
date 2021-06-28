//
//  CountryListView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import SwiftUI

struct CountryListView: View {
    var language: Language
    @ObservedObject var viewModel = CountryListViewModel()
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 80){
                roundedCurveEdge(image: UIImage(named: "country")
                                    ?? UIImage(), curvedPercent: 0.3)
                    .frame(width: geo.size.width, height: geo.size.height * 0.4)
                
                
                VStack{
                    Text("Select Your Country")
                        .font(.system(size: 30))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                        .frame(width: geo.size.width)
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.countries, id: \.id) { country in
                                NavigationLink(
                                    destination: LoginView()){
                                    CountryRowView(country: country)
                                    
                                }
                                .simultaneousGesture(TapGesture().onEnded{
                                    viewModel.langueUserSettings.country = country.id
                                })
                                
                            }
                            
                        }.onAppear{
                            viewModel.fetch(id: language.id)
                        }
                        
                    }
                }
                .frame(height: geo.size.height * 0.5)
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

//struct CountryListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryListView()
//    }
//}
