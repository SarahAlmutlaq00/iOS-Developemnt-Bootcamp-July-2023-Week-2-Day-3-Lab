//
//  ContentView.swift
//  Lab3Week2
//
//  Created by Sarah on 02/08/2023.
//

import SwiftUI

class DataModel: ObservableObject {
    @Published var data = "Initial Data"
    @Published var isDark: Bool = false
    
    func updateData() {
        data = "Updated Data"
    }
}
struct Result: View {
    var choice: String
    
    var body: some View {
        Text("Your Favourite color \(choice)")
    }
}

struct TextFieldView: View {
    @Binding var text: String
    
    var body: some View {
        TextField("Enter text", text: $text)
    }
}
struct ContentView: View {
    
    @State private var isShowingDetailView = false
    @StateObject var dataModel = DataModel()
    @State var text = ""

    var body: some View {
        NavigationView {
            VStack {
                       Text(" choose your  color ?")

                       NavigationLink(destination: Result(choice: "Black")) {
                           Text(" Black")
                       }

                       NavigationLink(destination: Result(choice: "White")) {
                           Text(" White")
                       }

                Text(dataModel.data)
                                  .padding()
                              
                              Button(action: {
                                  self.dataModel.isDark.toggle()
                                  self.dataModel.updateData()
                              }) {
                                  Text("Update Data")
                              }
                
                        Text("You entered: \(text)")
                TextField("Search", text: $text)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 4)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(12)
                   }
            .navigationTitle("welcome")
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

