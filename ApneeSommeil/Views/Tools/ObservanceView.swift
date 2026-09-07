import SwiftUI

/// Calcul de l'observance de la PPC sur une période de 28 jours.
struct ObservanceView: View {
    @State private var hoursPerNight: Double = 5
    @State private var nightsUsed: Double = 26

    private let periodDays = 28
    private let target: Double = 112
    private let tolerance: Double = 56

    private var totalHours: Double { hoursPerNight * nightsUsed }

    private enum Level {
        case good, tolerated, insufficient

        var color: Color {
            switch self {
            case .good: return .green
            case .tolerated: return .orange
            case .insufficient: return .red
            }
        }

        var title: String {
            switch self {
            case .good: return "Objectif atteint"
            case .tolerated: return "Zone de tolérance"
            case .insufficient: return "Observance insuffisante"
            }
        }

        var message: String {
            switch self {
            case .good:
                return "Vous utilisez votre PPC au moins 112 heures par période de 28 jours, soit 4 heures par nuit en moyenne. C'est le seuil retenu pour la prise en charge par l'Assurance Maladie. Plus vous portez l'appareil longtemps chaque nuit, plus les bénéfices sont importants : l'idéal est toute la nuit, toutes les nuits."
            case .tolerated:
                return "Vous êtes entre 56 et 112 heures sur 28 jours. Cette zone est tolérée temporairement, mais l'efficacité du traitement est réduite. Identifiez ce qui vous gêne (masque, sécheresse, bruit, fuites) et parlez-en à votre prestataire ou à votre médecin : des solutions existent."
            case .insufficient:
                return "Vous êtes en dessous de 56 heures sur 28 jours. À ce niveau, le traitement est considéré comme peu efficace et sa prise en charge peut être remise en cause. Ne renoncez pas : contactez rapidement votre prestataire et votre médecin pour adapter le masque, les réglages ou envisager une alternative."
            }
        }
    }

    private var level: Level {
        if totalHours >= target { return .good }
        if totalHours >= tolerance { return .tolerated }
        return .insufficient
    }

    var body: some View {
        List {
            Section {
                Text("L'Assurance Maladie apprécie l'observance de la PPC par périodes de 28 jours : l'objectif est d'au moins 112 heures d'utilisation, soit 4 heures par nuit en moyenne. Estimez votre utilisation ci-dessous ; votre appareil ou votre prestataire vous fournissent les valeurs exactes.")
                    .font(.subheadline)
            }

            Section("Votre utilisation") {
                VStack(alignment: .leading, spacing: 6) {
                    LabeledContent("Durée moyenne par nuit", value: formattedHours(hoursPerNight))
                    Slider(value: $hoursPerNight, in: 0...10, step: 0.5) {
                        Text("Durée moyenne par nuit")
                    }
                }
                VStack(alignment: .leading, spacing: 6) {
                    LabeledContent("Nuits avec l'appareil sur 28", value: "\(Int(nightsUsed))")
                    Slider(value: $nightsUsed, in: 0...28, step: 1) {
                        Text("Nuits avec l'appareil")
                    }
                }
            }

            Section {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Total sur 28 jours")
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.secondary)
                        Spacer()
                        Text("\(Int(totalHours.rounded())) h")
                            .font(.title.weight(.bold))
                            .foregroundStyle(level.color)
                            .monospacedDigit()
                    }
                    ProgressView(value: min(totalHours, target), total: target)
                        .tint(level.color)
                    HStack {
                        Text("0 h")
                        Spacer()
                        Text("56 h")
                        Spacer()
                        Text("112 h")
                    }
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    Text(level.title)
                        .font(.headline)
                        .foregroundStyle(level.color)
                    Text(level.message)
                        .font(.body)
                }
                .padding(.vertical, 4)
                .accessibilityElement(children: .combine)
                MedicalNotice()
            } header: {
                Text("Résultat")
            } footer: {
                Text("Seuils fixés par l'arrêté du 13 décembre 2017 (liste des produits et prestations remboursables). Les données d'observance officielles sont celles enregistrées par votre appareil et transmises par votre prestataire.")
            }
        }
        .navigationTitle("Observance de la PPC")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func formattedHours(_ hours: Double) -> String {
        let whole = Int(hours)
        let half = hours - Double(whole) >= 0.5
        return half ? "\(whole) h 30" : "\(whole) h"
    }
}

#Preview {
    NavigationStack {
        ObservanceView()
    }
}
