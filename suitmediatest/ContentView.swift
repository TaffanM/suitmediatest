//
//  ContentView.swift
//  suitmediatest
//
//  Created by Taffan M on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PageOne()
        
    }
}



struct PageOne : View {
    @State var showAlertBlank = false
    @State var showAlert = false
    @State var alertTitle = ""
    @State var alertText = ""
    @State var showAlertNext = false
    @State private var name = ""
    @State private var palindrome = ""
    @State private var shouldNavigate = false
    
    
    
    var isPalindrome: Bool {
        let lowerText = palindrome.lowercased().filter {$0.isLetter}
        let reversedLowerText = String(lowerText.reversed())
        return lowerText == reversedLowerText
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("ic_photo")
                    .padding()
                    
                TextField("Name", text: self.$name)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.name != "" ? Color("Color") : Color(hex: "#FFFFFF"), lineWidth: 2).background(.white))
                .cornerRadius(15)
                
                
                TextField("Palindrome", text: self.$palindrome)
                .padding()
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.palindrome != "" ? Color("Color") : Color(hex: "#FFFFFF"), lineWidth: 2).background(.white))
                .cornerRadius(15)
                
                
                Button(action: {
                    if palindrome == "" {
                        showAlert = true
                        alertTitle = "Palindrome field is empty"
                        alertText = "Please fill the palindrome field"
                    }
                    else if !isPalindrome {
                        showAlert = true
                        alertTitle = "Not a palindrome"
                        alertText = "The text isn't a palindrome"
                    } else if isPalindrome{
                        showAlert = true
                        alertTitle = "A palindrome"
                        alertText = "The text is a palindrome"
                    }
                    
                }, label: {
                    Text("CHECK")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                })
                
                .background(Color(hex: "#2B637B"))
                .cornerRadius(15)
                .padding(.top, 50)
                .alert(isPresented: $showAlert){
                    Alert(title: Text(alertTitle), message: Text(alertText), dismissButton: .default(Text("OK")))
                }
                
                
                Button(action: {
                    if name.isEmpty {
                        showAlertNext = true
                    } else {
                        shouldNavigate.toggle()
                    }
                }, label: {
                    Text("NEXT")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                })
                .background(Color(hex: "#2B637B"))
                .cornerRadius(15)
                .alert(isPresented: $showAlertNext) {
                    Alert(title: Text("Please insert name"), message: Text("Please fill your name input field"), dismissButton: .default(Text("OK")))
                }
                
                
                
                
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(hex: "#3B8FA7"), Color(hex: "#8EBCA9")]),
                    startPoint: .topLeading,
                    endPoint: .bottomLeading
                )
            )
            .navigationDestination(isPresented: $shouldNavigate) {
                PageTwo(name: $name)
            }
        }
        
        
//        .background(
//            LinearGradient(
//                gradient: Gradient(colors: [Color(hex: "#3B8FA7"), Color(hex: "#8EBCA9")]),
//                startPoint: .topLeading,
//                endPoint: .bottomLeading
//            )
//        )
        
    }
    
}

struct PageTwo : View {
    @Binding var name : String
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading){
                VStack(alignment: .leading){
                    Text("Welcome")
                        .font(.title3)
                        
                    Text(name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                    
                    Spacer()
                }
                Spacer()
                
            }
            .navigationTitle("Second Screen")
            .navigationBarBackButtonHidden(false)
            
        }
        Divider()
        Spacer()
        
        
    }
}



#Preview {
    ContentView()
}
