//
//  PagerView.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 31/12/2024.
//

import SwiftUI

struct PagerView<Content: View>: View {
    
    let pageCount: Int
    @Binding var currentIndex: Int
    @Binding var translation: CGFloat
    let content: Content
    
    init(pageCount: Int,
         currentIndex: Binding<Int>,
         translation: Binding<CGFloat>,
         @ViewBuilder content: () -> Content) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self._translation = translation
        self.content = content()
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                self.content
                    .frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -(CGFloat(currentIndex) * geometry.size.width))
            .offset(x: translation)
            .animation(.interactiveSpring, value: translation)
            .gesture(
                DragGesture()
                    .onChanged({value in
                        translation = value.translation.width
                    })
                    .onEnded({value in
                        let offset = value.translation.width / geometry.size.width
                        
                        let newIndex = Int((CGFloat(currentIndex) - offset).rounded())
                        
                        currentIndex = min(max(0, newIndex), (pageCount-1))
                        translation = 0
                    })
            )
        }
    }
}

#Preview {
    PagerView(pageCount: 3,
              currentIndex: .constant(0),
              translation: .constant(.zero), content: {
        Color.red
        Color.blue
        Color.green
    })
}
