//
//  SplashView.swift
//  SoberTasks
//
//  Created by Ch Burhan  on 12/5/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @StateObject private var viewModel = BoardViewModel()

    var body: some View {
        VStack {
            if isActive {
                ContentView(viewModel: viewModel)
            } else {
                // Splash screen content
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 20)
                    .foregroundStyle(Color.secondaryAccent)
                
                Text("SoberTasks")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                    .foregroundColor(Color.secondaryAccent)
            }
        }
        .onAppear {
            // Simulate a delay for splash screen before transitioning
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // 2 seconds delay
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
