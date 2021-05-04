//
//  SlideTabButton.swift
//  UI-172
//
//  Created by にゃんにゃん丸 on 2021/05/02.
//

import SwiftUI

struct SlideTabButton: View {
    @Namespace var animation
    @Binding var selected : String
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Image("pro")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70)
                .cornerRadius(10)
                .padding(.top,55)
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text("My name is King")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("View Profile")
                        .font(.callout)
                        .foregroundColor(.white)
                        .opacity(0.7)
                })
               
                    
                    
                    VStack(alignment:.leading){
                        
                        TabButton(image: "house.fill", title: "Home", selected: $selected, animation: animation)
                        
                        
                        TabButton(image: "gear", title: "Setting", selected: $selected, animation: animation)
                        
                        
                        
                        TabButton(image: "magnifyingglass", title: "Search", selected: $selected, animation: animation)
                        
                        
                        
                        TabButton(image: "pencil", title: "Write", selected: $selected, animation: animation)
                        
                        
                        
                        
                    }
                   
                    .padding(.top,15)
                    .padding(.leading,-15)
                    
                    
                    Spacer()
                    
                   
                    
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    
                    TabButton(image: "rectangle.righthalf.inset.fill.arrow.right", title: "Log OUT", selected: .constant(""), animation: animation)
                        .padding(.leading,-15)
                    
                     Text("App Version 1.2.3")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    
                    
                    
                    
                })
               
            
                    
                    
                  
                    
               
                    
            })
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct SlideTabButton_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
