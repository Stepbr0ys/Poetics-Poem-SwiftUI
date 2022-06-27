//
//  StartScreen.swift
//  Poems
//
//  Created by Борис Ларионов on 23.01.2022.
//

import SwiftUI

struct StartScreen: View {
    @State var selectedItem = 0
    @State var selectedItemForAnimate = 0
    @Binding var showView: showView
    @Binding var transitionAnimation: Bool
    @Binding var transitionAnimation2: Bool
    @State var startWindow = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9722190499, green: 0.9585376382, blue: 0.9244796038, alpha: 1))
                .ignoresSafeArea(.all)
            
            VStack (spacing: 30){
                Text("poetics")
                    .foregroundColor(Color(#colorLiteral(red: 0.7306767106, green: 0.708473742, blue: 0.6604938507, alpha: 1)))
                    .font(Font.custom("Belligan", size: 40))
                    .scaleEffect(startWindow ? 1 : 0)
                    //.frame(maxHeight: 300, alignment: .top)
                    
                
                tabView.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .scaleEffect(startWindow ? 1 : 0)
                
                
                exploreButton
                    .scaleEffect(startWindow ? 1 : 0)
                    
                    
            }
            .frame(maxHeight: .infinity, alignment: .center)
        }
        .onAppear {
            withAnimation (.spring(response: 0.6, dampingFraction: 0.6).delay(0.3)){
                startWindow = true
            }
        }
        
    }
    
    var tabView: some View {
        VStack (spacing: 30){
            TabView (selection: $selectedItem) {
                ForEach(0 ..< 3) { item in
                    VStack (spacing: 10) {
                        Image("Art")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300)
                        
                        
                        Text("Poems by People")
                            .foregroundColor(Color(#colorLiteral(red: 0.5067941546, green: 0.4940449595, blue: 0.4558518529, alpha: 1)))
                            .font(Font.custom("HelloKatterine", size: 70))
                        
                        Text("To read a poem is to hear it with our eyes: to hear it is to see with our ears.")
                            .foregroundColor(Color(#colorLiteral(red: 0.5067941546, green: 0.4940449595, blue: 0.4558518529, alpha: 1)))
                            .multilineTextAlignment(.center)
                            .font(Font.custom("Promo-Regular", size: 17))
                            .frame(width: 300)
                    }
                    .id(item)
                }
            }
            .frame(height: 400)
            .onChange(of: selectedItem, perform: { newValue in
                withAnimation (.spring(response: 0.3, dampingFraction: 0.4)){
                    selectedItemForAnimate = newValue
                }
            })
        .tabViewStyle(.page(indexDisplayMode: .never))
            rectanglePageIndex
        }
    }
    
    var rectanglePageIndex: some View {
        HStack (spacing: 5){
            ForEach(0 ..< 3) { item in
                RoundedRectangle(cornerRadius: 4, style: .continuous)
                    .frame(width: item == selectedItemForAnimate ? 20 : 15, height: item == selectedItemForAnimate ? 20 : 15)
                    .foregroundColor(Color(#colorLiteral(red: 0.668053329, green: 0.6526681185, blue: 0.6141225696, alpha: 1)))
            }
        }
    }
    
    var exploreButton: some View {
        ZStack {
            Button  {
                withAnimation (.spring(response: 0.6, dampingFraction: 0.6)){
                    showView = .explore
                }
                withAnimation (.spring(response: 0.6, dampingFraction: 0.6).delay(0.1)){
                    transitionAnimation = true
                }
                withAnimation (.spring(response: 0.6, dampingFraction: 0.6).delay(0.2)){
                    transitionAnimation2 = true
                }
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 13, style: .continuous)
                        .foregroundColor(Color(#colorLiteral(red: 0.9197104573, green: 0.8473473191, blue: 0.6915034652, alpha: 1)))
                    .frame(width: 300, height: 60)
                    
                    Text("Explore Poems")
                        .font(Font.custom("Promo-Regular", size: 17))
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen(showView: .constant(.start), transitionAnimation: .constant(false), transitionAnimation2: .constant(true))
    }
}
