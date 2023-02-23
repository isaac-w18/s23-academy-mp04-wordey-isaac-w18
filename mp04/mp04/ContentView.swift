//
//  ContentView.swift
//  mp04
//
//  Created by Isaac Frank on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    @State var input = ""
    
    @State var textColor = Color.black
    @State var isBold = false
    @State var isItalics = false
    @State var size = 20.0
    
    @State var horizAlign = "Center"
    @State var vertAlign = "Center"
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Input text",
                              text: $input)
                }
                
                Section {
                    TextDisplayView(input: $input, textColor: textColor, isBold: isBold, isItalics: isItalics, size: size, horizAlign: horizAlign, vertAlign: vertAlign)
                } header: {
                    Text("Formatted text")
                }
                
                
            }
            .navigationBarTitle("Wordey")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    NavigationLink {
                        SettingsView(input: $input, textColor: $textColor, isBold: $isBold, isItalics: $isItalics, size: $size, horizAlign: $horizAlign, vertAlign: $vertAlign)
                    } label: {
                        Image(systemName: "gear")
                            .font(.title2)
                            .foregroundColor(.black)
                            .padding()
                    }
                }
            }
            
            
            
        }
    }
}

struct TextDisplayView: View {
    @Binding var input: String

    let textColor: Color
    let isBold: Bool
    let isItalics: Bool
    let size: Double
    
    let horizAlign: String
    let vertAlign: String
    
    
    
    var body: some View {
        
        
        VStack {
            Text(input)
                .bold(isBold)
                .italic(isItalics)
                .foregroundColor(textColor)
                .font(.system(size: size))
                .frame(maxWidth: .infinity, minHeight: 200,  alignment: Alignment(horizontal: horizAlign=="Leading" ? .leading: horizAlign=="Center" ? .center: .trailing,
                        vertical: vertAlign=="Top" ? .top: vertAlign=="Center" ? .center: .bottom))
                
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
