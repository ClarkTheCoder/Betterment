import SwiftUI
import FirebaseAuth

enum Theme {
    static let primary = Color("Primary")
}

struct ContentView: View {
    @State private var userIsLoggedIn = false
    
    var body: some View {
        if userIsLoggedIn {
            HomeView()
        } else {
            LoginView(userIsLoggedIn: $userIsLoggedIn)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
