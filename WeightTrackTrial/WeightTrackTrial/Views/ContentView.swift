//
//  ContentView.swift
//  WeightTrackInterface
//
//  Created by Aman Jalan on 5/16/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let tabBarBackgroundColor = UIColor(red: 30.0/255.0, green: 30.0/255.0, blue: 30.0/255.0, alpha: 1.0)
    
    let tabBarUnselectedTextColor = UIColor(red: 116.0/255.0, green: 116.0/255.0, blue: 116.0/255.0, alpha: 1.0)
    
    init() {
        UITabBar.appearance().barTintColor = tabBarBackgroundColor
        UITabBar.appearance().unselectedItemTintColor = tabBarUnselectedTextColor
    }
    
    @State var selected = 0
    
    var body: some View {
        TabView(selection: $selected) {
            HomeView().tabItem({
                Text("Home")
                Image(systemName: "house")
            }).tag(0)
            
            TempView().tabItem({
                Text("Transformation")
                Image(systemName: "rectangle.stack.person.crop")
            }).tag(1)
            
            TempView().tabItem({
                Text("Graph")
                Image(systemName: "chart.bar")
            }).tag(2)
        }.accentColor(.white)
    }
} //end of Content View


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

