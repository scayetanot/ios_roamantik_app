//
//  FeedView.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    
    @State var index = 0
    @State var top = 0
   
    
    let filters = [
        Filter(name: "All"),
        Filter(name: "Favorites"),
        Filter(name: "Running"),
        Filter(name: "Skateboard"),
        Filter(name: "Surf"),
        Filter(name: "Workout"),
        Filter(name: "Football"),
        Filter(name: "Soccer"),
        Filter(name: "..."),
    ]
    
    @State private var selectedFilter: String
    
    @State private var showOptions: Bool = false
    
    init() {
        selectedFilter = filters[0].name
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack() {
                    HStack(spacing: 0) {
                        Picker("", selection: $selectedFilter) {
                            ForEach(filters) { filter in
                                Text(filter.name)
                                    .foregroundColor(.red)
                            }
                        }
                        .foregroundColor(.black)
                        .pickerStyle(.menu)
                        .background(.ultraThinMaterial, in : RoundedRectangle(cornerRadius: 45.0))
                        
                        Spacer()
                        Spacer()
                        
                        HStack {
                            NavigationLink(destination: AddView()) {
                                Image(systemName: "plus.circle")
                                    .padding(10)
                                    .font(.system(size: 25, weight: .none))
                                    .background(.ultraThinMaterial, in : RoundedRectangle(cornerRadius: 45.0))
                            }
                            .foregroundColor(.black)
                            
                            NavigationLink(destination: SearchView()) {
                                Image(systemName: "magnifyingglass")
                                    .padding(10)
                                    .font(.system(size: 25, weight: .none))
                                    .background(.ultraThinMaterial, in : RoundedRectangle(cornerRadius: 45.0))
                            }
                            .foregroundColor(.black)
                            
                            NavigationLink(destination: NotificationsView()) {
                                Image(systemName: "bell")
                                    .padding(10)
                                    .font(.system(size: 25, weight: .none))
                                    .background(.ultraThinMaterial, in : RoundedRectangle(cornerRadius: 45.0))
                            }
                            .foregroundColor(.black)

                        }
                    }
                    .padding(10)
                    .padding(.top, 50)
                    .frame(maxWidth: .infinity)
                    Spacer()
                }
                .zIndex(1)
                Text(selectedFilter)
                Image("test")
                    .resizable()
            }
            .ignoresSafeArea()
        }
        
    }
}

struct Filter: Identifiable {
    let name: String
    var id: String { name }
}

struct FeedItem: Identifiable {
    var id: Int
    let username: String
    let url: String
    let tag: String

}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}


