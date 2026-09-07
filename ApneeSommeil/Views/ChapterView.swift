import SwiftUI

struct ChapterView: View {
    let chapter: Chapter

    private var sources: [Source] { Sources.sources(for: chapter) }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                header

                ForEach(Array(chapter.blocks.enumerated()), id: \.offset) { _, block in
                    ContentBlockView(block: block, tint: chapter.tint)
                }

                if !sources.isEmpty {
                    sourcesSection
                }

                navigationFooter
            }
            .padding()
        }
        .navigationTitle(chapter.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(systemName: chapter.systemImage)
                .font(.system(size: 36))
                .foregroundStyle(chapter.tint)
                .accessibilityHidden(true)
            Text(chapter.title)
                .font(.largeTitle.weight(.bold))
                .accessibilityAddTraits(.isHeader)
            Text(chapter.subtitle)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .padding(.bottom, 8)
    }

    private var sourcesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Divider().padding(.vertical, 8)
            Text("Sources")
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            ForEach(sources) { source in
                if let url = source.url {
                    Link(destination: url) {
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "arrow.up.right.square")
                                .foregroundStyle(chapter.tint)
                                .accessibilityHidden(true)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(source.organisation)
                                    .font(.subheadline.weight(.semibold))
                                    .foregroundStyle(.primary)
                                Text(source.title)
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var navigationFooter: some View {
        if let index = Chapters.all.firstIndex(of: chapter), index + 1 < Chapters.all.count {
            let next = Chapters.all[index + 1]
            NavigationLink(value: next) {
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Chapitre suivant")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Text(next.title)
                            .font(.headline)
                            .foregroundStyle(.primary)
                    }
                    Spacer()
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.title2)
                        .foregroundStyle(next.tint)
                        .accessibilityHidden(true)
                }
                .padding()
                .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
            }
            .buttonStyle(.plain)
            .padding(.top, 16)
        }
    }
}

#Preview {
    NavigationStack {
        ChapterView(chapter: Chapters.understanding)
    }
}
