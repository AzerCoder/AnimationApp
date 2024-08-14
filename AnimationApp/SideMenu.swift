//
//  SideMenu.swift
//  AnimationApp
//
//  Created by A'zamjon Abdumuxtorov on 13/08/24.
//

import SwiftUI
import RiveRuntime

struct SideMenu: View {
    
    @State var selectedMenu:SelectedMenu = .home
    @State var isDarkMode = false
    
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
            
            Text("BROWSE")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal,24)
                .padding(.top,40)
                .opacity(0.7)
            VStack(alignment:.leading,spacing: 0) {
               
                ForEach(menuItems) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                   MenuRow(item: item, selectedMenu: $selectedMenu)
                }
            }
            .padding(8)
            
            Text("History")
                .customFont(.subheadline2)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal,24)
                .padding(.top,40)
                .opacity(0.7)
            VStack(alignment:.leading,spacing: 0) {
               
                ForEach(menuItems2) { item in
                    Rectangle()
                        .frame(height: 1)
                        .opacity(0.1)
                        .padding(.horizontal)
                   MenuRow(item: item, selectedMenu: $selectedMenu)
                }
            }
            .padding(8)
         
            Spacer()
            
            HStack(spacing:14) {
                menuItems3[0].icon.view()
                    .frame(width: 32,height: 32)
                    .opacity(0.6)
                    .onChange(of: isDarkMode) {newValue in
                            menuItems3[0].icon.setInput("active", value: true)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                menuItems3[0].icon.setInput("active", value: false)
                            }
                    }
                Text( menuItems3[0].text)
                    .customFont(.headline)
                Toggle("", isOn: $isDarkMode)
            }
            .padding(20)
        }
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

struct MenuItem:Identifiable{
    var id = UUID()
    var text:String
    var icon:RiveViewModel
    var menu:SelectedMenu
}

var menuItems = [
    MenuItem(text: "Home", icon: RiveViewModel(fileName: "icons",artboardName: "HOME"), menu: .home),
    MenuItem(text: "Search", icon: RiveViewModel(fileName: "icons",artboardName: "SEARCH"), menu: .search),
    MenuItem(text: "Favourites", icon: RiveViewModel(fileName: "icons",artboardName: "LIKE/STAR"), menu: .favourite),
    MenuItem(text: "Help", icon: RiveViewModel(fileName: "icons",artboardName: "CHAT"), menu: .help)
]

var menuItems2 = [
    MenuItem(text: "History", icon: RiveViewModel(fileName: "icons",artboardName: "TIMER"), menu: .history),
    MenuItem(text: "Notifocations", icon: RiveViewModel(fileName: "icons",artboardName: "BELL"), menu: .notifications),
]

var menuItems3 = [
    MenuItem(text: "Dark Mode", icon: RiveViewModel(fileName: "icons",artboardName: "SETTINGS"), menu: .darkmode),
]

enum SelectedMenu:String{
    case home
    case search
    case favourite
    case help
    case history
    case notifications
    case darkmode
}
