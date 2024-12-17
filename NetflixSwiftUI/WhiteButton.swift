//
//  WhiteButton.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 17/12/2024.
//

import SwiftUI

struct WhiteButton: View {
    
    let imageName: String
    let text: String
    
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
            .foregroundStyle(.black)
            .background(.white)
            .clipShape(.rect(cornerRadius: 4))
        })
    }
}

#Preview {
    WhiteButton(imageName: "play.fill", text: "Play", action: {})
}
