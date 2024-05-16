import SwiftUI

struct ContentView: View {
    @ObservedObject var dateViewModel = DateViewModel()

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
                            .stroke(Color.black.opacity(0.2), lineWidth: 2)
                        )
            } else {
                Text("No elapsed time available.")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.clear)
                    .overlay(
                        Circle()
                            .stroke(Color.black.opacity(0.2), lineWidth: 2)
                        )
            }
            Spacer()
            // Button to save the current date
            Button("Begin Journey") {
                dateViewModel.saveCurrentDate()
            }
            .padding()
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(8)
            
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
    }
}
