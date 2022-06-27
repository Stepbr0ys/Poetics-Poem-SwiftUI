//
//  ExploreView.swift
//  Poems
//
//  Created by Борис Ларионов on 23.01.2022.
//

import SwiftUI

struct ExploreView: View {
    @State var showDetail = true
    @State var transition = true
    @State var largeText = false
    @State var selectedPoem : Poem
    @Namespace var namespace
    @Binding var transitionAnimation: Bool
    @Binding var transitionAnimation2: Bool
    
    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.9722190499, green: 0.9585376382, blue: 0.9244796038, alpha: 1))
                .ignoresSafeArea(.all)
            
                VStack {
                    VStack (spacing: 5){
                        Text("Hello Broys,")
                            .foregroundColor(Color(#colorLiteral(red: 0.5067941546, green: 0.4940449595, blue: 0.4558518529, alpha: 1)))
                            .font(Font.custom("Promo-Regular", size: 30))
                            .scaleEffect(transitionAnimation ? 1 : 0)
                        Text("here are today's poem for you")
                            .foregroundColor(Color(#colorLiteral(red: 0.5067941546, green: 0.4940449595, blue: 0.4558518529, alpha: 1)))
                            .font(Font.custom("Promo-Regular", size: 23))
                            .multilineTextAlignment(.center)
                            .scaleEffect(transitionAnimation2 ? 1 : 0)
                    }
                    .opacity(!transition ? 1 : 0)
                    .frame(height: 100)
                    
                    
                    ScrollView (showsIndicators: false) {
                        if !showDetail {
                            ForEach(poems) { poem in
                                Button  {
                                    withAnimation (.spring(response: 0.6, dampingFraction: 0.8)){
                                        selectedPoem = poem
                                        showDetail = true
                                    }
                                    withAnimation (.spring(response: 0.6, dampingFraction: 0.6).delay(0.5)){
                                        transition = true
                                    }
                                    withAnimation (.spring(response: 0.6, dampingFraction: 0.6).delay(0.9)){
                                        largeText = true
                                    }
                                    
                                } label: {
                                    ZStack {
                                        Color(#colorLiteral(red: 0.9472236037, green: 0.9269523025, blue: 0.8892561197, alpha: 1))
                                            .opacity(!transition ? 1 : 0)
                                        
                                        VStack (alignment: .center, spacing: 20) {
                                            Text(poem.text)
                                                .font(.system(size: 15))
                                                .foregroundColor(Color(#colorLiteral(red: 0.4674115777, green: 0.4433760643, blue: 0.3680765629, alpha: 1)))
                                                .lineSpacing(7)
                                                .matchedGeometryEffect(id: "text\(poem.id)", in: namespace)
                                                .multilineTextAlignment(.leading)
                                                .padding(.horizontal)
                                                .padding(.top, 40)
                                                .frame(width: 300, height: 300, alignment: .leading)
                                            
                                            Text("- " + poem.author)
                                                .font(.system(size: 15))
                                                .multilineTextAlignment(.leading)
                                                .padding(.horizontal)
                                                .padding(.bottom, 40)
                                                .frame(width: 300,alignment: .leading)
                                                .foregroundColor(Color(#colorLiteral(red: 0.4674115777, green: 0.4433760643, blue: 0.3680765629, alpha: 1)))
                                                .opacity(!transition ? 1 : 0)
                                        }
                                    .frame(alignment: .leading)
                                    }
                                    .frame(width: 330, height: 330)
                                    .cornerRadius(20)
                                }

                                
                            }
                        } else {
                            ForEach (poems) { poem in
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 330, height: 330)
                                    .opacity(0)
                            }
                        }
                    }
                }
                .padding()
            
            if showDetail {
                detail
            }

        }
        .safeAreaInset(edge: .top, content: {
            VStack {
                Spacer()
            }
            .frame(height: 30)
            
        })
        .ignoresSafeArea()
    }
    
    var detail : some View {
        ZStack {
            Color(#colorLiteral(red: 0.9722190499, green: 0.9585376382, blue: 0.9244796038, alpha: 1))
                .ignoresSafeArea(.all)
            
            ScrollView (showsIndicators: false) {
            VStack (spacing: 0) {
                VStack (alignment: .leading, spacing: 20) {
                    Text(selectedPoem.text)
                        .font(.system(size: 15))
                        .foregroundColor(Color(#colorLiteral(red: 0.4674115777, green: 0.4433760643, blue: 0.3680765629, alpha: 1)))
                        .lineSpacing(7)
                        .matchedGeometryEffect(id: "text\(selectedPoem.id)", in: namespace)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 30)
                        .padding(.vertical, 50)
                        .frame(maxWidth: 330, maxHeight: !largeText ? 330 : .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(#colorLiteral(red: 0.9472236037, green: 0.9269523025, blue: 0.8892561197, alpha: 1)))
                .ignoresSafeArea()
                
                
                    VStack (alignment: .leading, spacing: 0) {
                        Text("More poem by " + selectedPoem.author)
                            .font(.system(size: 20).weight(.semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 10)
                        ForEach (poems) { poem in
                            if ((poem.author == selectedPoem.author) && (poem.id != selectedPoem.id)) {
                                VStack (alignment: .leading, spacing: 15) {
                                    Text(poem.text)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color(#colorLiteral(red: 0.4674115777, green: 0.4433760643, blue: 0.3680765629, alpha: 1)))
                                        .lineSpacing(7)
                                        .multilineTextAlignment(.leading)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 30)
                                        .padding(.vertical, 10)
                                    
                                    Text("- " + poem.author)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 300, alignment: .leading)
                                        .foregroundColor(Color(#colorLiteral(red: 0.4674115777, green: 0.4433760643, blue: 0.3680765629, alpha: 1)))
                                        .padding(.leading, 30)
                                        .padding(.bottom, 30)
                                    
                                }
                            }
                        }
                    }
                    .opacity(transition ? 1 : 0)
                .ignoresSafeArea()
                }
            }
            .ignoresSafeArea()
        .statusBar(hidden: true)
            
            ZStack {
                Button  {
                    withAnimation (.spring(response: 0.6, dampingFraction: 0.8)){
                        showDetail = false
                    }
                    withAnimation (.spring(response: 0.6, dampingFraction: 0.6).delay(0.5)){
                        largeText = false
                        transition = false
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
            }
            }
            .offset(x: UIScreen.main.bounds.width / 2 - 30, y: -(UIScreen.main.bounds.height / 2) + 44)

        }
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView(selectedPoem: poems[1], transitionAnimation: .constant(true), transitionAnimation2: .constant(true))
    }
}
