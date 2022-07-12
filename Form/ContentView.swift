//
//  ContentView.swift
//  Form
//
//  Created by Abhirath Sujith on 13/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var DOB = Date()
    @State private var send = false
    @State private var vote = 0
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Personal Details")) {
                    TextField("First Name", text: $firstname)
                    TextField("Last Name", text: $lastname)
                    DatePicker("DOB", selection: $DOB, displayedComponents: .date)
                }
                
                Section( header: Text("More Details")) {
                    
                    Toggle("Send Notifications", isOn: $send)
                       // .toggleStyle(SwitchToggleStyle(tint: .mint))
                    
                    
                    Stepper("Number of Votes", value: $vote, in: 1...50)
                    Text("Casted Votes are \(vote)")
                }
                
                
            }
            
            .navigationTitle("Form")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    
                    Button {
                        hidekey()
                    } label: {
                        Image(systemName: "keyboard")
                    }
                    
                    Button("Vote", action: votec)
                }
            }
            
        }
       
        
        
    }
    
    func votec() {
        print("Casted vote")
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#if canImport(UIKit)
extension View {
    
    func hidekey() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}

#endif
