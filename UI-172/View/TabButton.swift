//
//  TabButton.swift
//  UI-172
//
//  Created by にゃんにゃん丸 on 2021/05/01.
//

import SwiftUI

struct TabButton: View {
    var image : String
    var title : String
    @Binding var selected : String
    var animation : Namespace.ID
    var body: some View {
        Button(action: {
            withAnimation(.spring()){
                
                selected = title
            }
            
            
        }, label: {
            HStack(spacing:15){
                
                
                Image(systemName: image)
                    .font(.title2)
                    .frame(width: 30)
                
                Text(title)
                   
                    .fontWeight(.bold)
                    
            }
                    
                    .foregroundColor(selected == title ? .blue : .white)
                
                    .padding(.vertical,10)
                    .padding(.horizontal,10)
                   // .frame(width: getRect().width, alignment: .leading)
                
                    .background(
                    
                        ZStack{
                            
                            if selected == title{
                                
                               
                                Color.white
                                    .opacity(selected == title ? 1 : 0)
                                
                                    .clipShape(CustomShape(radi: 12, corener: [.topLeft,.bottomRight]))
                                    .matchedGeometryEffect(id: "TAB", in: animation)
                            }
                        }
                    
                    )
                
                
            
            
        })
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
}

struct CustomShape : Shape {
    let radi : CGFloat
    var corener : UIRectCorner
    func path(in rect: CGRect) -> Path {
        
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corener, cornerRadii: CGSize(width: radi, height: radi))
        
        return Path(path.cgPath)
    }
}
