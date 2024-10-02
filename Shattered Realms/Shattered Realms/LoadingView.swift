//
//  LoadingView.swift
//  Shattered Realms
//
//  Created by Orkhan Gojayev on 10/2/24.
//

import SwiftUI

// Модель для хранения информации о каждом регионе
struct Region: Identifiable {
    var id = UUID()
    var name: String
    var color: Color
    var imageName: String // Имя изображения для региона
}

struct LoadingView: View {
    // Массив регионов
    let regions: [Region] = [
        Region(name: "Shattered Realms", color: .green, imageName: "leaf.fill"),
        Region(name: "Shattered Realms", color: .red, imageName: "flame.fill"),
        Region(name: "Shattered Realms", color: .blue, imageName: "snowflake"),
        Region(name: "Shattered Realms", color: .gray, imageName: "shield.fill"),
        Region(name: "Shattered Realms", color: .yellow, imageName: "gearshape.fill")
    ]
    
    // Переменная для анимации
    @State private var selectedRegionIndex = 0
    @State private var fadeIn = false
    @State private var progress: CGFloat = 0.0
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            // Заменяем градиент фоновым изображением
            Image("loadpage") // Убедитесь, что изображение добавлено в Assets.xcassets
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 40) {
                // Название региона и изображение
                Text(regions[selectedRegionIndex].name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .transition(.opacity)
                    .animation(.easeInOut, value: selectedRegionIndex)
                
                Image(systemName: regions[selectedRegionIndex].imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.red)
                    .opacity(fadeIn ? 1.0 : 0.0)
                    .animation(.easeIn(duration: 1.5), value: fadeIn)
                
                // Прогресс загрузки
                ProgressView(value: progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .white))
                    .frame(width: 200)
            }
        }
        .onAppear {
            startLoading()
        }
    }
    
    // Метод для циклической смены регионов
    func startLoading() {
        // Таймер для смены регионов каждые 4 секунды
        timer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { _ in
            fadeIn.toggle()
            selectedRegionIndex = (selectedRegionIndex + 1) % regions.count
        }
        
        // Таймер для прогресса загрузки (20 секунд)
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if progress < 1.0 {
                progress += 0.005 // 1.0 за 20 секунд
            } else {
                timer.invalidate() // Остановить таймер по завершении
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
