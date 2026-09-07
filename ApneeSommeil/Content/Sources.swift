import Foundation

/// Sources institutionnelles utilisées pour rédiger le contenu de l'application.
enum Sources {

    static let all: [Source] = [
        Source(id: "ameli-comprendre",
               organisation: "Assurance Maladie (ameli.fr)",
               title: "Comprendre les apnées–hypopnées obstructives du sommeil",
               urlString: "https://www.ameli.fr/assure/sante/themes/apnee-du-sommeil/comprendre-apnee-sommeil",
               note: "Définition, mécanisme, IAH, fréquence, facteurs de risque."),
        Source(id: "ameli-symptomes",
               organisation: "Assurance Maladie (ameli.fr)",
               title: "Symptômes, diagnostic et évolution de l'apnée du sommeil",
               urlString: "https://www.ameli.fr/assure/sante/themes/apnee-du-sommeil/symptomes-diagnostic-evolution",
               note: "Symptômes nocturnes et diurnes, polygraphie, polysomnographie, complications."),
        Source(id: "ameli-traitement",
               organisation: "Assurance Maladie (ameli.fr)",
               title: "Traitement des apnées–hypopnées obstructives du sommeil",
               urlString: "https://www.ameli.fr/assure/sante/themes/apnee-du-sommeil/traitement-apnee-sommeil",
               note: "PPC, orthèse d'avancée mandibulaire, chirurgie, effets indésirables."),
        Source(id: "ameli-vivre",
               organisation: "Assurance Maladie (ameli.fr)",
               title: "Vivre avec une apnée du sommeil",
               urlString: "https://www.ameli.fr/assure/sante/themes/apnee-du-sommeil/vivre-apnee-sommeil",
               note: "Conseils au quotidien, conduite automobile, tests de maintien de l'éveil, voyages."),
        Source(id: "ameli-enfant",
               organisation: "Assurance Maladie (ameli.fr)",
               title: "Apnées du sommeil chez l'enfant",
               urlString: "https://www.ameli.fr/assure/sante/themes/troubles-sommeil-enfant/types-troubles-sommeil",
               note: "Fréquence, causes et traitement chez l'enfant."),
        Source(id: "ameli-asthme",
               organisation: "Assurance Maladie (ameli.fr)",
               title: "Asthme et syndrome d'apnées hypopnées obstructives du sommeil",
               urlString: "https://www.ameli.fr/assure/sante/themes/asthme-adulte/asthme-vivre-maladie/asthme-et-sommeil",
               note: "Liens entre asthme et apnée du sommeil."),
        Source(id: "ameli-accord-prealable",
               organisation: "Assurance Maladie (ameli.fr)",
               title: "Accord préalable pour un traitement de l'apnée du sommeil par PPC ou OAM",
               urlString: "https://www.ameli.fr/medecin/exercice-liberal/accord-prealable/accord-prealable-apnee-sommeil-ppc-oam",
               note: "Conditions de prise en charge, durée des prescriptions, place de l'orthèse."),
        Source(id: "has-reco-2014",
               organisation: "Haute Autorité de Santé (HAS)",
               title: "Apnées du sommeil : de nouvelles recommandations de prise en charge des patients (2014)",
               urlString: "https://www.has-sante.fr/jcms/c_1761160/fr/apnees-du-sommeil-de-nouvelles-recommandations-de-prise-en-charge-des-patients",
               note: "Définition du SAHOS, seuils d'IAH, place respective de la PPC et de l'orthèse."),
        Source(id: "has-bon-usage",
               organisation: "Haute Autorité de Santé (HAS)",
               title: "Fiche de bon usage : SAHOS, place et conditions d'utilisation de la PPC et de l'OAM",
               urlString: "https://www.has-sante.fr/upload/docs/application/pdf/2014-11/sahos_-_fiche_de_bon_usage.pdf",
               note: "Synthèse pratique des recommandations 2014."),
        Source(id: "has-ppc-2026",
               organisation: "Haute Autorité de Santé (HAS)",
               title: "Dispositifs médicaux de PPC et prestations associées dans le SAHOS : rapport d'évaluation",
               urlString: "https://www.has-sante.fr/upload/docs/application/pdf/2026-03/rapport_evaluation_ppc.pdf",
               note: "Évaluation actualisée des dispositifs de PPC et des prestations."),
        Source(id: "has-hypoglosse",
               organisation: "Haute Autorité de Santé (HAS)",
               title: "Endoscopie sous sommeil induit avant la pose du stimulateur du nerf hypoglosse",
               urlString: "https://www.has-sante.fr/jcms/p_3603368/fr/endoscopie-sous-sommeil-induit-avant-la-pose-du-stimulateur-du-nerf-hypoglosse-synthese",
               note: "Indications de la stimulation du nerf hypoglosse."),
        Source(id: "inserm-dossier",
               organisation: "Inserm",
               title: "Syndrome d'apnées du sommeil",
               urlString: "https://www.inserm.fr/dossier/apnee-sommeil/",
               note: "Mécanismes, hypoxie intermittente, conséquences cardiométaboliques, recherche."),
        Source(id: "spf-sas",
               organisation: "Santé publique France",
               title: "Le syndrome d'apnées du sommeil en France : un syndrome fréquent et sous-diagnostiqué",
               urlString: "https://www.santepubliquefrance.fr/sommeil/article/le-syndrome-dapnees-du-sommeil-en-france-un-syndrome-frequent-et-sous-diagnostique",
               note: "Données de prévalence en population générale et chez les personnes hypertendues, diabétiques, obèses."),
        Source(id: "ffc-apnee",
               organisation: "Fédération Française de Cardiologie",
               title: "L'apnée du sommeil et les maladies cardiovasculaires",
               urlString: "https://www.fedecardio.org/je-m-informe/l-apnee-du-sommeil-et-les-maladies-cardiovasculaires/",
               note: "Liens entre apnée du sommeil, hypertension, troubles du rythme et insuffisance cardiaque."),
        Source(id: "legifrance-ppc-2017",
               organisation: "Légifrance",
               title: "Arrêté du 13 décembre 2017 : conditions de prise en charge de la PPC (LPPR)",
               urlString: "https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000036209897",
               note: "Règles d'observance (112 heures par 28 jours) et de renouvellement."),
        Source(id: "legifrance-conduite-2022",
               organisation: "Légifrance",
               title: "Arrêté du 28 mars 2022 : affections médicales et permis de conduire",
               urlString: "https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000045464094",
               note: "Compatibilité de l'apnée du sommeil avec la conduite, groupes léger et lourd."),
        Source(id: "securite-routiere",
               organisation: "Sécurité routière",
               title: "L'aptitude médicale à la conduite",
               urlString: "https://www.securite-routiere.gouv.fr/dangers-de-la-route/sante-et-conduite/laptitude-medicale-la-conduite",
               note: "Rôle du médecin agréé et démarches du conducteur."),
        Source(id: "msd-grand-public",
               organisation: "Manuel MSD, version grand public",
               title: "Apnée du sommeil",
               urlString: "https://www.msdmanuals.com/fr/accueil/troubles-pulmonaires-et-des-voies-a%C3%A9riennes/apn%C3%A9e-du-sommeil/apn%C3%A9e-du-sommeil",
               note: "Apnée obstructive et apnée centrale, symptômes, traitements.")
    ]

    static func byID(_ id: String) -> Source? {
        all.first { $0.id == id }
    }

    static func sources(for chapter: Chapter) -> [Source] {
        chapter.sourceIDs.compactMap(byID)
    }

    /// Sources regroupées par organisme, dans l'ordre d'apparition.
    static var grouped: [(organisation: String, sources: [Source])] {
        var order: [String] = []
        var dict: [String: [Source]] = [:]
        for source in all {
            if dict[source.organisation] == nil { order.append(source.organisation) }
            dict[source.organisation, default: []].append(source)
        }
        return order.map { ($0, dict[$0] ?? []) }
    }
}
