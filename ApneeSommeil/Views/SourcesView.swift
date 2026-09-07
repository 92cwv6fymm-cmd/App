import SwiftUI

struct SourcesView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("Le contenu de cette application a été rédigé à partir des informations publiées par les organismes ci-dessous. Touchez une source pour l'ouvrir dans Safari.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                ForEach(Sources.grouped, id: \.organisation) { group in
                    Section(group.organisation) {
                        ForEach(group.sources) { source in
                            SourceRow(source: source)
                        }
                    }
                }

                Section("À propos") {
                    LabeledContent("Version", value: appVersion)
                    LabeledContent("Contenu mis à jour", value: "Septembre 2026")
                    NavigationLink("Avertissement médical") {
                        ScrollView {
                            DisclaimerContent()
                                .padding()
                        }
                        .navigationTitle("Avertissement")
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .navigationTitle("Sources")
        }
    }

    private var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
        return "\(version) (\(build))"
    }
}

struct SourceRow: View {
    let source: Source

    var body: some View {
        if let url = source.url {
            Link(destination: url) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 3) {
                        Text(source.title)
                            .font(.subheadline.weight(.medium))
                            .foregroundStyle(.primary)
                            .multilineTextAlignment(.leading)
                        Text(source.note)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.leading)
                    }
                    Spacer(minLength: 8)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundStyle(.tint)
                        .accessibilityHidden(true)
                }
            }
        } else {
            Text(source.title)
        }
    }
}

#Preview {
    SourcesView()
}
