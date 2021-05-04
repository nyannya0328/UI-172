//
//  StoryView.swift
//  UI-172
//
//  Created by にゃんにゃん丸 on 2021/05/03.
//

import SwiftUI
var gra = LinearGradient(gradient: .init(colors: [.green,.red]), startPoint: .bottom, endPoint: .top)
struct StoryView: View {
    var body: some View {
        TabView{
            
            
            ForEach(storys){story in
                
                GeometryReader{reader in
                    
                    let frame = reader.frame(in:.global)
                    
                    ZStack{
                        gra
                            .cornerRadius(10)
                        
                        Image(story.image)
                            .resizable()
                          //  .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                            .rotation3DEffect(
                                .init(degrees: getAngle(offset: frame.minX)),
                                axis: (x: 0, y: 2, z: 0),
                                anchor: frame.minX > 0 ? .leading : .trailing,
                                perspective: 8
                            )
                        
                        
                    }
                    .frame(width: frame.width, height: frame.height)
                }
                    
                    
                
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .background(gra.edgesIgnoringSafeArea(.all))
    }
    
    func getAngle(offset : CGFloat) ->Double{
        
        let tempAngle = offset / (getRect().width / 2)
        
        let rotationDegree : CGFloat = 20
        
        return Double(tempAngle * rotationDegree)
        
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}

struct story : Identifiable {
    var id = UUID().uuidString
    var image : String
}

var storys = [
    story(image: "p1"),
    story(image: "p2"),
    story(image: "p3"),
    story(image: "p4"),
    story(image: "p5"),
    story(image: "p6"),
    story(image: "p7"),
]
