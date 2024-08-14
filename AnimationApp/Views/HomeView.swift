//
//  HomeView.swift
//  AnimationApp
//
//  Created by A'zamjon Abdumuxtorov on 13/08/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea()
            ScrollView(showsIndicators:false) {
                content
            }
        }
    }
}

#Preview {
    HomeView()
}

extension HomeView{
    
    private var content: some View{
        VStack(spacing:0){
            Text("Courses")
                .customFont(.largeTitle)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal,20)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:20) {
                    ForEach(courses) { course in
                        VCard(course: course)
                    }
                }.padding(20)
                    .padding(.bottom,10)
            }
            
            Text("Recent")
                .customFont(.title3)
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal,20)
            
            VStack(spacing:20) {
                ForEach(courseSections) { item in
                    HCard(section: item)
                }
            }.padding(20)
        }
    }
}
