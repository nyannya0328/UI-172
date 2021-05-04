//
//  SmileView.swift
//  UI-172
//
//  Created by にゃんにゃん丸 on 2021/05/03.
//

import SwiftUI

struct SmileView: View {
    @State var value : CGFloat = 0.5
    var body: some View {
        VStack{
            
            Text("Smile")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .padding(.top)
            
            Spacer(minLength: 0)
            
            HStack{
                
                ForEach(1...2,id:\.self){_ in
                    
                    ZStack{
                        
                        EyeShape()
                            .stroke(Color.purple,lineWidth: 3)
                            .frame(width: 150)
                        
                        
                        EyeShape(value: value)
                            .stroke(Color.purple,lineWidth: 3)
                            .frame(width: 100)
                            .rotationEffect(.init(degrees: 180))
                            .offset(y: -100)
                        
                        
                        
                                
                                Circle()
                                    .fill(Color.black)
                                    .frame(width: 13, height: 13)
                                    .offset(y: -30)
                                
                                
                        
                        
                        
                    }
                    .frame(height: 100)
                    
                }
            }
            
            SmileShape(value: value)
                .stroke(Color.black,lineWidth: 3)
                .frame(height: 150)
            
            
            GeometryReader{reader in
                
                ZStack(alignment:.leading){
                    
                    let width = reader.frame(in:.global).width
                    
                    Color.black
                        .frame(height: 5)
                    Image(systemName: "heart.fill")
                        .font(.title2)
                        .foregroundColor(.pink)
                        .frame(width: 50, height: 50)
                        .background(Color.black)
                        .cornerRadius(10)
                        .offset(x: value * (width - 45))
                        .gesture(DragGesture().onChanged({ value in
                            let width = width - 45
                            let drag = value.location.x - 30
                            
                            
                            if drag > 0 && drag <= width{
                                
                                
                                self.value = drag / width
                            }
                            
                        }))
                    
                    
                    
                    
                }
                
                
            }
            .padding()
            .frame(height: 45)
            
            Spacer(minLength: 0)
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("DONE")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical,20)
                    .frame(width: getRect().width / 2)
                    .background(Color.black)
                    .cornerRadius(10)
                    
            })
            
        }
        .background(
            
            (value <= 0.3 ? Color.red : (value > 0.3 && value <= 0.7 ? Color.blue : Color.orange))
            
            
                .ignoresSafeArea(.all, edges: .all)
        
        )
       
        
        .animation(.easeInOut)
    }
}

struct SmileView_Previews: PreviewProvider {
    static var previews: some View {
        SmileView()
    }
}


struct SmileShape : Shape {
    var value : CGFloat
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            let center = rect.width / 2
            
            let downrdius : CGFloat = (115*value) - 45
            
            path.move(to: CGPoint(x: center - 150, y: 0))
            
            let to1 = CGPoint(x: center, y: downrdius)
            let control1 = CGPoint(x: center - 145, y: 0)
            let control2 = CGPoint(x: center - 145, y: downrdius)
            
            
            let to2 = CGPoint(x: center+150, y: 0)
            let control3 = CGPoint(x: center + 145, y: downrdius)
            let control4 = CGPoint(x: center + 145, y: 0)
            
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            
            path.addCurve(to: to2, control1: control3, control2: control4)
            
            
            
        }
    }
}


struct EyeShape : Shape {
    var value : CGFloat?
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            let center = rect.width / 2
            
            let downrdius : CGFloat =  55 * (value ?? 1)
            
            path.move(to: CGPoint(x: center - 50, y: 0))
            
            let to1 = CGPoint(x: center, y: downrdius)
            let control1 = CGPoint(x: center - 50, y: 0)
            let control2 = CGPoint(x: center - 50, y: downrdius)
            
            
            let to2 = CGPoint(x: center+50, y: 0)
            let control3 = CGPoint(x: center + 50, y: downrdius)
            let control4 = CGPoint(x: center + 50, y: 0)
            
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            
            path.addCurve(to: to2, control1: control3, control2: control4)
            
            
            
        }
    }
}
