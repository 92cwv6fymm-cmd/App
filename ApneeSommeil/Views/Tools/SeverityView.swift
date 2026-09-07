import SwiftUI

/// Aide à la lecture de l'indice d'apnées–hypopnées (IAH).
struct SeverityView: View {
    @State private var iah: Double = 12
    @State private var sleepHours: Double = 7

    private var severity: ApneaSeverity { ApneaSeverity.from(iah: iah) }
    private var eventsPerNight: Int { Int((iah * sleepHours).rounded()) }

    var body: some View {
        List {
            Section {
                Text("L'IAH est le nombre d'apnées et d'hypopnées par heure de sommeil. Il figure sur le compte rendu de votre enregistrement du sommeil. Déplacez le curseur pour comprendre à quoi correspond votre valeur.")
                    .font(.subheadline)
            }

            Section("Votre IAH") {
                VStack(spacing: 12) {
                    Text("\(Int(iah.rounded()))")
                        .font(.system(size: 56, weight: .bold, design: .rounded))
                        .foregroundStyle(severity.color)
                        .monospacedDigit()
                        .frame(maxWidth: .infinity)
                    Text("événements par heure de sommeil")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Slider(value: $iah, in: 0...80, step: 1) {
                        Text("Indice d'apnées–hypopnées")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("80")
                    }
                    SeverityScale(current: iah)
                }
                .padding(.vertical, 6)
            }

            Section {
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(severity.title)
                            .font(.headline)
                            .foregroundStyle(severity.color)
                        Spacer()
                        Text(severity.range)
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.secondary)
                    }
                    Text(severity.explanation)
                        .font(.body)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(severity.color.opacity(0.12), in: RoundedRectangle(cornerRadius: 14, style: .continuous))
                .accessibilityElement(children: .combine)
            } header: {
                Text("Interprétation")
            }

            Section {
                Stepper(value: $sleepHours, in: 4...10, step: 0.5) {
                    LabeledContent("Durée de sommeil", value: formattedHours(sleepHours))
                }
                LabeledContent("Événements par nuit", value: "environ \(eventsPerNight)")
                Text("Chaque événement dure au moins 10 secondes et s'accompagne d'une baisse d'oxygène ou d'un micro-éveil. Cela donne une idée de la fragmentation du sommeil.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            } header: {
                Text("Ce que cela représente sur une nuit")
            }

            Section {
                MedicalNotice()
            } footer: {
                Text("Seuils selon l'Assurance Maladie et la HAS (recommandations 2014). La décision de traitement tient aussi compte des symptômes, de la somnolence et des maladies associées : elle appartient à votre médecin.")
            }
        }
        .navigationTitle("Sévérité selon l'IAH")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func formattedHours(_ hours: Double) -> String {
        let whole = Int(hours)
        let half = hours - Double(whole) >= 0.5
        return half ? "\(whole) h 30" : "\(whole) h"
    }
}

/// Barre colorée représentant les quatre zones de sévérité, avec un repère pour la valeur courante.
struct SeverityScale: View {
    let current: Double
    private let maxValue: Double = 80

    var body: some View {
        VStack(spacing: 6) {
            GeometryReader { geo in
                let width = geo.size.width
                ZStack(alignment: .leading) {
                    HStack(spacing: 0) {
                        segment(.none, width: width * 5 / maxValue)
                        segment(.mild, width: width * 10 / maxValue)
                        segment(.moderate, width: width * 15 / maxValue)
                        segment(.severe, width: width * 50 / maxValue)
                    }
                    .clipShape(Capsule())
                    Circle()
                        .fill(.white)
                        .overlay(Circle().stroke(Color.primary.opacity(0.4), lineWidth: 1))
                        .frame(width: 14, height: 14)
                        .offset(x: max(0, min(width - 14, width * current / maxValue - 7)))
                        .shadow(radius: 1)
                }
            }
            .frame(height: 14)
            HStack {
                Text("0").frame(maxWidth: .infinity, alignment: .leading)
                Text("5")
                Spacer()
                Text("15")
                Spacer()
                Text("30")
                Spacer()
                Text("80")
            }
            .font(.caption2)
            .foregroundStyle(.secondary)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Échelle de sévérité, valeur \(Int(current.rounded()))")
    }

    private func segment(_ severity: ApneaSeverity, width: CGFloat) -> some View {
        Rectangle()
            .fill(severity.color.opacity(0.85))
            .frame(width: width)
    }
}

#Preview {
    NavigationStack {
        SeverityView()
    }
}
