//
//  ContentView.swift
//  UI-172
//
//  Created by にゃんにゃん丸 on 2021/05/01.
//

import SwiftUI

struct ContentView: View {
    @State var showMain = false
    var body: some View {
        
        ZStack{
            if showMain{

                MainView()


            }
            else{

                OnbordScreen()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: Notification.Name("NEXT")), perform: { _ in

            withAnimation{

                self.showMain = true
            }


        })
        
       
       
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OnbordScreen : View {
    var maxWidth = UIScreen.main.bounds.width - 100
    @State var offset : CGFloat = 0
    
    var body: some View{
        
        ZStack{
            
            
            Color.purple
                .ignoresSafeArea()
            
            VStack{
                
                
                Text("Smart Learn")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Text("がお〜")
                    .foregroundColor(.white)
                    .padding(6)
                
                
                Image("pro")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                
                
                Spacer()
                
                
                ZStack{
                    
                    Capsule()
                        .fill(Color.white.opacity(0.1))
                    
                    TextShimer(text: "Swip Right")
                    
                    
                    HStack{
                        
                        Capsule()
                            .fill(Color.red)
                            .frame(width: CuluculateWith() + 65)
                        Spacer()
                    }
                    
                    
                    
                    
                    
                    HStack{
                        
                        
                    
                            
                        ZStack{
                            
                            Image(systemName: "chevron.right.2")
                                .font(.title)
                        }
                            
                           
                            
                           
                            
                            
                        
                        .foregroundColor(.white)
                        .frame(width: 65, height:65)
                        .background(Color.red)
                        .clipShape(Circle())
                        .offset(x:offset)
                        .gesture(DragGesture().onChanged(Onchanged(value:)).onEnded(OnEnded(value:)))
                        Spacer()
                    }
                  
                   
                    
                }
                .frame(width: maxWidth, height: 60)
                .padding(.bottom,30)
                
                
                
                
                
            }
            
        }
        
    }
    func CuluculateWith()->CGFloat{
        let progress = offset / maxWidth
        return progress * maxWidth
        
        
    }
    func Onchanged(value : DragGesture.Value){
        
        if value.translation.width > 0 && offset <= maxWidth - 65{
            
            offset = value.translation.width
            
        }
        
    }
    
    func OnEnded(value : DragGesture.Value){
        
        withAnimation(.easeInOut){
            
            if offset > 180{
                
                offset = maxWidth - 65
            
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35){
                    
                    
                    NotificationCenter.default.post(name: Notification.Name("NEXT"),object: nil)
                    
                }
                
                
            }
            else{
                
                offset = 0
            }
            
        }
        
    }
}


struct TextShimer : View {
    @State var show = false
    var text : String
    var body: some View{
        
        ZStack{
            
            Text(text)
                .font(.system(size: 30, weight: .heavy))
                .foregroundColor(.white)
            
            
            HStack(spacing:0){
                
                ForEach(0..<text.count,id:\.self){index in
                    
                    
                    Text(String(text[text.index(text.startIndex,offsetBy:index)]))
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundColor(randomColor())
                    
                    
                    
                    
                }
                
                
                
            }
            .mask(
            
                
                Rectangle()
                    .fill(
                    
                    
                        LinearGradient(gradient: .init(colors: [.red,.green,.purple]), startPoint: .center, endPoint: .trailing)
                        
                    
                    )
                    .rotationEffect(.init(degrees: 70))
                    .padding(5)
                    .offset(x: -250)
                    .offset(x: show ? 500 : 0)
            
            
            
            )
            .onAppear(perform: {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                    
                    
                    show.toggle()
                }
            })
            
        }
       
    }
    
    func randomColor()->Color{
        
        let color = UIColor.init(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        return Color(color)
        
    }
}
