import SwiftUI

struct DisclaimerView: View {
    let onAccept: () -> Void

    var body: some View {
        NavigationStack {
            ScrollView {
                DisclaimerContent()
                    .padding()
            }
            .safeAreaInset(edge: .bottom) {
                Button(action: onAccept) {
                    Text("J'ai compris")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .background(.bar)
            }
            .navigationTitle("Bienvenue")
        }
    }
}

struct DisclaimerContent: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 12) {
                Image(systemName: "moon.stars.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.indigo)
                    .accessibilityHidden(true)
                Text("Apnée du sommeil : comprendre et agir")
                    .font(.title2.weight(.bold))
            }

            Text("Cette application d'information est destinée aux patients et à leur entourage. Elle a pour objectif de vous aider à comprendre l'apnée du sommeil, son diagnostic, ses traitements et la vie au quotidien avec la maladie.")

            CalloutView(kind: .important, text: "Les informations proposées ne remplacent en aucun cas une consultation médicale, un diagnostic ou un traitement prescrit par un professionnel de santé. En cas de doute ou de symptômes, consultez votre médecin.")

            VStack(alignment: .leading, spacing: 8) {
                Text("Nos engagements")
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
                BulletList(items: [
                    "Les contenus sont rédigés à partir des publications d'organismes institutionnels français : Assurance Maladie, Haute Autorité de Santé, Inserm, Santé publique France, Fédération Française de Cardiologie, Légifrance et Sécurité routière.",
                    "Les sources sont indiquées à la fin de chaque chapitre et dans l'onglet Sources.",
                    "Les questionnaires (Epworth, STOP-Bang) sont des outils d'orientation : ils ne permettent pas de poser un diagnostic.",
                    "Aucune donnée personnelle n'est collectée ni transmise : vos réponses restent sur votre iPhone."
                ], tint: .indigo)
            }

            CalloutView(kind: .warning, text: "En cas d'urgence (douleur thoracique, difficulté respiratoire brutale, malaise), appelez le 15 ou le 112.")
        }
    }
}

#Preview {
    DisclaimerView(onAccept: {})
}
