import SwiftUI



struct SwiftUIView: View {
    @State private var goal: String = "" // State variable for the TextField input
    @State private var selectedTimeframe: String? = nil // State variable for selected button

    var body: some View {
        VStack {
            // Circle with fire emoji
            ZStack {
                Circle()
                    .fill(Color.accentColor) // Circle with accent color
                    .frame(width: 150, height: 150)

                Text("🔥")
                    .font(.system(size: 70))
            }
            .padding(.top, 90) // Adjust the top padding

            // Text aligned to the left
            HStack {
                VStack(alignment: .leading) {
                    Text("Hello learner!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)

                    Text("This app will help you learn everyday")
                        .font(.title3) // Smaller font size
                        .foregroundColor(.gray) // Gray text color
                }
                .padding(.leading, 20)

                Spacer() // Push the text to the left side
            }
            .padding(.top, 20)
          
            VStack(alignment: .leading, spacing: 8) {
                // Label above the TextField
                Text("I want to learn")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)

                HStack {
                    // TextField with gray placeholder and white text
                    TextField("", text: $goal)
                        .modifier(PlaceholderStyle(showPlaceholder: goal.isEmpty, placeholder: "Swift"))
                        .padding(.vertical, 10)
                        .background(Color.clear) // Transparent background
                        .tint(.orange) // Orange cursor and selection color
                }
                .padding(.horizontal, 20)
                .overlay(
                    Rectangle() // Underline
                        .frame(height: 1)
                        .foregroundColor(Color.accentColor),
                    alignment: .bottom
                )

                // Text above the buttons
                Text("I want to learn it in a")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                
                // Timeframe selection buttons
                HStack {
                    ForEach(["Week", "Month", "Year"], id: \.self) { timeframe in
                        Button(action: {
                            selectedTimeframe = timeframe // Update selected button
                        }) {
                            Text(timeframe)
                                .font(.title3)
                                .foregroundColor(selectedTimeframe == timeframe ? .black : .orange) // Black text for selected button
                                .padding(.vertical, 8) // Reduced vertical padding
                                .padding(.horizontal, 16) // Reduced horizontal padding
                                .background(selectedTimeframe == timeframe ? Color.orange : Color.accentColor) // Solid background color
                                .cornerRadius(8) // Rounded corners
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.top, 30) // Adjust the space between the text and TextField

            Spacer() // Push everything upwards
            
            // Start Button at the bottom
            Button(action: {
                // Action when "Start" is tapped
                print("Start button tapped")
            }) {
                HStack {
                    Text("Start")
                        .font(.title3)
                        .bold()
                    
                    Image(systemName: "arrow.right") // Arrow pointing to the right
                        .font(.title3)
                }
                .foregroundColor(.black) // White text and arrow
                .padding(.vertical, 17) // Increased vertical padding for height
                .padding(.horizontal, 50) // Increased horizontal padding for width
                .background(Color.orange) // Orange background
                .cornerRadius(8) // Rounded corners for the button
            }
            .padding(.bottom, 150) // Lift the button up a bit from the bottom
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black) // Black background
        .ignoresSafeArea() // Extend background to safe areas
    }
}

#Preview {
    SwiftUIView()
}


