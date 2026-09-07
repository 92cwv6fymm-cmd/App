import SwiftUI

struct RootView: View {
    @AppStorage("disclaimerAccepted") private var disclaimerAccepted = false

    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Comprendre", systemImage: "book.fill") }

            ToolsView()
                .tabItem { Label("Outils", systemImage: "checklist") }

            GlossaryView()
                .tabItem { Label("Glossaire", systemImage: "character.book.closed.fill") }

            SourcesView()
                .tabItem { Label("Sources", systemImage: "link") }
        }
        .sheet(isPresented: Binding(
            get: { !disclaimerAccepted },
            set: { disclaimerAccepted = !$0 }
        )) {
            DisclaimerView {
                disclaimerAccepted = true
            }
            .interactiveDismissDisabled()
        }
    }
}

#Preview {
    RootView()
}
