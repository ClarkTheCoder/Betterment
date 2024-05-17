import SwiftUI

enum Theme {
    static let primary = Color("Primary")
    
}

struct ContentView: View {
    @ObservedObject var dateViewModel = DateViewModel()
    @Environment(\.colorScheme) var colorScheme
    var quoteEngine = QuoteEngine();

    var body: some View {
        VStack {
            // Display the elapsed time
            Spacer()
            if let elapsedTime = dateViewModel.timeElapsedDisplay {
                Text(elapsedTime)
                    .padding()
                    .frame(width: 280, height: 280, alignment: .center)
                    .background(Color.clear)
                    .font(.largeTitle)
                    .overlay(
                        Circle()
                            .stroke(Theme.primary, lineWidth: 2)
                        )
                    .foregroundColor(Theme.primary)
            } else {
                Text("no elapsed time available.")
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
            Button(action: {
                dateViewModel.saveCurrentDate()
            }) {
                Text("Begin Journey")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(colorScheme == .dark ? Color.white : Theme.primary)
                    .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                    .cornerRadius(12)
            }
            .frame(minWidth: 200)
            
            Text(quoteEngine.displayQuote())
                .italic()
                .padding()
                .foregroundStyle(colorScheme == .dark ? Color.gray : Color.black)
            Spacer()
            
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
