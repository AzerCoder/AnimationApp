//
//  ContentView.swift
//  AnimationApp
//
//  Created by A'zamjon Abdumuxtorov on 12/08/24.
//

import SwiftUI
import RiveRuntime

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab:Tab = .chat
    @State var isOpen = false
    @State var show = false
    let button = RiveViewModel(fileName: "menu_button",animationName: "open", autoPlay:false)
    var body: some View {
        ZStack {
            Color.background2.ignoresSafeArea()
            
            SideMenu()
                .opacity(isOpen ? 1:0)
                .offset(x: isOpen ? 0:-300)
                .rotation3DEffect(
                    .degrees(isOpen ? 0:30),
                    axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            
            Group{
                switch selectedTab {
                case .chat:
                    HomeView()
                case .search:
                    Text("Search")
                case .timer:
                    Text("Timer")
                case .bell:
                    Text("Bell")
                case .user:
                    Text("User")
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 80)
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 124)
            }
            .mask(RoundedRectangle(cornerRadius: 30))
            .rotation3DEffect(
                .degrees(isOpen ? 30:0),
                axis: (x: 0.0, y: -1.0, z: 0.0)
            )
            .offset(x:isOpen ? 265:0)
            .scaleEffect(isOpen ? 0.9: 1 )
            .scaleEffect(show ? 0.92: 1 )
            .ignoresSafeArea()
            
            Image(systemName: "person")
                .frame(width: 36,height: 36)
                .background(.white)
                .mask(Circle())
                .shadow(color: .shadow, radius: 5, x: 0, y: 5)
                .onTapGesture {
                    withAnimation {
                        show = true
                    }
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                .padding()
                .offset(y:4)
                .offset(x:isOpen ? 100:0)
            
            button.view()
                .frame(width: 44,height: 44)
                .mask(Circle())
                .shadow(color: .shadow, radius: 5, x: 0, y: 5)
                .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
                .padding()
                .offset(x:isOpen ? 216:0)
                .onTapGesture {
                    button.setInput("isOpen", value: isOpen)
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        isOpen.toggle()
                    }
                }
            
            TabBar()
                .offset(y:isOpen ? 300:0)
                .offset(y:show ? 200:0)
                .offset(y:-24)
                .background(
                    LinearGradient(colors: [Color.background.opacity(0),Color.background], startPoint: .top, endPoint: .bottom)
                        .frame(height: 150)
                        .frame(maxHeight: .infinity,alignment: .bottom)
                )
                .ignoresSafeArea()
            
            if show{
                OnboardingView(show: $show)
                    .background(.white)
                    .mask(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: .black.opacity(0.5), radius: 40, x: 0.0, y: 40)
                    .ignoresSafeArea(.all,edges: .top)
                    .transition(.move(edge: .top))
                    .offset(y:show ? -10:0)
                    .zIndex(1)
            }
            
          
        }
        
    }
}

#Preview {
    ContentView()
}
