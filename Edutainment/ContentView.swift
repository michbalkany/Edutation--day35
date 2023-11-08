//
//  ContentView.swift
//  Edutainment
//
//  Created by Mich balkany on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var correctAnswer: Int = 0
    @State private var choiceNumber: [Int] = [0,1,2,3]
    @State private var difficulty = 20
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var score: Int = 0
    
    enum CorrectAnswer {
         case correct
        case incorrect
    }
    
    @State private var isRightOrWrong = false
    
    
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            VStack {
                Spacer()
                VStack {
                    Text("\(firstNumber) x \(secondNumber) ")
                        .fontWeight(.bold)
                        .font(.system(size: 42))
                        .padding()
                }
                Divider()
                
                HStack {
                    ForEach(0..<2, id: \.self) { index in
                        Button {
                            increaseNumber(answers: choiceNumber[index])
                            generateNumbers()
                        } label: {
                            AnswerButton(numbers: choiceNumber[index])
                        }
                    }
                }
                
                HStack {
                    ForEach(2..<4, id: \.self) { index in
                        Button {
                            increaseNumber(answers: choiceNumber[index])
                            generateNumbers()
                        } label: {
                            AnswerButton(numbers: choiceNumber[index])
                        }
                    }
                }
                Text("Score: \(score)")
                    .font(.title.bold())
                    .padding()
                
                Spacer()
                
            }
            .padding()
            .onAppear(perform: generateNumbers)
            
            Button{
                score = 0
            } label: {
                Image(systemName: "arrow.circlepath")
                    .font(.title2.bold())
                    .foregroundStyle(.blue)
                    .frame(width: 40, height: 40)
                    .background(.indigo.opacity(0.5))
                    .clipShape(Circle())
                    .padding(.trailing, 25)
            }
        }
    }
    
    // increasing score count
    func increaseNumber(answers: Int) {
        if answers == correctAnswer {
            score += 1
        }else {
            score -= 1
        }
    }
    // generate random numbers to multiply
    func generateNumbers() {
        firstNumber = Int.random(in: 0...difficulty)
        secondNumber = Int.random(in: 0...difficulty)
        
        var answerList: [Int] = []
        
        correctAnswer = firstNumber * secondNumber
        
        for _ in 0...2 {
            answerList.append(Int.random(in: 0...difficulty))
        }
        
        answerList.append(correctAnswer)
        
        choiceNumber = answerList.shuffled()
    }
    
    
}

#Preview {
    ContentView()
}
