import SwiftUI

struct GlossaryView: View {
    @State private var query = ""

    private var filtered: [GlossaryTerm] {
        let trimmed = query.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return Glossary.terms }
        return Glossary.terms.filter {
            $0.term.localizedCaseInsensitiveContains(trimmed) ||
            $0.definition.localizedCaseInsensitiveContains(trimmed)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                if filtered.isEmpty {
                    ContentUnavailableView.search(text: query)
                } else {
                    ForEach(filtered) { term in
                        VStack(alignment: .leading, spacing: 4) {
                            Text(term.term)
                                .font(.headline)
                            Text(term.definition)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .padding(.vertical, 4)
                        .accessibilityElement(children: .combine)
                    }
                }
            }
            .navigationTitle("Glossaire")
            .searchable(text: $query, prompt: "Rechercher un terme")
        }
    }
}

#Preview {
    GlossaryView()
}
