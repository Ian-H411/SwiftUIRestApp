//
//  ContentView.swift
//  SwiftUIdemos
//
//  Created by Ian Hall on 5/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView().frame(width: 350, height: 450, alignment: .center)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().frame(width: 350, height: 450, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
