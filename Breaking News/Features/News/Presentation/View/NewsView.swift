//
//  NewsView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import SwiftUI

struct NewsView: View {
    
    @State private var selectedTab = 0
    @ObservedObject var viewModel = NewsViewModel()
    @State var selectedRow: Int?
    @Environment(\.colorScheme) var colorScheme
    
    let graphAnimation = Animation.easeInOut.speed(0.3).repeatForever(autoreverses: true)
    @State var scale: CGFloat = 1
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Image("iconx")
                        .resizable()
                        .background(Color.red)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                    Text("BREAKING NEWS")
                        .font(.title)
                        .fontWeight(.bold)
                    Button(action: {
                    }) {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.system(size: 36))
                            .foregroundColor(.secondary)
                    }
                    
                    Button(action: {
                    }) {
                            
                        if viewModel.langueUserSettings.userphoto != "" {
                            RemoteImage(url: viewModel.langueUserSettings.userphoto)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 36, height: 36)
                                .clipShape(Circle())
                        } else {
                            Image("profile-user")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 36, height: 36)
                                .clipShape(Circle())
                        }
                       
                    }
                }
                
                VStack(alignment: .center) {
                    TabsHorizontalView(tabs: .constant(["For You", "Trending", "video", "Local", "Breaking", "The Latest"]),
                                       selection: $viewModel.selectedTab,
                                       underlineColor: .red) { title, isSelected in
                        Text(title.uppercased())
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(isSelected ? (colorScheme == .dark ? Color.white : Color.black) : .gray)
                    }
                    .padding()
                    LoadingView(isShowing: .constant(viewModel.isShowing)) {
                        ScrollView{
                            EmptyListView(objects: $viewModel.news)
                        }
                    .padding(6)
                        
                    }
                    
                }
            }
            .onAppear {
                self.viewModel.onAppear()
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            
        }.navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
        
    }
}


struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .preferredColorScheme(.dark)
    }
}
