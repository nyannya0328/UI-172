//
//  PallaraxView.swift
//  UI-172
//
//  Created by にゃんにゃん丸 on 2021/05/02.
//

import SwiftUI

struct PallaraxView: View {
    @State var selectedTab : Int = 1
//    init() {
//        UIScrollView.appearance().bounces = false
//    }
   
    var body: some View {
        ScrollView(.init()){
            TabView(selection:$selectedTab){
                
                
                ForEach(1...7,id:\.self){index in
                    
                    GeometryReader{reader in
                        
                        Image("p\(index)")
                            .resizable()
                            .offset(x: -reader.frame(in: .global).minX)
                            .frame(width: getRect().width, height: getRect().height)
                           
                           
                            
                        
                        
                        
                    }
                    .frame(width:getRect().width,height: getRect().height)
                    .cornerRadius(15)
                     .padding(10)
                    .background(Color.primary.opacity(0.3))
                    
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
                    .shadow(color: .black.opacity(0.2), radius: 5, x: -5, y: -5)
                    .cornerRadius(15)
                    .padding(.horizontal,25)
                    .overlay(
                    
                    
                    Image("p\(selectedTab)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .shadow(color: .black, radius: 5, x: 5, y: 5)
                        .padding(5)
                        .background(Color.white)
                        .clipShape(Circle())
                        .offset(x: -50, y: -25)
                
                        
                        ,alignment: .bottomTrailing
                    )
                    
                    
                    
                    
                }
               
                
                
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea()
        
       
    
    }
}

struct PallaraxView_Previews: PreviewProvider {
    static var previews: some View {
        PallaraxView()
    }
}
