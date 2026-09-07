import SwiftUI

/// Questionnaire de dépistage STOP-Bang (Chung et al.), version française actualisée.
struct StopBangView: View {
    struct Item: Identifiable {
        let id: String
        let letter: String
        let question: String
        let detail: String
        let isStop: Bool
    }

    static let items: [Item] = [
        Item(id: "S", letter: "S", question: "Ronflez-vous fort ?", detail: "Assez fort pour être entendu à travers une porte fermée, ou pour que votre conjoint vous donne des coups de coude la nuit.", isStop: true),
        Item(id: "T", letter: "T", question: "Êtes-vous souvent fatigué ou somnolent dans la journée ?", detail: "Par exemple, vous vous endormez en conduisant ou en parlant à quelqu'un.", isStop: true),
        Item(id: "O", letter: "O", question: "Quelqu'un a-t-il observé que vous arrêtez de respirer, ou que vous suffoquez, pendant votre sommeil ?", detail: "Pauses respiratoires ou sensations d'étouffement remarquées par l'entourage.", isStop: true),
        Item(id: "P", letter: "P", question: "Avez-vous, ou êtes-vous traité pour, une hypertension artérielle ?", detail: "Pression artérielle élevée, traitée ou non.", isStop: true),
        Item(id: "B", letter: "B", question: "Votre IMC est-il supérieur à 35 kg/m² ?", detail: "L'indice de masse corporelle se calcule en divisant le poids (kg) par la taille (m) au carré.", isStop: false),
        Item(id: "A", letter: "A", question: "Avez-vous plus de 50 ans ?", detail: "", isStop: false),
        Item(id: "N", letter: "N", question: "Avez-vous un tour de cou important ?", detail: "Mesuré au niveau de la pomme d'Adam : 43 cm ou plus chez l'homme, 41 cm ou plus chez la femme.", isStop: false),
        Item(id: "G", letter: "G", question: "Êtes-vous de sexe masculin ?", detail: "", isStop: false)
    ]

    @State private var answers: [String: Bool] = [:]

    private var score: Int { answers.values.filter { $0 }.count }
    private var stopScore: Int {
        Self.items.filter { $0.isStop && (answers[$0.id] ?? false) }.count
    }
    private var isComplete: Bool { answers.count == Self.items.count }

    var body: some View {
        List {
            Section {
                Text("Répondez par oui ou par non à chacune des 8 questions. Chaque réponse « oui » vaut 1 point.")
                    .font(.subheadline)
            }

            Section("STOP : symptômes") {
                ForEach(Self.items.filter { $0.isStop }) { item in
                    row(for: item)
                }
            }

            Section("Bang : caractéristiques") {
                ForEach(Self.items.filter { !$0.isStop }) { item in
                    row(for: item)
                }
            }

            Section {
                if isComplete {
                    ResultCard(title: "Score STOP-Bang",
                               value: "\(score) / 8",
                               color: risk.color,
                               message: risk.message)
                } else {
                    Text("Répondez aux 8 questions pour obtenir votre score (\(answers.count) / 8).")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                MedicalNotice()
            } header: {
                Text("Résultat")
            } footer: {
                Text("Interprétation : 0 à 2 = risque faible ; 3 à 4 = risque intermédiaire ; 5 à 8 = risque élevé. Le risque est également considéré comme élevé avec au moins 2 réponses positives aux questions STOP associées au sexe masculin, à un IMC supérieur à 35 ou à un tour de cou important.")
            }

            if !answers.isEmpty {
                Section {
                    Button("Recommencer", role: .destructive) {
                        withAnimation { answers = [:] }
                    }
                }
            }
        }
        .navigationTitle("STOP-Bang")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func row(for item: Item) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 10) {
                Text(item.letter)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 28, height: 28)
                    .background(item.isStop ? Color.orange : Color.blue, in: Circle())
                    .accessibilityHidden(true)
                VStack(alignment: .leading, spacing: 3) {
                    Text(item.question)
                        .font(.body)
                    if !item.detail.isEmpty {
                        Text(item.detail)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            Picker(item.question, selection: binding(for: item.id)) {
                Text("Non").tag(Optional(false))
                Text("Oui").tag(Optional(true))
            }
            .pickerStyle(.segmented)
            .labelsHidden()
        }
        .padding(.vertical, 4)
    }

    private func binding(for id: String) -> Binding<Bool?> {
        Binding(
            get: { answers[id] },
            set: { newValue in
                if let newValue { answers[id] = newValue } else { answers.removeValue(forKey: id) }
            }
        )
    }

    private var risk: (color: Color, message: String) {
        let male = answers["G"] ?? false
        let highBMI = answers["B"] ?? false
        let neck = answers["N"] ?? false
        let refinedHigh = stopScore >= 2 && (male || highBMI || neck)

        if score >= 5 || refinedHigh {
            return (.red, "Risque élevé d'apnée obstructive du sommeil. Parlez-en à votre médecin : un enregistrement du sommeil (polygraphie ou polysomnographie) permettra de confirmer ou d'écarter le diagnostic.")
        } else if score >= 3 {
            return (.orange, "Risque intermédiaire d'apnée obstructive du sommeil. Signalez vos symptômes à votre médecin, en particulier si vous ronflez, si vous êtes somnolent la journée ou si vous avez une hypertension.")
        } else {
            return (.green, "Risque faible d'apnée obstructive du sommeil selon ce questionnaire. Il ne s'agit pas d'une garantie : en cas de ronflements importants ou de pauses respiratoires observées, consultez votre médecin.")
        }
    }
}

#Preview {
    NavigationStack {
        StopBangView()
    }
}
