//
//  ContentView.swift
//  Lesson4.30
//
//  Created by Сампилов Ильдар on 12.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = Double.random(in: 0...255)
    @State private var userName = ""
    @State private var displayedName = ""
    @State private var alertPresented = false
    
    var body: some View {
        VStack(spacing: 40) {
            Text("\(lround(sliderValue))")
                .font(.largeTitle)
            UserNameView(userName: displayedName)
            ColorSliderView(value: $sliderValue, textColor: .red)
            TextField("Enter your name", text: $userName)
                .textFieldStyle(.roundedBorder)
            Button("Done", action: checkUserName)
                .alert("Wrong format", isPresented: $alertPresented) {
                    Button("OK") {}
                } message: {
                    Text("Enter your name")
                }
            VStack {
                Text("Welcome to")
                Text("SwiftUI!")
            }
            .font(.system(size: 60))
            .bold()
            .foregroundColor(.red)
            
            Spacer()
        }
        .padding()
    }
    
    private func checkUserName() {
        if let _ = Double(userName) {
            userName = ""
            alertPresented.toggle()
            return
        }
        displayedName = userName
        userName = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    @Binding var value: Double
    let textColor: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(textColor)
            Slider(value: $value, in: 0...255, step: 1)
            Text("255").foregroundColor(textColor)
        }
    }
}

struct UserNameView: View {
    let userName: String
    
    var body: some View {
        HStack {
            HStack(alignment: .firstTextBaseline) {
                Text("USER NAME: ")
                    .frame(height: 60)
                Text(userName)
                    .font(.largeTitle)
            }
            Spacer()
        }
    }
}
