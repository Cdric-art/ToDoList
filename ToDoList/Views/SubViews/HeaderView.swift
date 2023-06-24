//
//  HeaderView.swift
//  ToDoList
//
//  Created by Cédric Evrard on 24/06/2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .rotationEffect(Angle(degrees: 15))
                .foregroundColor(.pink)
            
            VStack {
                Text("To Do List")
                    .font(.system(size: 50))
                    .bold()
                
                Text("Get things done")
                    .font(.system(size: 30))
            }
            .padding(.top, 30)
            .foregroundColor(.white)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
