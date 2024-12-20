//
//  WhiteButton.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 17/12/2024.
//

import SwiftUI

struct HorizontalButton: View {
    
    let imageName: String
    let text: String
    var background: Color = .white
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Spacer()
                
                Image(systemName: imageName)
                    .font(.headline)
                
                Text(text)
                    .font(.system(size: 14))
                
                Spacer()
            }
            .padding(.vertical, 4)
            .foregroundStyle(background == .white ? .black : .white)
            .background(background)
            .clipShape(.rect(cornerRadius: 4))
        })
    }
}

#Preview {
    HorizontalButton(imageName: "play.fill", text: "Play", action: {})
}
