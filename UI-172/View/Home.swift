//
//  Home.swift
//  UI-172
//
//  Created by にゃんにゃん丸 on 2021/05/02.
//

import SwiftUI

struct Home: View {
    @Binding var selected : String
    init(selected : Binding<String>) {
        self._selected = selected
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        TabView(selection:$selected){
            
            PallaraxView()
                .tag("Home")
            
           SmileView()
                .tag("Setting")
            
            StoryView()
                .tag("Search")
            
            ShoesView()
                .tag("Write")
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
