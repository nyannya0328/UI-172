//
//  MainView.swift
//  UI-172
//
//  Created by にゃんにゃん丸 on 2021/05/01.
//

import SwiftUI


struct MainView: View {
    
    
    @State var selected = "house.fill"
    
    @State var shoMenu = false
    var body: some View {
        ZStack{
            
            Color.blue.opacity(0.5)
                .ignoresSafeArea()
            
            ScrollView(getRect().height < 750 ? .vertical : .init(), showsIndicators: false, content: {
                SlideTabButton(selected: $selected)
            })
            
            ZStack{
                
                
                
                
                Color.white.opacity(0.7)
                    .cornerRadius(shoMenu ? 15 : 0)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: 5)
                    .offset(x: shoMenu ? -25 : 0)
                    .padding(.vertical,30)
                
                Color.white.opacity(0.7)
                    .cornerRadius(shoMenu ? 15 : 0)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: 5)
                    .offset(x: shoMenu ? -50 : 0)
                    .padding(.vertical,60)
                
                Color.white.opacity(0.7)
                    .cornerRadius(shoMenu ? 15 : 0)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: 5)
                    .offset(x: shoMenu ? -75 : 0)
                    .padding(.vertical,90)
                
                Color.white.opacity(0.7)
                    .cornerRadius(shoMenu ? 15 : 0)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: 5)
                    .offset(x: shoMenu ? -100 : 0)
                    .padding(.vertical,120)
                
                
                Home(selected: $selected)
                    .cornerRadius(shoMenu ? 5 : 0)
                
                    
            }
            .scaleEffect(shoMenu ? 0.8 : 1)
            .offset(x: shoMenu ? getRect().width - 120 : 0)
            .ignoresSafeArea()
            .overlay(
                Button(action: {
                    
                    withAnimation(.spring()){
                        
                        shoMenu.toggle()
                    }
                     
                }, label: {
                    VStack(spacing:5){
                        
                        Capsule()
                            .fill(shoMenu ? Color.white : Color.primary)
                            .frame(width: 30, height: 3)
                            .rotationEffect(.init(degrees: shoMenu ? -50 : 0))
                            .offset(x: shoMenu ? 2 : 0, y: shoMenu ? 9 : 0)
                        
                        
                        VStack(spacing:5){
                            
                            Capsule()
                                .fill(shoMenu ? Color.white : Color.primary)
                                .frame(width: 30, height: 3)
                                
                            
                            Capsule()
                                .fill(shoMenu ? Color.white : Color.primary)
                                .frame(width: 30, height: 3)
                                .offset(y: shoMenu ? -8 : 0)
                            
                            
                            
                        }
                        .rotationEffect(.init(degrees: shoMenu ? 50 : 0))
                        
                    }
                    .padding()
                })
                
                ,alignment: .topLeading
            
            )
            
          
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
