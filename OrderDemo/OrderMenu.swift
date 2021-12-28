//
//  OrderMenu.swift
//  OrderDemo
//
//  Created by kai wen chen on 2021/12/28.
//

import SwiftUI

struct OrderMenu: View {
    @EnvironmentObject var myData:OData
    
    @State var myOrder = [
        orderMenu(menu: menu(title: "apple", img: "Apple"), qauntity: 1)
    ]
    
    @State var isShowList = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Order History")
                    .font(.system(size: 48, weight: .heavy, design: .rounded))
                    .frame(width: 350, height: 60, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(18)
                    .padding(.bottom,10)
                
                ScrollView(showsIndicators:false) {
                    ForEach(myData.orders) { od in
                        VStack {
                            Text("Oder")
                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                                .padding(.bottom,5)
                            Text("Oder\(od.id)")
                                .font(.system(size: 12, weight: .heavy, design: .rounded))
                        }
                        .frame(width: 350, height: 60, alignment: .center)
                        .padding(.vertical,5)
                        .foregroundColor(.gray)
                        .background(Color.yellow)
                        .cornerRadius(18)
                        .onTapGesture {
                            isShowList.toggle()
                            myOrder = od.onOrder
                        }
                        
                    }
                }
            }
            .blur(radius: isShowList ? 5 : 0)
            /*showList()
                .offset(y: isShowList ? 0 : 1000)
                .animation(.easeInOut, value: isShowList)
                .onTapGesture {
                    isShowList.toggle()
                }*/
            
        }
        .sheet(isPresented: $isShowList){
            showList()
        }
        .tabItem {
            Image(systemName: "note.text")
        }
        
    }
    
    @ViewBuilder func showList() -> some View{
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            VStack {
                Text("Menu List")
                    .font(.system(size: 48, weight: .heavy, design: .rounded))
                    .frame(width: 350, height: 60, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(18)
                    .padding(.vertical,20)
                ScrollView {
                    ForEach(myOrder) { myOd in
                        HStack {
                            HStack(alignment: .center,spacing: 5) {
                                Image(myOd.menu.img)
                                    .resizable()
                                    .frame(width: 80, height: 80, alignment: .center)
                                Text("\(myOd.menu.title)")
                                    .font(.system(size: 48, weight: .black, design: .rounded))
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .frame(width: 290,alignment: .leading)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(30)
                            
                            Text("\(myOd.qauntity)")
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
        .cornerRadius(36)
    }
}


struct OrderMenu_Previews: PreviewProvider {
    static var previews: some View {
        OrderMenu().environmentObject(OData())
    }
}
