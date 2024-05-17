import SwiftUI

enum Theme {
    static let primary = Color("Primary")
    
}

struct ContentView: View {
    @ObservedObject var dateViewModel = DateViewModel()
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            // Display the elapsed time
            Spacer()
            if let elapsedTime = dateViewModel.timeElapsedDisplay {
                Text(elapsedTime)
                    .padding()
                    .frame(width: 270, height: 270, alignment: .center)
                    .background(Color.clear)
                    .overlay(
                        Circle()
                            .stroke(Theme.primary, lineWidth: 2)
                        )
                    .foregroundColor(Theme.primary)
            } else {
                Text("No elapsed time available.")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.clear)
                    .overlay(
                        Circle()
                            .stroke(Theme.primary, lineWidth: 2)
                        )
            }
            Spacer()
            // Button to save the current date
            Button("Begin Journey") {
                dateViewModel.saveCurrentDate()
            }
            .padding()
            .background(colorScheme == .dark ? Color.white : Theme.primary)
            .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
            .cornerRadius(12)
            
            Text("'The difference between someone who fails and someone who succeeds is that the one who succeeds tries one more time.'")
                .italic()
                .padding()
                .foregroundStyle(Color(Color.gray))
        }
        .padding()
        .onAppear {
            dateViewModel.loadSavedDate()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
    }
}
