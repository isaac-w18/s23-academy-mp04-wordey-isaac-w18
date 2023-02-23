//
//  SettingsView.swift
//  mp04
//
//  Created by Isaac Frank on 2/22/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var input: String
    
    @Binding var textColor: Color
    @Binding var isBold: Bool
    @Binding var isItalics: Bool
    @Binding var size: Double
    
    @Binding var horizAlign: String
    @Binding var vertAlign: String
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextDisplayView(input: $input, textColor: textColor, isBold: isBold, isItalics: isItalics, size: size, horizAlign: horizAlign, vertAlign: vertAlign)
                }
                
                Section(header: Text("Style")) {
                    Toggle("Bold", isOn: $isBold)
                    Toggle("Italics", isOn: $isItalics)
                    ColorPicker("Color", selection: $textColor)
                    Slider(value: $size, in: 5...100, step: 1.0) {
                        Text("Font size")
                    } minimumValueLabel: {
                        Text("1")
                    } maximumValueLabel: {
                        Text("100")
                    }
                        .accentColor(textColor)
                }
                
                Section(header: Text("Alignment")) {
                    Picker("Horizontal", selection: $horizAlign) {
                        Text("Leading").tag("Leading")
                        Text("Center").tag("Center")
                        Text("Trailing").tag("Trailing")
                    }
                    
                    Picker("Vertical", selection: $vertAlign) {
                        Text("Top").tag("Top")
                        Text("Center").tag("Center")
                        Text("Bottom").tag("Bottom")
                    }
                }
            }
        }
    }
}



//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView(input: $input, isBold: true, isItalics: false, size: 20)
//    }
//}
