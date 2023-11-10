import SwiftUI

@main
struct DogWeLoveApp: App {
    @StateObject var dataManager = DataManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataManager.context)
                .environmentObject(dataManager)
        }
    }
}
