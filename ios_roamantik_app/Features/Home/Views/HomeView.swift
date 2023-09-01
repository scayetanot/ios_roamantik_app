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
                    TabItem(image: image, currentTab: $currentTab)
                    
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 15)
        }
        .background(.ultraThinMaterial, in : RoundedRectangle(cornerRadius: 45.0))
        .ignoresSafeArea()

    }
}

struct TabItem: View {
    var image: String
    @Binding var currentTab: String
    
    var body: some View {
        Button{
            withAnimation{currentTab = image}
        } label: {
            ZStack {
                Image(systemName: image)
                    .font(.system(size: 25, weight: .none))
            }
            .foregroundColor(currentTab == image ? RoamantikColors.cDeepBlue : .gray)
            .frame(maxWidth: .infinity)
            .padding(10)
            
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
