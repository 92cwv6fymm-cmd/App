import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    introCard
                    Text("Les chapitres")
                        .font(.title2.weight(.bold))
                        .accessibilityAddTraits(.isHeader)
                    LazyVStack(spacing: 12) {
                        ForEach(Chapters.all) { chapter in
                            NavigationLink(value: chapter) {
                                ChapterCard(chapter: chapter)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Apnée du sommeil")
            .navigationDestination(for: Chapter.self) { chapter in
                ChapterView(chapter: chapter)
            }
        }
    }

    private var introCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 12) {
                Image(systemName: "moon.stars.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .accessibilityHidden(true)
                VStack(alignment: .leading, spacing: 2) {
                    Text("Comprendre pour mieux se soigner")
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text("Informations issues des sites institutionnels français")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.85))
                }
            }
            Text("Cette application vous explique ce qu'est l'apnée du sommeil, comment elle se diagnostique et se traite, et comment bien vivre avec au quotidien.")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.95))
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(colors: [.indigo, .blue], startPoint: .topLeading, endPoint: .bottomTrailing),
            in: RoundedRectangle(cornerRadius: 18, style: .continuous)
        )
        .accessibilityElement(children: .combine)
    }
}

struct ChapterCard: View {
    let chapter: Chapter

    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: chapter.systemImage)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 50, height: 50)
                .background(chapter.tint, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 4) {
                Text(chapter.title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.leading)
                Text(chapter.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                Label("\(chapter.readingMinutes) min de lecture", systemImage: "clock")
                    .font(.caption)
                    .foregroundStyle(.tertiary)
            }
            Spacer(minLength: 0)
            Image(systemName: "chevron.right")
                .font(.footnote.weight(.semibold))
                .foregroundStyle(.tertiary)
                .accessibilityHidden(true)
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    HomeView()
}
