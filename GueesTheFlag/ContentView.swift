//
//  ContentView.swift
//  GueesTheFlag
//
//  Created by Furkan Cingöz on 22.11.2023.
//

import SwiftUI

struct ContentView: View {
  @State private var showingScore = false
  @State private var scoreTitle = ""
  @State private var countries = ["Estonia","France","Germany", "Ireland", "Italy","Monaco", "Nigeria","Poland", "Ukraine", "Spain", "UK", "US"].shuffled()
  @State private var correctAnswer = Int.random(in:0...2)


  var body: some View {
    ZStack {
      LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .top, endPoint: .bottom)
        .ignoresSafeArea()

      VStack(spacing: 30){
        Spacer()
        Text("Guest the Flag")
          .font(.largeTitle)
          .fontWeight(.heavy)
          .foregroundStyle(.white)
        VStack {
          Spacer()
          Text("Tap the flag of")
            .foregroundStyle(.secondary)
            .font(.subheadline.weight(.heavy))
          Text(countries[correctAnswer])
            .foregroundStyle(.primary)
            .font(.largeTitle.weight(.semibold))
        }
        ForEach(0..<3) { number in
          Button {
            //flag was tapped
            flagTapped(number)
          } label: {
            Image(countries[number])
              .renderingMode(.original)
              .cornerRadius(15)
              .shadow(radius: 20)

          }
        }
        Spacer()
        Spacer()
        Text("Score: ??")
          .font(.subheadline.weight(.medium))
          .foregroundStyle(.black)
        Spacer()
      }.alert(scoreTitle, isPresented:  $showingScore) {
        Button("Countine", action: askQuestion)
      } message: {
        Text("Your score is ???")
          .foregroundStyle(.primary)
      }
    }

  }
  func flagTapped(_ number: Int) {
    if number == correctAnswer {
      scoreTitle = "Correct"
    } else {
      scoreTitle = "Wrong"
    }
    showingScore = true
  }
  func askQuestion() {
    countries.shuffled()
    correctAnswer = Int.random(in: 0...2)
  }
}
#Preview {
  ContentView()
}
