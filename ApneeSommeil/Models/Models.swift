import SwiftUI

// MARK: - Chapitres pédagogiques

/// Un chapitre d'information destiné au patient.
struct Chapter: Identifiable, Hashable {
    let id: String
    let title: String
    let subtitle: String
    let systemImage: String
    let tint: Color
    let readingMinutes: Int
    let blocks: [ContentBlock]
    /// Identifiants des sources institutionnelles utilisées (voir `Sources.all`).
    let sourceIDs: [String]

    static func == (lhs: Chapter, rhs: Chapter) -> Bool { lhs.id == rhs.id }
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}

/// Bloc de contenu d'un chapitre. Le texte accepte le Markdown en ligne (gras, italique).
enum ContentBlock {
    case heading(String)
    case paragraph(String)
    case bullets([String])
    case callout(CalloutKind, String)
    case figures([KeyFigure])
}

enum CalloutKind {
    case info, tip, warning, important

    var systemImage: String {
        switch self {
        case .info: return "info.circle.fill"
        case .tip: return "lightbulb.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .important: return "heart.text.square.fill"
        }
    }

    var color: Color {
        switch self {
        case .info: return .blue
        case .tip: return .green
        case .warning: return .orange
        case .important: return .red
        }
    }

    var label: String {
        switch self {
        case .info: return "Bon à savoir"
        case .tip: return "Conseil"
        case .warning: return "Attention"
        case .important: return "Important"
        }
    }
}

/// Chiffre clé mis en avant (valeur + légende).
struct KeyFigure: Identifiable {
    let value: String
    let label: String
    var id: String { value + label }
}

// MARK: - Sources

struct Source: Identifiable {
    let id: String
    let organisation: String
    let title: String
    let urlString: String
    let note: String

    var url: URL? { URL(string: urlString) }
}

// MARK: - Glossaire

struct GlossaryTerm: Identifiable {
    let term: String
    let definition: String
    var id: String { term }
}

// MARK: - Sévérité (IAH)

/// Niveaux de sévérité du SAHOS selon l'indice d'apnées–hypopnées (Ameli / HAS).
enum ApneaSeverity: CaseIterable {
    case none, mild, moderate, severe

    static func from(iah: Double) -> ApneaSeverity {
        switch iah {
        case ..<5: return .none
        case ..<15: return .mild
        case ...30: return .moderate
        default: return .severe
        }
    }

    var title: String {
        switch self {
        case .none: return "Pas de syndrome d'apnées"
        case .mild: return "Apnée du sommeil légère"
        case .moderate: return "Apnée du sommeil modérée"
        case .severe: return "Apnée du sommeil sévère"
        }
    }

    var range: String {
        switch self {
        case .none: return "IAH < 5"
        case .mild: return "IAH de 5 à 15"
        case .moderate: return "IAH de 15 à 30"
        case .severe: return "IAH > 30"
        }
    }

    var color: Color {
        switch self {
        case .none: return .green
        case .mild: return .yellow
        case .moderate: return .orange
        case .severe: return .red
        }
    }

    var explanation: String {
        switch self {
        case .none:
            return "Moins de 5 apnées ou hypopnées par heure de sommeil : l'enregistrement ne montre pas de syndrome d'apnées du sommeil. Si des symptômes persistent, d'autres causes de fatigue ou de somnolence doivent être recherchées avec votre médecin."
        case .mild:
            return "Entre 5 et 15 événements par heure. Le traitement repose d'abord sur les mesures d'hygiène de vie (perte de poids, position de sommeil, arrêt de l'alcool le soir et des sédatifs). Une orthèse ou une PPC peuvent être discutées selon les symptômes et les maladies associées."
        case .moderate:
            return "Entre 15 et 30 événements par heure. Selon la HAS, l'orthèse d'avancée mandibulaire est recommandée en première intention en l'absence de maladie cardiovasculaire grave. La PPC est recommandée d'emblée si le sommeil est très fragmenté (au moins 10 micro-éveils par heure) ou en cas de maladie cardiovasculaire grave associée."
        case .severe:
            return "Plus de 30 événements par heure. La PPC est le traitement recommandé en première intention par la HAS. L'orthèse d'avancée mandibulaire est une alternative en cas de refus ou d'intolérance à la PPC."
        }
    }
}
