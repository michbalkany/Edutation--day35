//
//  AnswerButton.swift
//  Edutainment
//
//  Created by Mich balkany on 11/8/23.
//

import SwiftUI

struct AnswerButton: View {
    var numbers: Int
    
    var body: some View {
        Text("\(numbers)")
            .frame(width: 130, height: 130)
            .font(.system(size: 42, weight: .bold, design: .rounded))
            .background(.blue.opacity(0.3))
            .foregroundStyle(.indigo)
            .clipShape(RoundedRectangle(cornerRadius: 24.0))
            .padding()
    }
}

#Preview {
    AnswerButton(numbers: 20)
}
