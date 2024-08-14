//
//  OnboardingView.swift
//  AnimationApp
//
//  Created by A'zamjon Abdumuxtorov on 12/08/24.
//

import SwiftUI
import RiveRuntime

struct OnboardingView: View {
    let button = RiveViewModel(fileName: "button")
    @State var showModal = false
    var body: some View {
        ZStack {
            background
            
            content
                .offset(y:showModal ? -50:0)
            
            Color.shadow
                .opacity(showModal ? 0.4:0)
                .ignoresSafeArea()
            
            if showModal{
                SignInView(showModal: $showModal)
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .overlay(
                        Button(action: {
                                withAnimation(.spring){
                                    showModal = false
                                }
                        }, label: {
                            Image(systemName: "xmark")
                                .frame(width: 36,height: 36)
                                .foregroundColor(.black)
                                .background(.white)
                                .mask(Circle())
                                .shadow(color:.shadow.opacity(0.3),radius: 5,x: 0,y: 3)
                        })
                        .frame(maxHeight: .infinity,alignment: .bottom)
                    )
                    .zIndex(1)
            }
            
        }
    }
}

#Preview {
    OnboardingView()
}

extension OnboardingView{
    
    private var background:some View{
        RiveViewModel(fileName: "shapes").view()
            .ignoresSafeArea()
            .blur(radius: 30)
            .background(
                Image("Spline")
                    .blur(radius: 50)
                    .offset(x:200,y:100)
            )
    }
    
    private var content:some View{
        VStack(alignment:.leading,spacing: 16) {
            Text("Learn design & code")
                .font(.custom("Poppins-Bold", size: 60,relativeTo: .largeTitle))
                .frame(width: 260,alignment: .leading)
            
            Text("Don't skip design. Learn design and code, by building real apps with React and Swift. Complate courses about the best tools.")
                .customFont(.body)
                .opacity(0.7)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            Spacer()
            button.view()
                .frame(width: 236,height: 64)
                .overlay {
                    Label("Start the course",systemImage: "arrow.forward")
                        .offset(x:4,y:4)
                        .font(.headline)
                }
                .background(
                    Color.black
                        .cornerRadius(30)
                        .blur(radius: 10)
                        .opacity(0.3)
                        .offset(y:10)
                )
                .onTapGesture {
                    button.play(animationName: "active")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
                        withAnimation(.spring){
                            showModal = true
                        }
                    }
            }
            
            Text("Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates")
                .customFont(.footnote)
                .opacity(0.7)
        }.padding(40)
            .padding(.top,40)
    }
}
