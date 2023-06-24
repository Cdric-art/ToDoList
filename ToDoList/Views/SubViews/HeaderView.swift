//
//  HeaderView.swift
//  ToDoList
//
//  Created by Cédric Evrard on 24/06/2023.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            Rectangle()
                .rotationEffect(Angle(degrees: angle))
                .foregroundColor(backgroundColor)
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
            }
            .padding(.top, 80)
            .foregroundColor(.white)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, backgroundColor: .pink)
    }
}
