import SwiftUI

struct ContentView: View {
    @ObservedObject var dateViewModel = DateViewModel()

    var body: some View {
        VStack {
            // Display the elapsed time
            if let elapsedTime = dateViewModel.timeElapsedDisplay {
                Text(elapsedTime)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            } else {
                Text("No elapsed time available.")
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
            
            // Button to save the current date
            Button("Begin Journey") {
                dateViewModel.saveCurrentDate()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
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
