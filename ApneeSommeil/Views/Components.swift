import SwiftUI

/// Texte acceptant le Markdown en ligne (gras, italique, liens).
struct MarkdownText: View {
    let text: String

    init(_ text: String) { self.text = text }

    var body: some View {
        Text(attributed)
    }

    private var attributed: AttributedString {
        let options = AttributedString.MarkdownParsingOptions(interpretedSyntax: .inlineOnlyPreservingWhitespace)
        return (try? AttributedString(markdown: text, options: options)) ?? AttributedString(text)
    }
}

/// Encadré coloré : conseil, information, avertissement.
struct CalloutView: View {
    let kind: CalloutKind
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: kind.systemImage)
                .font(.title3)
                .foregroundStyle(kind.color)
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 4) {
                Text(kind.label)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(kind.color)
                MarkdownText(text)
                    .font(.body)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(kind.color.opacity(0.12), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        .accessibilityElement(children: .combine)
    }
}

/// Grille de chiffres clés.
struct KeyFiguresView: View {
    let figures: [KeyFigure]
    let tint: Color

    private let columns = [GridItem(.adaptive(minimum: 110), spacing: 10)]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(figures) { figure in
                VStack(spacing: 4) {
                    Text(figure.value)
                        .font(.title2.weight(.bold))
                        .foregroundStyle(tint)
                        .minimumScaleFactor(0.6)
                        .lineLimit(1)
                    Text(figure.label)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .padding(.horizontal, 8)
                .background(tint.opacity(0.1), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
                .accessibilityElement(children: .combine)
            }
        }
    }
}

/// Liste à puces.
struct BulletList: View {
    let items: [String]
    let tint: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(Array(items.enumerated()), id: \.offset) { _, item in
                HStack(alignment: .top, spacing: 10) {
                    Circle()
                        .fill(tint)
                        .frame(width: 7, height: 7)
                        .padding(.top, 7)
                        .accessibilityHidden(true)
                    MarkdownText(item)
                }
            }
        }
    }
}

/// Rendu d'un bloc de contenu.
struct ContentBlockView: View {
    let block: ContentBlock
    let tint: Color

    var body: some View {
        switch block {
        case .heading(let text):
            Text(text)
                .font(.title3.weight(.semibold))
                .padding(.top, 8)
                .accessibilityAddTraits(.isHeader)
        case .paragraph(let text):
            MarkdownText(text)
                .font(.body)
                .lineSpacing(3)
        case .bullets(let items):
            BulletList(items: items, tint: tint)
        case .callout(let kind, let text):
            CalloutView(kind: kind, text: text)
        case .figures(let figures):
            KeyFiguresView(figures: figures, tint: tint)
        }
    }
}

/// Carte de résultat pour les outils (score, interprétation).
struct ResultCard: View {
    let title: String
    let value: String
    let color: Color
    let message: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(title)
                    .font(.subheadline.weight(.semibold))
                    .foregroundStyle(.secondary)
                Spacer()
                Text(value)
                    .font(.title.weight(.bold))
                    .foregroundStyle(color)
            }
            Text(message)
                .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(color.opacity(0.12), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
        .accessibilityElement(children: .combine)
    }
}

/// Rappel affiché sous chaque outil.
struct MedicalNotice: View {
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "stethoscope")
                .foregroundStyle(.secondary)
                .accessibilityHidden(true)
            Text("Cet outil est fourni à titre d'information. Il ne permet pas de poser un diagnostic et ne remplace pas l'avis de votre médecin.")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
    }
}
