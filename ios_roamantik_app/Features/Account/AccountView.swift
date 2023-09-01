//
//  AccountView.swift
//  ios_roamantik_app
//
//  Created by Sebastien Cayetanot on 8/22/23.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack(){
            VStack() {
                Spacer().frame(maxHeight: 80)
                HStack(spacing: 20){
                    Spacer()
                    Image(systemName: "gear")
                        .font(.system(size: 35, weight: .heavy))

                    Image(systemName: "arrow.right.to.line.circle")
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(RoamantikColors.cDeepBlue)
                        .padding(.trailing)

                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
