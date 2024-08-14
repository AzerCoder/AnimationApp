//
//  SideMenu.swift
//  AnimationApp
//
//  Created by A'zamjon Abdumuxtorov on 13/08/24.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    let icon = RiveViewModel(fileName: "icons",artboardName: "HOME")
    var body: some View {
        VStack {
            
            HStack {
                Image(systemName: "person")
                    .padding(22)
                    .background(.white.opacity(0.2))
                    .mask(Circle())
                VStack(alignment:.leading,spacing: 2) {
                    Text("A'zamjon A")
                        .customFont(.body)
                    Text("iOS Developer")
                        .customFont(.subheadline)
                        .opacity(0.7)
                }
                Spacer()
            }.padding()
            
            icon.view()
                .frame(width: 32,height: 32)
                .opacity(0.6)
            Spacer()
        }
        .padding(.top)
        .foregroundColor(.white)
        .frame(maxWidth: 288,maxHeight: .infinity)
        .background(Color(hex: "17203A"))
        .mask(RoundedRectangle(cornerRadius: 30))
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

#Preview {
    SideMenu()
}
