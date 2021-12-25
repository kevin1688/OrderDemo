//
//  OrderModel.swift
//  OrderDemo
//
//  Created by kai wen chen on 2021/12/25.
//

import SwiftUI
import Combine

struct menu:Identifiable,Hashable,Codable {
    var id = UUID().uuidString
    var title:String
    var img:String}

struct order:Identifiable,Hashable,Codable {
    var id = UUID().uuidString
    var menu:menu
    var qauntity:Int
}

class OData: ObservableObject {
    @Published var menus = [menu]()
    @Published var orders = [order]()
    
    init(){
        menus = [
            menu(title: "apple", img: "Apple"),
            menu(title: "banana", img: "Banana"),
            menu(title: "cherry", img: "Cherry"),
        ]
    }
    
    func addOrder(value:menu) {
        orders.append(order(menu: value, qauntity: 1))
    }
}
