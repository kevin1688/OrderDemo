//
//  ShoppingCar.swift
//  OrderDemo
//
//  Created by kai wen chen on 2021/12/25.
//

import SwiftUI

struct ShoppingCar: View {
    @EnvironmentObject var myData:OData
    
    @State var isShow = false
    var body: some View {
        ZStack {
            VStack {
                buyingMenu()
                Spacer()
                Text("Check Out")
                    .font(.system(size: 48, weight: .heavy, design: .rounded))
                    .frame(width: 350, height: 60, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(18)
                    .padding(.bottom,10)
                    .onTapGesture {
                        isShow.toggle()
                    }
            }
            .blur(radius: isShow ? 9 : 0)
            
            alertView()
                .animation(.easeInOut, value: isShow)
                .offset(y: isShow ? 0 : -1000)
            
        }
        .tabItem {
            Image(systemName: "cart.fill")
        }
        
        
    }
    
    @ViewBuilder func alertView() -> some View {
        VStack {
            Text("確定結帳?")
                .font(.system(size: 48, weight: .heavy, design: .rounded))
                .padding(.top,10)
            Spacer()
            Text("確定")
                .font(.system(size: 48, weight: .heavy, design: .rounded)).frame(width: 200, height: 60, alignment: .center)
                .background(Color.red)
                .cornerRadius(18)
                .padding(.bottom,10)
                .onTapGesture {
                    myData.orders.append(order(onOrder: myData.orderMenus))
                    myData.orderMenus.removeAll()
                    isShow.toggle()
                }
                
        }.frame(width: 350, height: 200, alignment: .center)
            .foregroundColor(.white)
            .background(Color.green)
            .cornerRadius(36)
        .padding(.bottom,10)
    }
    
    @ViewBuilder func buyingMenu() -> some View {
        ScrollView(.vertical,showsIndicators:false){
            ForEach(myData.orderMenus) { od in
                HStack {
                    HStack(alignment: .center,spacing: 5) {
                        Image(od.menu.img)
                            .resizable()
                            .frame(width: 80, height: 80, alignment: .center)
                        Text("\(od.menu.title)")
                            .font(.system(size: 48, weight: .black, design: .rounded))
                            .foregroundColor(.white)
                            .padding()
                    }
                    .frame(width: 300,alignment: .leading)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(30)
                    
                    Text("\(od.qauntity)")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(width: 70, height: 70, alignment: .center)
                        .background(Color.red)
                        .cornerRadius(16)
                }
            }
        }
    }
}

struct ShoppingCar_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCar().environmentObject(OData())
    }
}
