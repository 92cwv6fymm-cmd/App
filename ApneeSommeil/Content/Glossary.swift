import Foundation

enum Glossary {
    static let terms: [GlossaryTerm] = [
        GlossaryTerm(term: "Accord préalable", definition: "Formulaire rempli par le médecin prescripteur et adressé à l'Assurance Maladie avant la mise en place d'une PPC ou d'une orthèse. Il conditionne la prise en charge du traitement."),
        GlossaryTerm(term: "Apnée", definition: "Arrêt complet de la respiration pendant au moins 10 secondes au cours du sommeil."),
        GlossaryTerm(term: "Apnée centrale", definition: "Forme rare d'apnée du sommeil dans laquelle la commande de la respiration par le cerveau s'interrompt momentanément, sans obstruction de la gorge."),
        GlossaryTerm(term: "Apnée obstructive", definition: "Forme la plus fréquente d'apnée du sommeil : la gorge se ferme pendant le sommeil alors que les efforts pour respirer continuent."),
        GlossaryTerm(term: "Échelle d'Epworth", definition: "Questionnaire de 8 questions qui évalue la tendance à s'endormir dans des situations de la vie courante. Le score va de 0 à 24 ; un score supérieur à 10 oriente vers une exploration du sommeil."),
        GlossaryTerm(term: "Humidificateur", definition: "Accessoire raccordé à l'appareil de PPC qui humidifie et réchauffe l'air délivré, pour éviter la sécheresse du nez et de la bouche."),
        GlossaryTerm(term: "Hypopnée", definition: "Réduction importante, mais incomplète, du débit d'air pendant au moins 10 secondes, accompagnée d'une baisse d'oxygène ou d'un micro-éveil."),
        GlossaryTerm(term: "Hypoxie intermittente", definition: "Baisses répétées du taux d'oxygène dans le sang provoquées par les apnées. Elle est à l'origine des complications cardiovasculaires et métaboliques."),
        GlossaryTerm(term: "IAH (indice d'apnées–hypopnées)", definition: "Nombre d'apnées et d'hypopnées par heure de sommeil, mesuré lors d'un enregistrement. Il définit la sévérité : légère de 5 à 15, modérée de 15 à 30, sévère au-delà de 30."),
        GlossaryTerm(term: "Micro-éveil", definition: "Réveil très bref, de quelques secondes, déclenché par le cerveau pour rouvrir la gorge à la fin d'une apnée. Il n'est pas mémorisé mais fragmente le sommeil."),
        GlossaryTerm(term: "Nycturie", definition: "Besoin d'uriner plusieurs fois au cours de la nuit. C'est un symptôme fréquent de l'apnée du sommeil."),
        GlossaryTerm(term: "OAM (orthèse d'avancée mandibulaire)", definition: "Gouttière dentaire sur mesure portée la nuit, qui maintient la mâchoire inférieure avancée pour dégager la gorge."),
        GlossaryTerm(term: "Observance", definition: "Régularité avec laquelle un traitement est suivi. Pour la PPC, elle est mesurée par l'appareil ; l'objectif est d'au moins 112 heures par période de 28 jours, soit 4 heures par nuit en moyenne."),
        GlossaryTerm(term: "Pharynx", definition: "Partie de la gorge située derrière le nez et la bouche, par laquelle passe l'air. C'est à ce niveau que se produit l'obstruction pendant le sommeil."),
        GlossaryTerm(term: "Polygraphie respiratoire", definition: "Enregistrement du sommeil, le plus souvent à domicile, qui mesure la respiration, l'oxygénation et le rythme cardiaque pendant au moins 6 heures."),
        GlossaryTerm(term: "Polysomnographie", definition: "Enregistrement complet du sommeil, généralement en centre du sommeil, qui ajoute à la polygraphie l'activité du cerveau, des yeux et des muscles pour analyser les stades du sommeil et les micro-éveils."),
        GlossaryTerm(term: "PPC (pression positive continue)", definition: "Traitement de référence de l'apnée du sommeil : un appareil envoie de l'air sous légère pression par un masque pour maintenir la gorge ouverte pendant le sommeil."),
        GlossaryTerm(term: "Prestataire de santé à domicile", definition: "Société agréée qui loue l'appareil de PPC, l'installe, l'entretient, forme le patient et transmet les données d'observance au médecin."),
        GlossaryTerm(term: "SAHOS", definition: "Syndrome d'apnées–hypopnées obstructives du sommeil : nom médical de l'apnée du sommeil obstructive."),
        GlossaryTerm(term: "Saturation en oxygène", definition: "Pourcentage d'oxygène transporté par le sang, mesuré par un capteur au bout du doigt. Elle chute lors des apnées."),
        GlossaryTerm(term: "Somnolence diurne excessive", definition: "Tendance anormale à s'endormir dans la journée, dans des situations où l'on devrait rester éveillé. C'est le principal symptôme de jour de l'apnée du sommeil."),
        GlossaryTerm(term: "Stimulation du nerf hypoglosse", definition: "Traitement par implant qui stimule le nerf de la langue à chaque respiration pour éviter qu'elle n'obstrue la gorge. Réservé à certains patients en échec de PPC et d'orthèse."),
        GlossaryTerm(term: "Test de maintien de l'éveil (TME)", definition: "Examen de la vigilance au cours duquel le patient doit résister au sommeil pendant 20 minutes, plusieurs fois dans la journée. Il sert notamment à évaluer l'aptitude à la conduite."),
        GlossaryTerm(term: "Voies aériennes supérieures", definition: "Ensemble formé par le nez, la bouche, le pharynx et le larynx, par lequel l'air passe avant d'atteindre les poumons.")
    ].sorted { $0.term.localizedCaseInsensitiveCompare($1.term) == .orderedAscending }
}
