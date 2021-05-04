//
//  ShoesView.swift
//  UI-172
//
//  Created by にゃんにゃん丸 on 2021/05/04.
//

import SwiftUI

struct ShoesView: View {
    @Namespace var animation
    @StateObject var model = ShoeViewModel()
    var body: some View {
        ZStack(alignment:.bottom){
            
            VStack{
                
                
                HStack{
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "rectangle.grid.2x2")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(3)
                            .background(
                            
                         Rectangle()
                            .stroke(Color.red,lineWidth: 0.3)
                            )
                            
                        
                        
                    })
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "bag.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .overlay(
                            
                                Text("\(model.cartItems)")
                                    .font(.callout)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(10)
                                    .clipShape(Circle())
                                    .offset(x: 15, y: -10)
                                    .opacity(model.cartItems != 0 ? 1 : 0)
                            
                            )
                        
                        
                    })
                    
                }
                .overlay(
                Text("NIKE")
                    .font(.title)
                    .fontWeight(.bold)
                
                )
                .padding()
                
                ScrollView{
                    
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("AIR MAX")
                            .font(.title)
                            .font(.headline)
                            .fontWeight(.semibold)
                            
                        Text("NIKE")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                        
                        
                        Image("shoe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.horizontal)
                        
                        Text("PRICE")
                            .font(.body)
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)
                        
                        
                        Text("10000円")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .kerning(10)
                        
                        
                    })
                    .padding(.horizontal)
                    .padding(.vertical,20)
                    .overlay(
                    
                    Capsule()
                        .fill(Color.green)
                        .frame(width: 5, height: 45)
                        .padding(.top,25)
                        
                        ,alignment: .topLeading
                    
                    )
                    
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding()
                    .onTapGesture {
                        model.showcart.toggle()
                    }
                    
                    
                    
                    
                    
                }
                
            }
            .blur(radius: model.showcart ? 50 : 0)
            AddtoCart(animation: animation)
                .environmentObject(model)
                .offset(y: model.showcart ? model.startAnimation ? 520 :  0 : 520)
            
            if model.startAnimation{
                
                VStack{
                    
                    Spacer()
                    
                    
                    ZStack{
                        
                        
                        Color.white
                            .frame(width: model.shoeAnimaition ? 100 : getRect().width * 1.3,height: model.shoeAnimaition ? 100 : getRect().width * 1.3)
                        
                            .clipShape(Circle())
                            .opacity(model.shoeAnimaition ? 1 : 0)
                        
                        Image("shoe")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                    }
                    .offset(y: model.saveCart ? 70 : -120)
                    .scaleEffect(model.saveCart ? 0.6 : 1)
                    .onAppear(perform: {
                        model.peformAnimaiton()
                    })
                    if !model.saveCart{
                        Spacer()
                    }
                    
                    
                   
                    
                    Image(systemName:"bag\(model.additemtoCart ? ".fill" : "")")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(model.additemtoCart ? Color.red : Color.primary)
                        .clipShape(Circle())
                        .offset(y:model.shobag ? -50 : 300)
                       
                    
                    
                }
                .frame(width: getRect().width)
                .offset(y: model.endAnimation ? 500 : 0)
                
            }
            
          
            
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .background(Color("bg").opacity(0.2).ignoresSafeArea())
        .onChange(of: model.endAnimation, perform: { value in
            if model.endAnimation{
                
                model.resetALL()
            }
        })
    }
}

struct ShoesView_Previews: PreviewProvider {
    static var previews: some View {
        ShoesView()
    }
}

struct AddtoCart : View {
    @EnvironmentObject var model : ShoeViewModel
    var animation : Namespace.ID
    var body: some View{
        
        VStack{
            
            HStack{
                
                
                if !model.startAnimation{
                    Image("shoe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                VStack(alignment: .trailing, spacing: 10, content: {
                    Text("ARI MAX")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("10000円")
                        .font(.title3)
                        .fontWeight(.bold)
                })
                .offset(y: 20)
                
                
            }
            Divider()
            
            Text("Select Size")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.green)
                .kerning(1.3)
            
            let columns = Array(repeating: GridItem(.flexible(),spacing: 10), count: 4)
            
            LazyVGrid(columns: columns, spacing: 15, content: {
                ForEach(size,id:\.self){size in
                    
                    Button(action: {
                        
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.5)){
                            
                            
                            model.selectsize = size
                            
                        }
                        
                        
                    }, label: {
                        Text(size)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(model.selectsize == size ? .white :.primary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .background(model.selectsize == size ? Color.orange : Color.primary.opacity(0.3))
                            .cornerRadius(15)
                            
                    })
                    
                    
                    
                }
            })
            .padding(.top,10)
            
            Button(action: {
                
                withAnimation(.linear){
                    
                    
                    model.startAnimation.toggle()
                }
                
            }, label: {
                Text("Add To Cart")
                    .fontWeight(.bold)
                    .foregroundColor(model.selectsize == "" ? .white : .primary)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(model.selectsize == "" ? Color.black.opacity(0.3) : Color.orange)
                    .cornerRadius(20)
            })
            
            .disabled(model.selectsize == "")
            .padding()
            
            
            
            
            
            
        }
        .padding()
        .background(Color.white.clipShape(CustomShape(radi: 10, corener: [.topLeft,.topRight])))
        
    }
}
let size = ["22","23","24","25","26","27","28","29","30"]
