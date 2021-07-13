//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Duong Mai on 13/07/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                CityTextView(cityName: "Hanoi, Vietnam")
                CurrentWeatherStatusView(
                    imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 30
                )
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 31)
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 36)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind", temperature: 26)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 27)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temperature: 10)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                }label:{
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        
        VStack{
            Text(dayOfWeek)
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°")
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    isNight ? .black : .blue,
                    isNight ? .gray : Color("lightBlue")]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherStatusView: View {
    var imageName: String
    var temperature: Int
        
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    var title:String
    var textColor: Color
    var backgroundColor: Color
        
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .medium))
            .cornerRadius(10, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}
