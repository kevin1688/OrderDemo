//
//  DataModel.swift
//  OrderDemo
//
//  Created by kai wen chen on 2022/1/4.
//

import SwiftUI
import Combine

class DemoData: ObservableObject {
    @Published var shops = [shop]()
    
    init() {
        shops = [
            shop(title: "apple", address: "XXX", menu: [
                product(name: "frute", cal: "300", price: 100),
                product(name: "frute02", cal: "400", price: 900),
                product(name: "frute03", cal: "500", price: 300),
            ]),
            shop(title: "apple02", address: "XXX", menu: [
                product(name: "frute04", cal: "300", price: 500),
                product(name: "frute05", cal: "400", price: 600),
                product(name: "frute06", cal: "500", price: 700),
            ])
        ]
    }
    
    func avgPrice() -> Float {
        var sumValue:Int = 0
        var tempCount = 0
        var demoFloat:Double = 0.98987
        for sp in shops {
            for mn in sp.menu {
                sumValue = sumValue + mn.price
                tempCount += 1
            }
        }
        let avgTemp = Float(sumValue) / Float(tempCount)
        return avgTemp
    }
    
    func changePrice(value:Int, setValue:Int) {
        var index = shops.firstIndex { sp in
            sp.title == "apple02"
        }
        
        if index != nil { //有找到
            var menuIndex = shops[index!].menu.firstIndex { mn in
                mn.price == 500
            }
            if menuIndex != nil { //商品條件找到的話
                if setValue != nil{
                    shops[index!].menu[menuIndex!].price = setValue
                }else{
                    shops[index!].menu[menuIndex!].price += 100
                }
            }else{//找不到的話
                shops[index!].menu[menuIndex!].price = 100
            }
        }else{//沒有找到
            
        }
    }
    
}

struct shop:Identifiable,Codable {
    var id = UUID()
    var title:String
    var address:String
    var menu:[product]
}

struct product:Identifiable,Codable {
    var id = UUID()
    var name:String
    var cal:String
    var price:Int
}
