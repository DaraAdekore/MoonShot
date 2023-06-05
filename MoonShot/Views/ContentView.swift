//
//  ContentView.swift
//  MoonShot
//
//  Created by Dara Adekore on 2023-05-29.
//

import SwiftUI

struct ContentView: View {
    @State var showingList = false
    var body: some View {
        NavigationView {
            Group {
                if showingList {
                    ListView()
                } else {
                    GridView()
                }
            }
            .navigationTitle("Moonshot")
            .background(showingList ? .lightBackground : .darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(id: "view toggle", placement: .navigationBarTrailing) {
                    Button {
                        showingList.toggle()
                    } label: {
                        Image(systemName: showingList ? "list.bullet" : "circle.grid.2x2" )
                    }
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
