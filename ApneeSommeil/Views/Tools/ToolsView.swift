import SwiftUI

struct ToolsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Text("Ces outils vous aident à préparer votre consultation et à mieux comprendre vos résultats. Ils ne remplacent pas l'avis de votre médecin.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }

                Section("Questionnaires") {
                    NavigationLink {
                        EpworthView()
                    } label: {
                        ToolRow(title: "Échelle de somnolence d'Epworth",
                                subtitle: "8 questions pour évaluer votre somnolence dans la journée",
                                systemImage: "zzz",
                                tint: .indigo)
                    }
                    NavigationLink {
                        StopBangView()
                    } label: {
                        ToolRow(title: "Questionnaire STOP-Bang",
                                subtitle: "8 questions pour estimer le risque d'apnée du sommeil",
                                systemImage: "questionmark.circle.fill",
                                tint: .orange)
                    }
                }

                Section("Comprendre vos résultats") {
                    NavigationLink {
                        SeverityView()
                    } label: {
                        ToolRow(title: "Sévérité selon l'IAH",
                                subtitle: "Que signifie votre indice d'apnées–hypopnées ?",
                                systemImage: "chart.bar.fill",
                                tint: .blue)
                    }
                    NavigationLink {
                        ObservanceView()
                    } label: {
                        ToolRow(title: "Observance de la PPC",
                                subtitle: "Calculez vos heures d'utilisation sur 28 jours",
                                systemImage: "clock.badge.checkmark.fill",
                                tint: .cyan)
                    }
                }
            }
            .navigationTitle("Outils")
        }
    }
}

struct ToolRow: View {
    let title: String
    let subtitle: String
    let systemImage: String
    let tint: Color

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: systemImage)
                .font(.title3)
                .foregroundStyle(.white)
                .frame(width: 40, height: 40)
                .background(tint, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ToolsView()
}
