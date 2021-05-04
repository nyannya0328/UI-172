//
//  ShoeViewModel.swift
//  UI-172
//
//  Created by にゃんにゃん丸 on 2021/05/04.
//

import SwiftUI

class ShoeViewModel: ObservableObject {
   
    
    @Published var showcart = false
    @Published var selectsize = ""
    
    @Published var startAnimation = false
    @Published var shoeAnimaition = false
    @Published var endAnimation = false
    
    @Published var shobag = false
    
    @Published var additemtoCart = false
    @Published var saveCart = false
    
    @Published var cartItems = 0
    
    
    func resetALL(){
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {[self] in
            
            withAnimation{
                
                
                showcart.toggle()
                
            }
            startAnimation = false
            endAnimation = false
            selectsize = ""
            shoeAnimaition = false
            saveCart = false
            cartItems += 1
          additemtoCart = false
            shobag = false
        }
        
    }
    
    func peformAnimaiton(){
        
        
        withAnimation(.easeOut(duration: 0.8)){
            
            shoeAnimaition.toggle()
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35){[self] in
            
            
            
            shobag.toggle()
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75){[self] in
            
            
            
            withAnimation(.easeInOut(duration: 0.5)){
                saveCart.toggle()
            }
            
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1){[self] in
            
            
            
            withAnimation(.easeInOut(duration: 0.5)){
                additemtoCart.toggle()
            }
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.25){[self] in
            
            
            
            withAnimation(.easeInOut(duration: 0.5)){
                endAnimation.toggle()
            }
            
        }
        
        
        
    }
}

