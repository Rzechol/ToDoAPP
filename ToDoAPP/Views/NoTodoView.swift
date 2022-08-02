//
//  NoTodoView.swift
//  ToDoAPP
//
//  Created by Bartosz Rzechółka on 02/08/2022.
//

import SwiftUI

struct NoTodoView: View {
    
    
    @State var isAnimtaing: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing:10){
                Text("Jeszcze nic tu nie ma")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Naciśnij przycisk 'Add' by dodać todo")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label:  {
                        Text("Add")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(isAnimtaing ? secondaryAccentColor: Color.accentColor)
                            .cornerRadius(10)
                            
                    })
                .padding(.horizontal, isAnimtaing ? 30 : 50)
                .shadow(
                    color: isAnimtaing ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: isAnimtaing ? 30 : 10,
                    x: 0,
                    y: isAnimtaing ? 50 : 30)
                .scaleEffect(isAnimtaing ? 1.1 : 1.0)
                .offset(y: isAnimtaing ? -7 : 0)
                .buttonStyle(PlainButtonStyle())
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !isAnimtaing else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5)  {
            withAnimation(
            Animation
                .easeInOut(duration:  2.0)
                .repeatForever()
            ) {
                isAnimtaing.toggle()
            }
        }
    }
}

struct NoTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoTodoView()
                .navigationTitle("Title")
        }
    }
}
