//
//  ContentView.swift
//  GridSwipe
//
//  Created by uwa on 09/06/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

#Preview {
    ContentView()
}


struct Home: View {
    @State var index = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("STAT")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                
                Spacer(minLength: 0)
            }
            .padding(.horizontal)
            
            HStack(spacing: 0, content: {
                Text("Day")
                    .foregroundColor(self.index == 0 ? .white : Color.blue.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color.blue.opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 0
                        }
                        
                    }
                Spacer(minLength: 0)
                Text("Week")
                    .foregroundColor(self.index == 1 ? .white : Color.blue.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color.blue.opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 1
                        }
                        
                    }
                Spacer(minLength: 0)
                Text("Month")
                    .foregroundColor(self.index == 2 ? .white : Color.blue.opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color.blue.opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default) {
                            self.index = 2
                        }
                        
                    }
            })
            .background(Color.black.opacity(0.06))
            .clipShape(Capsule())
            .padding(.horizontal)
            .padding(.top, 25)
            // DashBoard Grid....
            // Tab View With Swipe Gestures...
            TabView(selection: self.$index) {
                GridView(fitnessData: fit_data)
                    .tag(0)
                GridView(fitnessData: week_fit_data)
                    .tag(1)
                GridView(fitnessData: month_fit_data)
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Spacer(minLength: 0)
                
        }
        .padding(.top)
    }
}


// Grid View

struct GridView: View {
    var fitnessData: [Fitness]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30, content: {
            ForEach(fitnessData) { fitness in
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                    VStack(alignment: .leading, content: {
                        Text(fitness.title)
                            .foregroundColor(.white)
                        Text(fitness.data)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 10)
                        
                        HStack {
                            Spacer(minLength: 0)
                            Text(fitness.suggest)
                                .foregroundColor(.white)
                        }
                    })
                    .padding()
                    .background(Color(fitness.image))
                    .cornerRadius(20)
                    // Shadow...
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    // Top Image...
                    
//                        Image(fitness.image)
//                            .renderingMode(.template)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.white.opacity(0.35))
//                            .clipShape(Circle())
                })
                
            }
        })
        .padding(.top, 25)
        .padding(.horizontal)
    }
}

// DashBoard Grid Model Data...

struct Fitness: Identifiable {
    var id: Int
    var title: String
    var image: String
    var data: String
    var suggest: String
}

// Daily
var fit_data = [
    Fitness(id: 0, title: "Heart Rate", image: "heart", data: "124 bpm", suggest: "80-120\nHealthy"),
    Fitness(id: 1, title: "Sleep", image: "sleep", data: "6h 43m", suggest: "Deep Sleep\n6h 13m"),
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "583 kcal", suggest: "Daily Goal\n900 kcal"),
    Fitness(id: 3, title: "Steps", image: "steps", data: "16,741", suggest: "Daily Goal\n20,000 Steps"),
    Fitness(id: 4, title: "Running", image: "running", data: "5.3 km", suggest: "Daily Goal\n10 km"),
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "15.3 km", suggest: "Daily Goal\n20 km")
]


// Weekly
var week_fit_data = [
    Fitness(id: 0, title: "Heart Rate", image: "heart", data: "84 bpm", suggest: "80-120\nHealthy"),
    Fitness(id: 1, title: "Sleep", image: "sleep", data: "43h 23m", suggest: "Deep Sleep\n26h 13m"),
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "3,500 kcal", suggest: "Weekly Goal\n4,800 kcal"),
    Fitness(id: 3, title: "Steps", image: "steps", data: "17,8741", suggest: "Weekly Goal\n25,0000 Steps"),
    Fitness(id: 4, title: "Running", image: "running", data: "45.3 km", suggest: "Weekly Goal\n10 km"),
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "15.3 km", suggest: "Weekly Goal\n120 km")
]


// Monthly
var month_fit_data = [
    Fitness(id: 0, title: "Heart Rate", image: "heart", data: "184 bpm", suggest: "80-120\nHealthy"),
    Fitness(id: 1, title: "Sleep", image: "sleep", data: "143h 23m", suggest: "Deep Sleep\n126h 13m"),
    Fitness(id: 2, title: "Energy Burn", image: "energy", data: "3,5000 kcal", suggest: "Monthly Goal\n4,800 kcal"),
    Fitness(id: 3, title: "Steps", image: "steps", data: "17,87415", suggest: "Monthly Goal\n25,00000 Steps"),
    Fitness(id: 4, title: "Running", image: "running", data: "455.3 km", suggest: "Monthly Goal\n100 km"),
    Fitness(id: 5, title: "Cycling", image: "cycle", data: "1555.3 km", suggest: "Monthly Goal\n120 km")
]
