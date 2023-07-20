//
//  ContentView.swift
//  Myweatherapp
//
//  Created by Fatimah Hussain on 7/19/22.
//

import SwiftUI


//Challenge 1: Create a white and blue gradient background with topLeading and bottomTrailing
struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : .white)
            //extract into subview and crete mainweatherdayview, have parameter called mainIcon that has value of String, then use "cloud.sun.fill" if isnight is false, or else do "moon.starts.fill" if isnight is true
            VStack {
                MainWeatherDayView()
                .padding(.bottom, 40)
                
                HStack(spacing:20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.drizzle.fill", temperature: 85)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.bolt.fill", temperature: 71)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.moon.rain.fill", temperature: 92)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.drizzle.fill", temperature: 65)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "sun.max.fill", temperature: 60)
                    //Challenge: print 5 mainweatherdayviews
                    // for imageNmae, you can do "sun.max.fill", "wind.snow", "snow", "sunset.fill"sf
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label : {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                    // create a fram eof width 280 and height 50 and a background of white color  and a font size of 20, bold weight, and default design  and a corner radius of 10
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
//
    var body: some View {
        VStack {
            Text("\(dayOfWeek)")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: "\(imageName)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            


            //CHallenge: change font size to 16, medium weight, and default design.
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(colors: [topColor, bottomColor], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MainWeatherDayView: View {
    var body: some View {
        
        Text("San Ramon, CA")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        
        VStack(spacing:10){
            Image(systemName: "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode:.fit)
                .frame(width: 180, height: 180)
            
            Text("85°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            //Challenge #2: make the temperauture text a size of 70, weight medium, no design parameter and font color is white, then add "cloud.sun.fill" icon using Image(), make rendering mode original, make it resizeable, make aspect ratio fit contentmode, and frame of 40 x 40
        }
    }
}
