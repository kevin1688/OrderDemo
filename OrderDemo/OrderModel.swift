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

struct orderMenu:Identifiable,Hashable,Codable {
    var id = UUID().uuidString
    var menu:menu
    var qauntity:Int
}

struct order:Identifiable,Hashable,Codable {
    var id = UUID().uuidString
    var onOrder:[orderMenu]
}

class OData: ObservableObject {
    @Published var menus = [menu]()
    @Published var orderMenus = [orderMenu]()
    @Published var orders = [order]()
    
    init(){
        menus = [
            menu(title: "apple", img: "Apple"),
            menu(title: "banana", img: "Banana"),
            menu(title: "cherry", img: "Cherry"),
        ]
        
        orderMenus = [
            orderMenu(menu: menu(title: "apple", img: "Apple"), qauntity: 1)
        ]
        orders = [
            order(onOrder: orderMenus)
        ]
         
    }
    
    func addOrder(value:menu) {
        let isHaveIndex = orderMenus.firstIndex(where: { od in
            od.menu.title == value.title
        })
        
        if (isHaveIndex != nil) {
            orderMenus[isHaveIndex!].qauntity += 1
        }else{
            orderMenus.append(orderMenu(menu: value, qauntity: 1))
        }
        
    }
}
