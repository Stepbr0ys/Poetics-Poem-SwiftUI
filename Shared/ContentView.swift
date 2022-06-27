//
//  ContentView.swift
//  Shared
//
//  Created by Борис Ларионов on 23.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State var showView : showView = .start
    @State var transitionAnimation = false
    @State var transitionAnimation2 = false
    
    var body: some View {
        switch showView {
        case .explore:
            ExploreView(selectedPoem: poems[0], transitionAnimation: $transitionAnimation, transitionAnimation2: $transitionAnimation2)
        case .start:
            StartScreen(showView: $showView, transitionAnimation: $transitionAnimation, transitionAnimation2: $transitionAnimation2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
