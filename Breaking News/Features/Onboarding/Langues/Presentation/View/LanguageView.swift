//
//  LanguesView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import SwiftUI

struct LanguageView: View {
    @ObservedObject var viewModel = LangueViewModel()

    var body: some View {
        GeometryReader { geo in
            VStack{
                roundedCurveEdge(image: UIImage(named: "langues")
                                    ?? UIImage(), curvedPercent: 0.3)
                    .frame(width: geo.size.width, height: geo.size.height * 0.3 )
                
                Spacer()
                
                Text("Select Your Language")
                    .font(.system(size: 30))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                    .frame(width: geo.size.width )
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.language, id: \.id) { language in
                            NavigationLink(destination: CountryListView(language: language)) {
                                LanguageRowView(language: language)
                            }
                            
                        }
                    }.onAppear{
                        viewModel.fetch()
                    }
                }
                .frame(height: geo.size.height * 0.5 )
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

struct LanguesView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView()
    }
}
