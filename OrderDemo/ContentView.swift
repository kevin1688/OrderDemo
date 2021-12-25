//
//  ContentView.swift
//  OrderDemo
//
//  Created by kai wen chen on 2021/12/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var myData = OData()
    var body: some View {
        TabView {
            Menu().environmentObject(myData)
            ShoppingCar().environmentObject(myData)
            OrderMenu().environmentObject(myData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct OrderMenu: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .tabItem {
                Image(systemName: "note.text")
            }
    }
}
