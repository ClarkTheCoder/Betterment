import SwiftUI

enum Theme {
    static let primary = Color("Primary")
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}