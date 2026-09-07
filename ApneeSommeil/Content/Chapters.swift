import SwiftUI

/// Contenu pédagogique rédigé à partir des sites institutionnels français :
/// Assurance Maladie (ameli.fr), Haute Autorité de Santé (HAS), Inserm,
/// Santé publique France, Fédération Française de Cardiologie, Légifrance,
/// Sécurité routière. Voir `Sources.swift` pour les références.
enum Chapters {

    static let all: [Chapter] = [
        understanding, riskFactors, symptoms, diagnosis, complications,
        treatments, cpapDaily, livingWith, children
    ]

    // MARK: 1. Comprendre

    static let understanding = Chapter(
        id: "comprendre",
        title: "Qu'est-ce que l'apnée du sommeil ?",
        subtitle: "Définition, mécanisme et chiffres clés",
        systemImage: "lungs.fill",
        tint: .indigo,
        readingMinutes: 4,
        blocks: [
            .heading("Une définition simple"),
            .paragraph("L'apnée du sommeil, ou **syndrome d'apnées–hypopnées obstructives du sommeil (SAHOS)**, est un trouble de la respiration pendant le sommeil. Elle se caractérise par des épisodes anormalement fréquents d'interruptions complètes de la respiration (les **apnées**) ou de réductions importantes du débit d'air (les **hypopnées**)."),
            .paragraph("Ces pauses respiratoires durent de 10 à 30 secondes, parfois plus. Elles se produisent au moins 5 fois par heure de sommeil et peuvent se répéter une centaine de fois par nuit, le plus souvent sans que la personne s'en rende compte."),
            .heading("Que se passe-t-il dans la gorge ?"),
            .paragraph("Pendant le sommeil, les muscles de la gorge (le pharynx) se relâchent. Chez certaines personnes, ce relâchement rétrécit ou ferme complètement le passage de l'air : c'est l'**obstruction**. L'air ne passe plus, le taux d'oxygène dans le sang baisse et le cerveau déclenche un très bref réveil, appelé **micro-éveil**, pour rouvrir la gorge. La respiration reprend, souvent avec un ronflement sonore, puis le cycle recommence."),
            .paragraph("Ces micro-éveils sont si courts que la personne n'en garde aucun souvenir. Mais ils fragmentent le sommeil et l'empêchent d'être réparateur : c'est ce qui explique la fatigue et la somnolence dans la journée."),
            .callout(.info, "**Apnée obstructive ou apnée centrale ?** Dans la forme obstructive, de loin la plus fréquente, la gorge se ferme alors que les efforts pour respirer continuent. Dans la forme centrale, beaucoup plus rare, c'est la commande de la respiration par le cerveau qui s'interrompt momentanément. Cette application traite principalement de la forme obstructive."),
            .heading("L'IAH : mesurer la sévérité"),
            .paragraph("L'importance de l'apnée du sommeil se mesure par le nombre d'apnées et d'hypopnées par heure de sommeil : c'est l'**indice d'apnées–hypopnées (IAH)**, calculé lors d'un enregistrement du sommeil."),
            .figures([
                KeyFigure(value: "5 à 15", label: "apnée légère"),
                KeyFigure(value: "15 à 30", label: "apnée modérée"),
                KeyFigure(value: "> 30", label: "apnée sévère")
            ]),
            .paragraph("La sévérité tient aussi compte de l'intensité de la somnolence dans la journée. Le médecin combine ces deux éléments pour décider du traitement."),
            .heading("Une maladie fréquente et sous-diagnostiquée"),
            .paragraph("La fréquence de l'apnée du sommeil augmente avec l'âge :"),
            .figures([
                KeyFigure(value: "7,9 %", label: "des 20–44 ans"),
                KeyFigure(value: "19,7 %", label: "des 45–64 ans"),
                KeyFigure(value: "30,5 %", label: "des plus de 65 ans")
            ]),
            .bullets([
                "Les hommes sont deux fois plus exposés que les femmes.",
                "Dans le monde, près d'un milliard de personnes ont un syndrome d'apnées du sommeil et à peine 20 % sont diagnostiquées (Inserm).",
                "En France, seules 15 % des personnes ayant des symptômes évocateurs déclaraient avoir déjà bénéficié d'un enregistrement du sommeil (Santé publique France)."
            ]),
            .callout(.tip, "Bonne nouvelle : l'apnée du sommeil se diagnostique facilement et se traite efficacement. Les traitements permettent de retrouver un sommeil réparateur et de réduire les risques pour le cœur et les vaisseaux.")
        ],
        sourceIDs: ["ameli-comprendre", "has-reco-2014", "inserm-dossier", "spf-sas"]
    )

    // MARK: 2. Causes et facteurs de risque

    static let riskFactors = Chapter(
        id: "facteurs",
        title: "Causes et facteurs de risque",
        subtitle: "Pourquoi la gorge se ferme pendant le sommeil",
        systemImage: "person.fill.questionmark",
        tint: .orange,
        readingMinutes: 3,
        blocks: [
            .paragraph("Toute situation qui rétrécit les voies aériennes supérieures, ou qui favorise leur relâchement pendant le sommeil, peut provoquer des apnées. Plusieurs facteurs s'additionnent souvent chez une même personne."),
            .heading("Le surpoids et l'obésité"),
            .paragraph("Le surpoids, et surtout l'obésité, sont les facteurs de risque majeurs. La graisse qui s'accumule dans les tissus autour du pharynx rétrécit le passage de l'air et favorise son obstruction au cours du sommeil."),
            .heading("L'âge et le sexe"),
            .bullets([
                "La fréquence augmente avec l'âge : environ 30 % des personnes de plus de 65 ans sont concernées.",
                "Les hommes sont deux fois plus touchés que les femmes.",
                "Chez la femme, la fréquence augmente après la ménopause."
            ]),
            .heading("Les particularités du nez, de la gorge et de la mâchoire"),
            .paragraph("Une obstruction nasale plus ou moins permanente (végétations volumineuses, déviation de la cloison nasale…), des anomalies de taille ou de position de la mâchoire (mandibule trop petite ou en retrait), une langue très volumineuse, une luette ou des amygdales volumineuses favorisent la survenue de pauses respiratoires nocturnes."),
            .heading("Ce qui aggrave les apnées"),
            .bullets([
                "**L'alcool**, surtout le soir : il relâche les muscles de la gorge.",
                "**Le tabac**, qui irrite et fait gonfler les muqueuses des voies aériennes.",
                "**Les somnifères et les anxiolytiques** (sédatifs), qui accentuent le relâchement musculaire.",
                "**Le sommeil sur le dos**, position dans laquelle la langue et le voile du palais reculent vers la gorge."
            ]),
            .heading("Les maladies souvent associées"),
            .paragraph("Un diabète de type 2, une hypertension artérielle, un surpoids ou une obésité et un syndrome métabolique sont souvent associés aux apnées du sommeil. Selon Santé publique France, les symptômes évocateurs d'apnée sont plus fréquents chez les personnes hypertendues, diabétiques et obèses que dans la population générale."),
            .figures([
                KeyFigure(value: "4,9 %", label: "population générale"),
                KeyFigure(value: "8,4 %", label: "personnes hypertendues"),
                KeyFigure(value: "10,5 %", label: "personnes diabétiques"),
                KeyFigure(value: "11,5 %", label: "personnes obèses")
            ]),
            .callout(.important, "La Fédération Française de Cardiologie recommande de rechercher systématiquement une apnée du sommeil en cas d'hypertension résistante au traitement, de fibrillation auriculaire ou d'insuffisance cardiaque.")
        ],
        sourceIDs: ["ameli-comprendre", "spf-sas", "ffc-apnee"]
    )

    // MARK: 3. Symptômes

    static let symptoms = Chapter(
        id: "symptomes",
        title: "Reconnaître les symptômes",
        subtitle: "La nuit pour l'entourage, le jour pour vous",
        systemImage: "moon.zzz.fill",
        tint: .teal,
        readingMinutes: 3,
        blocks: [
            .heading("La nuit : ce que remarque l'entourage"),
            .bullets([
                "Un **ronflement sévère**, présent presque chaque nuit et depuis longtemps. Il est constaté dans 95 % des cas et gêne souvent le conjoint.",
                "Des **pauses respiratoires** pendant le sommeil, observées par l'entourage.",
                "Des **réveils en sursaut** avec une sensation d'étouffement ou de suffocation.",
                "Un sommeil agité, avec des mouvements des jambes et parfois des sueurs nocturnes.",
                "Un besoin d'uriner plus d'une fois par nuit (**nycturie**)."
            ]),
            .heading("Le jour : ce que ressent la personne"),
            .bullets([
                "Une **somnolence excessive** dans la journée, non expliquée par un manque de sommeil : envie de dormir en lisant, devant la télévision, en réunion, voire au volant.",
                "Une **fatigue** importante dès le réveil, avec la sensation d'un sommeil non réparateur.",
                "Des **maux de tête** le matin.",
                "Des difficultés de concentration et des troubles de la mémoire.",
                "Une irritabilité, une humeur dépressive.",
                "Une baisse de la libido."
            ]),
            .callout(.warning, "**Somnolence au volant :** si vous luttez contre le sommeil en conduisant, arrêtez-vous et parlez-en rapidement à votre médecin. La somnolence liée à l'apnée du sommeil augmente le risque d'accident de la route."),
            .heading("Quand consulter ?"),
            .paragraph("Parlez-en à votre médecin traitant si vous ronflez fort, si votre entourage a remarqué des pauses respiratoires, ou si vous êtes somnolent dans la journée sans raison évidente. L'échelle de somnolence d'Epworth, disponible dans l'onglet **Outils**, vous aide à préparer la consultation."),
            .callout(.tip, "Votre conjoint ou vos proches sont souvent les premiers témoins : leur description des ronflements et des pauses est précieuse pour le médecin.")
        ],
        sourceIDs: ["ameli-symptomes", "has-reco-2014"]
    )

    // MARK: 4. Diagnostic

    static let diagnosis = Chapter(
        id: "diagnostic",
        title: "Le diagnostic",
        subtitle: "Consultation, questionnaires et enregistrement du sommeil",
        systemImage: "waveform.path.ecg",
        tint: .blue,
        readingMinutes: 4,
        blocks: [
            .heading("Première étape : la consultation"),
            .paragraph("Le diagnostic se fait en deux temps. Lors de la consultation, le médecin précise les symptômes que vous ressentez ou que votre entourage a observés, recherche les facteurs de risque (poids, tour de cou, examen du nez et de la gorge, tension artérielle) et évalue votre somnolence."),
            .paragraph("Pour mesurer la somnolence, il dispose de plusieurs échelles, dont l'**échelle de somnolence d'Epworth**. Ce questionnaire de 8 questions peut être rempli par le patient lui-même. Un score supérieur à 10 oriente vers une exploration du sommeil."),
            .heading("Deuxième étape : l'enregistrement du sommeil"),
            .paragraph("**La polygraphie respiratoire** se réalise le plus souvent à domicile. Pendant au moins 6 heures de sommeil, l'appareil enregistre l'électrocardiogramme, les mouvements respiratoires, le débit d'air qui entre et sort par les narines et, grâce à un capteur placé au bout du doigt, le taux d'oxygène dans le sang. Elle permet de détecter les baisses d'oxygène lors des apnées et des hypopnées."),
            .paragraph("**La polysomnographie** est un examen plus complet, réalisé le plus souvent dans un centre du sommeil. Elle enregistre en plus l'activité du cerveau, des yeux et des muscles pour analyser les stades du sommeil et les micro-éveils. Elle n'est pas prescrite systématiquement : elle est utile lorsque la polygraphie ne suffit pas à conclure ou lorsqu'un autre trouble du sommeil est suspecté."),
            .paragraph("L'enregistrement confirme le diagnostic, calcule l'IAH et évalue la sévérité : nombre, durée et retentissement des apnées et hypopnées sur le sommeil et l'oxygénation."),
            .callout(.info, "Selon la HAS, on parle de SAHOS modéré ou sévère à partir d'un IAH supérieur à 15, associé à au moins trois des symptômes suivants : somnolence diurne, ronflements sévères et quotidiens, sensations d'étouffement pendant le sommeil, fatigue diurne, nycturie, maux de tête matinaux."),
            .heading("Les tests de vigilance"),
            .paragraph("Pour évaluer l'aptitude à la conduite, en particulier chez les conducteurs professionnels, le médecin peut prescrire des **tests de maintien de l'éveil (TME)**. Installé en position semi-allongée dans une pièce calme et peu éclairée, le patient doit résister au sommeil pendant 20 minutes ; le test est répété toutes les 2 heures."),
            .heading("Qui consulter ?"),
            .paragraph("Le médecin traitant est le premier interlocuteur. Il peut vous orienter vers un pneumologue, un ORL, un cardiologue, un neurologue ou un centre du sommeil selon votre situation.")
        ],
        sourceIDs: ["ameli-symptomes", "ameli-vivre", "has-reco-2014"]
    )

    // MARK: 5. Complications

    static let complications = Chapter(
        id: "complications",
        title: "Les risques si elle n'est pas traitée",
        subtitle: "Cœur, vaisseaux, métabolisme et vie quotidienne",
        systemImage: "heart.fill",
        tint: .red,
        readingMinutes: 3,
        blocks: [
            .paragraph("Non traitée, l'apnée du sommeil ne se limite pas à la fatigue. La répétition des baisses d'oxygène (**hypoxie intermittente**) et des micro-éveils, nuit après nuit, a des conséquences sur tout l'organisme."),
            .heading("Sur le cœur et les vaisseaux"),
            .paragraph("Selon l'Inserm, l'hypoxie intermittente provoque un stress oxydatif dans les tissus, à l'origine d'un état inflammatoire, d'une résistance à l'insuline et d'une rigidification des artères."),
            .bullets([
                "**Hypertension artérielle**, souvent difficile à contrôler.",
                "**Troubles du rythme cardiaque** : fibrillation auriculaire, arythmies.",
                "**Athérosclérose** et maladie coronaire (angine de poitrine, infarctus du myocarde).",
                "**Accident vasculaire cérébral (AVC)**.",
                "**Insuffisance cardiaque**."
            ]),
            .paragraph("La fréquence et la sévérité des apnées sont prédictives de la mortalité cardiovasculaire. C'est pourquoi l'apnée du sommeil sévère est considérée comme une situation à haut risque cardiovasculaire."),
            .heading("Sur le métabolisme"),
            .bullets([
                "Diabète de type 2 et résistance à l'insuline.",
                "Syndrome métabolique (surpoids abdominal, hypertension, anomalies des graisses et du sucre dans le sang).",
                "Progression accélérée de la stéatose du foie (« foie gras »)."
            ]),
            .heading("Sur la vie quotidienne"),
            .paragraph("Le syndrome altère la qualité de vie : troubles de la vigilance, somnolence, difficulté à exécuter les tâches quotidiennes, troubles de la mémoire et de la concentration, troubles de l'humeur. Les accidents de la route, de la vie domestique et du travail sont plus nombreux."),
            .callout(.tip, "Le traitement de l'apnée du sommeil améliore la somnolence et la qualité de vie, et contribue à mieux contrôler la tension artérielle. Plus il est suivi régulièrement, plus les bénéfices sont importants.")
        ],
        sourceIDs: ["ameli-symptomes", "inserm-dossier", "ffc-apnee"]
    )

    // MARK: 6. Traitements

    static let treatments = Chapter(
        id: "traitements",
        title: "Les traitements",
        subtitle: "Hygiène de vie, PPC, orthèse, chirurgie",
        systemImage: "cross.case.fill",
        tint: .green,
        readingMinutes: 5,
        blocks: [
            .heading("Un traitement adapté à chaque personne"),
            .paragraph("Le choix du traitement dépend de la sévérité de l'apnée (IAH), de l'intensité des symptômes, des maladies associées et de vos préférences. Il est toujours discuté avec votre médecin."),
            .heading("1. Les mesures pour tous"),
            .bullets([
                "**Perdre du poids** en cas de surpoids, avec une alimentation équilibrée et une activité physique régulière : c'est parfois suffisant dans les formes légères.",
                "**Dormir sur le côté** plutôt que sur le dos.",
                "**Éviter l'alcool le soir** et arrêter le tabac.",
                "**Ne pas prendre de somnifères** ou de sédatifs sans avis médical.",
                "**Traiter une obstruction nasale** (rhinite, déviation de la cloison)."
            ]),
            .heading("2. La pression positive continue (PPC)"),
            .paragraph("C'est le **traitement de référence**. Un appareil silencieux envoie de l'air sous une légère pression, à travers un tuyau souple et un masque porté pendant le sommeil. Cette pression maintient la gorge ouverte et empêche les apnées. Le sommeil redevient réparateur, souvent dès les premières nuits."),
            .paragraph("La HAS recommande la PPC en première intention lorsque l'IAH est supérieur à 30, ou lorsque l'IAH est compris entre 15 et 30 en présence d'un sommeil de mauvaise qualité (au moins 10 micro-éveils par heure) ou d'une maladie cardiovasculaire grave associée."),
            .heading("3. L'orthèse d'avancée mandibulaire (OAM)"),
            .paragraph("Il s'agit d'une gouttière sur mesure, réalisée par un chirurgien-dentiste, qui maintient la mâchoire inférieure légèrement avancée pendant le sommeil. Cela dégage l'arrière-gorge et réduit les apnées et les ronflements."),
            .paragraph("La HAS la recommande en première intention lorsque l'IAH est compris entre 15 et 30, en l'absence de maladie cardiovasculaire grave associée. Dans toutes les situations, elle constitue une alternative en cas de refus ou d'intolérance à la PPC. Elle est prise en charge par l'Assurance Maladie sous conditions ; la prise en charge d'une orthèse exclut celle d'une PPC en même temps."),
            .heading("4. La chirurgie"),
            .paragraph("Le traitement chirurgical n'est indiqué qu'en cas d'échec des autres traitements et il est surtout réservé à des cas particuliers, liés à des anomalies anatomiques. L'intervention peut porter sur le voile du palais, les végétations, les amygdales, la cloison nasale ou la mâchoire (chirurgie d'avancée maxillo-mandibulaire)."),
            .heading("5. La stimulation du nerf hypoglosse"),
            .paragraph("Ce traitement récent consiste à implanter un petit stimulateur qui active, à chaque respiration, le nerf de la langue pour l'empêcher de reculer et d'obstruer la gorge. Il est réservé à certains patients atteints d'un SAHOS modéré à sévère en échec de la PPC et de l'orthèse, après un bilan spécialisé comprenant une endoscopie sous sommeil induit."),
            .callout(.important, "Aucun médicament ne guérit l'apnée du sommeil obstructive. Méfiez-vous des produits vendus sans prescription qui promettent d'y remédier."),
            .callout(.info, "**Et l'apnée centrale ?** Elle relève d'une prise en charge spécifique (traitement de la maladie en cause, ventilation adaptée). Parlez-en à votre spécialiste.")
        ],
        sourceIDs: ["ameli-traitement", "has-reco-2014", "has-hypoglosse", "ameli-accord-prealable"]
    )

    // MARK: 7. PPC au quotidien

    static let cpapDaily = Chapter(
        id: "ppc",
        title: "La PPC au quotidien",
        subtitle: "Masque, premiers jours, observance, prise en charge",
        systemImage: "wind",
        tint: .cyan,
        readingMinutes: 5,
        blocks: [
            .heading("L'appareil et le masque"),
            .paragraph("Il existe divers appareils, masques et accessoires : **masques narinaires** (petits embouts dans les narines), **masques nasaux** (couvrant le nez) ou **masques naso-buccaux** (couvrant le nez et la bouche). Le prestataire adapte minutieusement le masque pour éviter les fuites d'air et les marques de pression : n'hésitez pas à en essayer plusieurs."),
            .heading("Les premiers jours"),
            .bullets([
                "Un temps d'adaptation de quelques jours à quelques semaines est normal.",
                "Commencez par porter le masque éveillé, en lisant ou en regardant la télévision, pour vous y habituer.",
                "La plupart des appareils augmentent progressivement la pression (« rampe ») pour faciliter l'endormissement.",
                "Signalez tout inconfort à votre prestataire ou à votre médecin : il existe presque toujours une solution."
            ]),
            .heading("Les effets indésirables et leurs solutions"),
            .bullets([
                "**Sécheresse du nez ou de la bouche** : raccorder un humidificateur chauffant à l'appareil.",
                "**Nez bouché ou qui coule** (rhinite) : humidificateur, traitement local prescrit par le médecin.",
                "**Irritation ou marques sur le visage** : réajuster le masque, changer de modèle ou de taille.",
                "**Fuites d'air, bruit** : vérifier le réglage des sangles et l'état du masque.",
                "**Ballonnements** (aérophagie) : en parler au médecin, qui peut ajuster la pression."
            ]),
            .heading("L'observance : la clé de l'efficacité"),
            .paragraph("La PPC n'agit que lorsqu'elle est portée. Elle doit être utilisée **chaque nuit, toute la nuit**, ainsi que pendant les siestes. Les bénéfices sur la somnolence, la tension artérielle et le risque cardiovasculaire augmentent avec la durée d'utilisation."),
            .paragraph("Pour la prise en charge par l'Assurance Maladie, l'observance est mesurée par l'appareil et appréciée par périodes de 28 jours consécutifs. L'objectif est une utilisation d'au moins **112 heures par période de 28 jours**, soit en moyenne 4 heures par nuit. Une utilisation comprise entre 56 et 112 heures est tolérée temporairement ; en dessous de 56 heures, la prise en charge peut être remise en cause."),
            .figures([
                KeyFigure(value: "112 h", label: "par période de 28 jours"),
                KeyFigure(value: "4 h", label: "par nuit en moyenne")
            ]),
            .heading("Prescription et prise en charge"),
            .bullets([
                "La PPC est prescrite après une **demande d'accord préalable** remplie par le médecin. La première prescription est valable 4 mois, les renouvellements 1 an.",
                "L'appareil est loué auprès d'un **prestataire de santé à domicile** que vous choisissez librement ; il doit être agréé auprès de l'Assurance Maladie.",
                "Le prestataire livre, règle et entretient l'appareil, vous forme à son utilisation et assure le suivi de l'observance, transmise au médecin.",
                "Après plusieurs années, le renouvellement peut être fait par le médecin traitant si vous acceptez la transmission des données d'observance."
            ]),
            .heading("Entretien"),
            .bullets([
                "Nettoyer le masque chaque jour à l'eau tiède savonneuse et le laisser sécher à l'air.",
                "Laver le tuyau et l'humidificateur chaque semaine ; utiliser de l'eau distillée ou déminéralisée dans l'humidificateur.",
                "Changer les filtres selon les consignes du prestataire."
            ]),
            .heading("Voyages"),
            .paragraph("L'appareil de PPC est transportable en bagage à main et doit vous accompagner dans tous vos déplacements. Pensez à l'adaptateur électrique à l'étranger et demandez à votre prestataire une attestation pour les voyages en avion.")
        ],
        sourceIDs: ["ameli-traitement", "ameli-vivre", "ameli-accord-prealable", "legifrance-ppc-2017", "has-ppc-2026"]
    )

    // MARK: 8. Vivre avec

    static let livingWith = Chapter(
        id: "vivre",
        title: "Vivre avec l'apnée du sommeil",
        subtitle: "Bons réflexes, conduite automobile, suivi",
        systemImage: "figure.walk",
        tint: .purple,
        readingMinutes: 4,
        blocks: [
            .heading("Les bons réflexes au quotidien"),
            .bullets([
                "Respectez le traitement prescrit (PPC ou orthèse) chaque nuit et lors des siestes.",
                "N'oubliez pas les rendez-vous de suivi et demandez toutes les informations utiles pour bien comprendre votre maladie.",
                "Faites les examens de contrôle demandés : enregistrements du sommeil, bilans biologiques, contrôle de la tension.",
                "Dormez sur le côté ; un oreiller ou un dispositif placé dans le dos aide à éviter de se retourner.",
                "Supprimez, avec votre médecin, les sédatifs (somnifères, anxiolytiques) qui relâchent les muscles de la gorge.",
                "Perdez du poids si vous êtes en surpoids, avec une alimentation équilibrée et une activité physique régulière.",
                "Limitez l'alcool, surtout le soir, et arrêtez le tabac.",
                "Gardez des horaires de sommeil réguliers et une durée de sommeil suffisante."
            ]),
            .heading("Conduite automobile"),
            .paragraph("L'apnée du sommeil fait partie des affections médicales listées par l'arrêté du 28 mars 2022 relatif à l'aptitude à la conduite. Le permis peut être délivré ou maintenu aux conducteurs atteints d'un syndrome d'apnée obstructive modéré ou sévère **qui démontrent que leur affection est bien contrôlée, qu'ils suivent un traitement adéquat et que leur somnolence s'est améliorée**."),
            .bullets([
                "Tant que la somnolence n'est pas contrôlée, ne conduisez pas.",
                "Les conducteurs concernés doivent solliciter l'avis d'un médecin agréé par la préfecture s'ils souhaitent continuer à conduire ; l'aptitude est temporaire et réévaluée régulièrement.",
                "Les règles sont plus strictes pour les conducteurs professionnels (groupe lourd), chez qui des tests de maintien de l'éveil peuvent être demandés."
            ]),
            .callout(.warning, "Au volant, dès les premiers signes de somnolence (paupières lourdes, bâillements, difficultés à garder sa trajectoire), arrêtez-vous et faites une courte sieste."),
            .heading("Le suivi médical"),
            .paragraph("Un suivi régulier permet de vérifier l'efficacité du traitement, d'ajuster les réglages, de prendre en charge les maladies associées (hypertension, diabète) et de renouveler les prescriptions. Les consultations du médecin traitant et du spécialiste du sommeil sont complémentaires."),
            .heading("Le rôle de l'entourage"),
            .paragraph("Le conjoint retrouve lui aussi un sommeil de meilleure qualité lorsque les ronflements disparaissent. Son soutien est précieux pour maintenir le traitement au long cours."),
            .heading("Apnée du sommeil et autres situations"),
            .paragraph("Si vous êtes asthmatique, l'apnée du sommeil peut aggraver l'asthme, et inversement. Si vous devez subir une **anesthésie générale**, informez l'anesthésiste de votre apnée du sommeil et apportez votre appareil de PPC à l'hôpital.")
        ],
        sourceIDs: ["ameli-vivre", "ameli-asthme", "legifrance-conduite-2022", "securite-routiere"]
    )

    // MARK: 9. Enfant

    static let children = Chapter(
        id: "enfant",
        title: "L'apnée du sommeil chez l'enfant",
        subtitle: "Amygdales, végétations et signes d'alerte",
        systemImage: "figure.and.child.holdinghands",
        tint: .pink,
        readingMinutes: 2,
        blocks: [
            .paragraph("L'apnée du sommeil touche près de **2 % des enfants entre deux et six ans**. Dans la plupart des cas, elle est associée à de grosses amygdales et à une hypertrophie des végétations ; parfois elle est due à des malformations des maxillaires et de la face."),
            .heading("Les signes qui doivent alerter"),
            .bullets([
                "Un ronflement bruyant, avec des pauses respiratoires.",
                "Un sommeil agité, une respiration par la bouche, des sueurs, une énurésie (pipi au lit) qui réapparaît.",
                "Dans la journée : fatigue, ou au contraire irritabilité, hyperactivité, difficultés d'attention et d'apprentissage.",
                "Un retard de croissance dans les formes sévères."
            ]),
            .heading("Diagnostic et traitement"),
            .paragraph("Le diagnostic est confirmé par un enregistrement du sommeil, qui précise également le degré de sévérité. Le traitement consiste d'abord à retirer les amygdales et les végétations, ou à corriger une éventuelle malformation par orthopédie dento-faciale. La PPC est réservée à des situations particulières."),
            .callout(.tip, "Un enfant qui ronfle toutes les nuits n'est pas « normal » : parlez-en au pédiatre ou au médecin traitant.")
        ],
        sourceIDs: ["ameli-enfant", "ameli-symptomes"]
    )
}
