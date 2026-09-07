import SwiftUI

/// Échelle de somnolence d'Epworth (Johns, 1991), version française.
struct EpworthView: View {
    static let situations: [String] = [
        "Assis en train de lire",
        "En regardant la télévision",
        "Assis, inactif, dans un lieu public (théâtre, réunion…)",
        "Comme passager d'une voiture (ou d'un transport en commun) roulant sans arrêt pendant une heure",
        "Allongé l'après-midi lorsque les circonstances le permettent",
        "Assis en parlant avec quelqu'un",
        "Assis au calme après un déjeuner sans alcool",
        "Dans une voiture immobilisée depuis quelques minutes dans un embouteillage"
    ]

    struct ScaleItem: Identifiable {
        let value: Int
        let label: String
        var id: Int { value }
    }

    static let scale: [ScaleItem] = [
        ScaleItem(value: 0, label: "Ne somnolerait jamais"),
        ScaleItem(value: 1, label: "Faible chance de s'endormir"),
        ScaleItem(value: 2, label: "Chance moyenne de s'endormir"),
        ScaleItem(value: 3, label: "Forte chance de s'endormir")
    ]

    @State private var answers: [Int?] = Array(repeating: nil, count: 8)

    private var isComplete: Bool { answers.allSatisfy { $0 != nil } }
    private var score: Int { answers.compactMap { $0 }.reduce(0, +) }
    private var answered: Int { answers.compactMap { $0 }.count }

    var body: some View {
        List {
            Section {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Dans chacune des situations suivantes, quelle est la probabilité que vous vous assoupissiez ou que vous vous endormiez ? Répondez selon votre mode de vie récent, même si vous ne vous êtes pas trouvé dans certaines de ces situations.")
                        .font(.subheadline)
                    Text("0 = ne somnolerait jamais · 1 = faible chance · 2 = chance moyenne · 3 = forte chance")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            ForEach(Array(Self.situations.enumerated()), id: \.offset) { index, situation in
                Section {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(index + 1). \(situation)")
                            .font(.body)
                        Picker("Probabilité de s'endormir", selection: $answers[index]) {
                            ForEach(Self.scale) { item in
                                Text("\(item.value)").tag(Optional(item.value))
                            }
                        }
                        .pickerStyle(.segmented)
                        if let value = answers[index] {
                            Text(Self.scale[value].label)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }

            Section {
                if isComplete {
                    ResultCard(title: "Score d'Epworth",
                               value: "\(score) / 24",
                               color: interpretation.color,
                               message: interpretation.message)
                } else {
                    HStack {
                        ProgressView(value: Double(answered), total: 8)
                        Text("\(answered) / 8")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .monospacedDigit()
                    }
                    Text("Répondez aux 8 questions pour obtenir votre score.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                MedicalNotice()
            } header: {
                Text("Résultat")
            } footer: {
                Text("Interprétation habituelle : de 0 à 10, pas de somnolence excessive ; de 11 à 15, somnolence diurne excessive modérée ; de 16 à 24, somnolence sévère. Un score supérieur à 10 oriente vers une exploration du sommeil (Assurance Maladie).")
            }

            if answered > 0 {
                Section {
                    Button("Recommencer", role: .destructive) {
                        withAnimation { answers = Array(repeating: nil, count: 8) }
                    }
                }
            }
        }
        .navigationTitle("Échelle d'Epworth")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var interpretation: (color: Color, message: String) {
        switch score {
        case 0...10:
            return (.green, "Votre score ne montre pas de somnolence diurne excessive. Si vous ronflez fort ou si votre entourage a observé des pauses respiratoires, parlez-en tout de même à votre médecin : l'apnée du sommeil existe aussi sans somnolence marquée.")
        case 11...15:
            return (.orange, "Votre score évoque une somnolence diurne excessive modérée. Une exploration du sommeil est conseillée, surtout si vous présentez des facteurs de risque d'apnée du sommeil (ronflements, surpoids, hypertension). Notez ce score pour votre consultation.")
        default:
            return (.red, "Votre score évoque une somnolence diurne excessive sévère. Consultez votre médecin sans tarder pour en rechercher la cause. Évitez de conduire tant que cette somnolence n'est pas expliquée et prise en charge.")
        }
    }
}

#Preview {
    NavigationStack {
        EpworthView()
    }
}
