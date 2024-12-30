//
//  Searchbar.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 24/12/2024.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    @State private var isEditing = true
    @Binding var isLoading: Bool

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(Color.graySearchText)
                    .padding(.leading, 10)
                
                TextField("Search", text: $text)
                    .foregroundStyle(.white)
                    .padding(.vertical, 5)
                    .onTapGesture {
                        isEditing = true
                    }
                    .animation(.default, value: isEditing)

                if !text.isEmpty {
                    Button(action: {
                        text = ""
                    }, label: {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(.circular)
                                .frame(width: 35, height: 35)
                                .tint(.white)
                                .padding(.trailing, 10)
                        }
                        else {
                            Image(systemName: "xmark.circle.fill")
                                .frame(width: 35, height: 35)
                                .foregroundStyle(Color.graySearchText)
                                .padding(.trailing, 10)
                        }
                    })
                }
            }
            .frame(height: 35)
            .background(Color.graySearchBackground)
            .clipShape(.rect(cornerRadius: 8))
            
            if isEditing {
                Button(action: {
                    text = ""
                    isEditing = false
                    hideKeyboard()
                }, label: {
                    Text("Cancel")
                        .foregroundStyle(.white)
                })
                .animation(.default, value: isEditing)

            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
        SearchBar(text: .constant(""),
                  isLoading: .constant(false))
    }
}
