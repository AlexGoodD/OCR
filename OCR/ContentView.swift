//
//  ContentView.swift
//  OCR
//
//  Created by Alejandro on 10/07/25.
//

import SwiftUI

struct ContentView: View {
    @State private var recognisedText = "Press start to scan"
    @State private var showingScanningView = false
    let buttonHeight: CGFloat = 30
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .fill(Color.white)
                            .shadow(radius: 3)
                        Text(recognisedText)
                            .padding()
                    }
                    .padding()
                }
                
                Spacer()
                
                HStack (spacing: 20) {
                    Button(action:  {
                        self.showingScanningView = true
                    }) {
                        Text("Start scanning")
                            .frame(maxWidth: .infinity, minHeight: buttonHeight)
                            .padding()
                            .foregroundColor(.white)
                            .background(Capsule().fill(Color.blue))
                            
                    }
                    
                    Button(action:  {
                        self.copyToClipboard()
                    }) {
                        Text("Start scanning")
                            .frame(maxWidth: .infinity, minHeight: buttonHeight)
                            .padding()
                            .foregroundColor(.white)
                            .background(Capsule().fill(Color.green))
                    }
                    .disabled(recognisedText == "Press start to scan")
                }
                .padding()
            }
            .background(.gray.opacity(0.1))
            .navigationBarTitle("Document Scanner")
            .sheet(isPresented: $showingScanningView) {
                ScanDocumentView(recognisedText: self.$recognisedText)
            }
        }
    }
    
    private func copyToClipboard() {
        UIPasteboard.general.string = recognisedText
    }
}

#Preview {
    ContentView()
}
