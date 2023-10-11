//
//  ContentView.swift
//  Diseno1
//
//  Created by Daniel Moya on 2/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact{
            compactDesign()
        } else {
            regularDesign()
        }
    }
}

struct button: ViewModifier {
    var color: Color
    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .clipShape(Circle())
            .foregroundColor(.white)
            .font(.title)
    }
}

struct compactDesign: View {
    
    let _number = "8297280043"
    let _message = "Hello"
    
    func sendMessage() -> Void {
        let sms = "sms:\(_number)&body=\(_message)"
        guard let stringSMS = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        UIApplication.shared.open(URL.init(string: stringSMS)!, options: [:], completionHandler: nil)
    }
    
    func call() -> Void {
        guard let number = URL(string: "tel://\(_number)") else { return }
        UIApplication.shared.open(number)
    }
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack{
                Image("listexample")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(Circle())
                HStack {
                    Text("Julio Martinez")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Image(systemName: "checkmark.seal.fill")
                        .font(.title)
                        .background(Color.white)
                        .foregroundColor(.blue)
                }
                Text("Calle C")
                    .font(.title)
                    .foregroundColor(.white)
                    .italic()
                HStack{
                    Button(action: {
                        call()
                    }){
                        Image(systemName: "phone.fill").modifier(button(color: .blue))
                    }
                    
                    Button(action: {
                        sendMessage()
                    }){
                        Image(systemName: "message.fill").modifier(button(color: .red))
                    }
                    
                }
                
                
            }
            
        }
    }
}

struct regularDesign: View {
    var body: some View {
        ZStack {
            Color.blue.edgesIgnoringSafeArea(.all)
            HStack{
                Image("listexample")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 10){
                    Text("Julio Martinez")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Text("Calle C")
                        .font(.title)
                        .foregroundColor(.white)
                        .italic()
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
