////
////  StatusBarItem.swift
////  ClockGPT
////
////  Created by Rees Pawson on 21/3/2023.
////
//
//import SwiftUI
//
//struct StatusBarItem: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct StatusBarItem_Previews: PreviewProvider {
//    static var previews: some View {
//        StatusBarItem()
//    }
//}


import SwiftUI

struct StatusBarItem: View {
    @State private var popoverVisible = false
    
    var body: some View {
        Button(action: {
            popoverVisible.toggle()
        }) {
            Image(systemName: "timer")
                .font(Font.system(size: 18, weight: .medium))
                .padding(.horizontal)
        }
        .popover(isPresented: $popoverVisible, arrowEdge: .bottom) {
            ContentView()
                .frame(width: 300, height: 200)
        }
    }
}
