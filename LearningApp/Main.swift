import SwiftUI

struct Main: View {
    @State private var currentDate = Date()
    @State private var streakCount = 10
    @State private var frozenCount = 2
    @State private var totalFreezesUsed = 2
    @State private var logStatus: LogStatus = .logToday
    @State private var selectedDate = Date() // For calendar date selection
    
    enum LogStatus {
        case logToday
        case learnedToday
        case freezedToday
    }

    // Define the freeze limits based on the duration selected by the user
    var freezeLimit: Int {
        return 6 // Example for a month, can be adjusted dynamically
    }

    var body: some View {
        VStack {
            // Header with title and streak tracker
            headerView()

            // Calendar View - Displays the current month and learned/frozen days
            CalendarView(selectedDate: $selectedDate, logStatus: $logStatus, streakCount: $streakCount, frozenCount: $frozenCount)
                .padding()

            // Display streak and freeze counts
            HStack {
                streakCounterView
                freezeCounterView
            }
            .padding()
            .background(Color.black)
            .cornerRadius(15)

            Spacer()

            // Log as Learned Button (Circle)
            logButton

            // Freeze Day Button
            freezeButton

            // Display freeze usage information
            freezeUsageInfo
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }

    
    private func headerView() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Learning Swift")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)

                Text("Wednesday, 11 SEP")
                    .foregroundColor(.gray)
            }

            Spacer()

            // Fire emoji for streak display
            ZStack {
                Circle()
                    .fill(Color.accentColor)
                    .frame(width: 50, height: 50)

                Text("🔥")
                    .font(.system(size: 30))
            }
        }
        .padding()
        .background(Color.black)
    }

    
    private var streakCounterView: some View {
        VStack {
            Text("\(streakCount)")
                .font(.title)
            HStack {
                Text("🔥")
                Text("Day streak")
            }
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }

    
    private var freezeCounterView: some View {
        VStack {
            Text("\(frozenCount)")
                .font(.title)
            HStack {
                Text("🧊")
                Text("Day frozen")
            }
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
    }

   
    private var logButton: some View {
        Button(action: {
            handleLogAction()
        }) {
            Text(buttonTitle)
                .font(.title)
                .bold()
                .frame(width: 250, height: 250)
                .foregroundColor(.black)
                .background(Circle().fill(Color.orange))
        }
        .padding()
    }

    
    private var freezeButton: some View {
        Button(action: {
            handleFreezeAction()
        }) {
            Text("Freeze day")
                .font(.title3)
                .bold()
                .foregroundColor(.blue)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(8)
        }
        .padding(.bottom, 30)
    }

   
    private var freezeUsageInfo: some View {
        Text("\(totalFreezesUsed) out of \(freezeLimit) freezes used")
            .foregroundColor(.gray)
            .padding(.bottom)
    }

   
    private var buttonTitle: String {
        switch logStatus {
        case .logToday:
            return "Log today as Learned"
        case .learnedToday:
            return "Learned today"
        case .freezedToday:
            return "Freezed today"
        }
    }

   
    private func handleLogAction() {
        switch logStatus {
        case .logToday:
            logStatus = .learnedToday
            streakCount += 1
            // Mark the selected date as learned in the calendar
        case .learnedToday:
            break
        case .freezedToday:
            break
        }
    }

  
    private func handleFreezeAction() {
        if totalFreezesUsed < freezeLimit {
            frozenCount += 1
            totalFreezesUsed += 1
            logStatus = .freezedToday
            // Mark the selected date as frozen in the calendar
        }
    }
}


struct CalendarView: View {
    @Binding var selectedDate: Date
    @Binding var logStatus: Main.LogStatus
    @Binding var streakCount: Int
    @Binding var frozenCount: Int

    var body: some View {
        VStack {
            Text("September 2024")
                .foregroundColor(.white)

            // A grid or list of calendar days would go here
            // Each day should be clickable to select it
            // Use SwiftUI's Grid or LazyVGrid to create the days

            // For example purposes, let's show static days
            HStack {
                ForEach(1..<8) { day in
                    VStack {
                        Text("\(day)")
                            .foregroundColor(day == 1 ? Color.orange : Color.white)
                            .padding()
                            .background(day == 1 ? Color.orange.opacity(0.2) : Color.clear)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(10)
    }
}

#Preview {
    Main()
}

