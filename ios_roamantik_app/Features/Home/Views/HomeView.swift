//
//  HomeView.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    @State private var currentTab: String = "list.bullet"
    @Namespace private var animation
    
    init() {
        UITabBar.appearance().isHidden = true
    }
        
    var body: some View {
        VStack() {
            TabView(selection: $currentTab) {
                FeedView()
                    .tag("list.bullet")

                MapView()
                    .tag("map")

                Text("Messaged Tab")
                    .tag("message")

                Text("Account Tab")
                    .tag("person")

            }
            HStack(spacing: 0) {
                ForEach(["list.bullet", "map", "message", "person"], id: \.self){ image in
                    TabItem(image: image, isSystemImage: (image == "plus.app") ? false : true, currentTab: $currentTab)
                    
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 15)
        }
        .background(.black)

    }
}

struct TabItem: View {
    var image: String
    var isSystemImage: Bool
    @Binding var currentTab: String
    
    var body: some View {
        Button{
            withAnimation{currentTab = image}
        } label: {
            ZStack {
                if isSystemImage {
                    Image(systemName: image)
                        .font(.system(size: 30, weight: .none))
                } else {
                    Image(systemName: image)
                        .font(.system(size: 30, weight: .bold))
                }
            }
            .foregroundColor(currentTab == image ? RoamantikColors.cVividBlue : .gray)
            .frame(maxWidth: .infinity)
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .environmentObject(SessionServiceImpl())
        }
    }
}
