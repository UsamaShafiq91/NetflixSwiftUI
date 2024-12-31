//
//  VerticalButton.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 16/12/2024.
//

import SwiftUI

struct VerticalButton: View {
    
    var text: String
    
    var isOnImage: String
    var isOffImage: String
    
    var isOn: Bool
    var color: Color = .white
    
    var imageName: String {
        return isOn ? isOnImage : isOffImage
    }
    
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack {
                Image(systemName: imageName)
                    .foregroundStyle(color)
                
                Text(text)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(color)
            }
        })
    }
}

#Preview {
    VerticalButton(text: "My List", 
                   isOnImage: "checkmark",
                   isOffImage: "plus",
                   isOn: true,
                   action: {})
}
