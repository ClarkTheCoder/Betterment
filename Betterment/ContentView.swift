import SwiftUI

struct ContentView: View {
    @ObservedObject var dateViewModel = DateViewModel()

    var body: some View {
        VStack {
            // Display the formatted last saved date
            Text(dateViewModel.lastSavedDateFormatted)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
            
            // Button to save the current date
            Button("Save Current Date") {
                dateViewModel.saveCurrentDate()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)

            // Button to show the elapsed time since the last saved date
            Button("Show Time Since Last Saved Date") {
                // This button's action will trigger an update in the ViewModel that's shown on the UI
                let elapsed = dateViewModel.timeSinceLastSavedDate()
                dateViewModel.lastSavedDateFormatted = elapsed
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .onAppear {
            dateViewModel.loadSavedDate()  // Load the last saved date when the view appears
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
