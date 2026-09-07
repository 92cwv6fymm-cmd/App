# Apnée du sommeil — application iPhone d'information pour les patients

Application iOS (SwiftUI, iOS 17+) qui explique l'apnée du sommeil aux patients et à leur entourage,
à partir des informations publiées par les organismes institutionnels français.

## Contenu

**Onglet Comprendre** — 9 chapitres illustrés, rédigés en langage patient :

1. Qu'est-ce que l'apnée du sommeil ? (définition, mécanisme, IAH, chiffres clés)
2. Causes et facteurs de risque
3. Reconnaître les symptômes
4. Le diagnostic (consultation, Epworth, polygraphie, polysomnographie, tests de maintien de l'éveil)
5. Les risques si elle n'est pas traitée
6. Les traitements (hygiène de vie, PPC, orthèse d'avancée mandibulaire, chirurgie, stimulation du nerf hypoglosse)
7. La PPC au quotidien (masques, effets indésirables, observance 112 h / 28 jours, prise en charge, entretien, voyages)
8. Vivre avec l'apnée du sommeil (bons réflexes, conduite automobile, suivi)
9. L'apnée du sommeil chez l'enfant

Chaque chapitre se termine par la liste des sources utilisées, ouvrables dans Safari.

**Onglet Outils** :

- Échelle de somnolence d'Epworth (8 questions, score 0–24)
- Questionnaire STOP-Bang (8 questions, score 0–8, avec la règle affinée STOP ≥ 2 + sexe masculin / IMC > 35 / tour de cou)
- Sévérité selon l'IAH (curseur interactif, seuils 5 / 15 / 30, nombre d'événements par nuit)
- Observance de la PPC (calcul des heures sur 28 jours par rapport aux seuils de 56 h et 112 h)

**Onglet Glossaire** — 24 termes avec recherche.

**Onglet Sources** — toutes les références institutionnelles, version et avertissement médical.

Un avertissement médical est affiché au premier lancement. Aucune donnée n'est collectée ni transmise.

## Sources institutionnelles

- Assurance Maladie (ameli.fr) : comprendre, symptômes et diagnostic, traitement, vivre avec, apnée de l'enfant, accord préalable PPC/OAM
- Haute Autorité de Santé : recommandations 2014 sur le SAHOS, fiche de bon usage PPC/OAM, évaluation des dispositifs de PPC, stimulation du nerf hypoglosse
- Inserm : dossier « Syndrome d'apnées du sommeil »
- Santé publique France : « Le syndrome d'apnées du sommeil en France : un syndrome fréquent et sous-diagnostiqué »
- Fédération Française de Cardiologie : « L'apnée du sommeil et les maladies cardiovasculaires »
- Légifrance : arrêté du 13 décembre 2017 (prise en charge de la PPC), arrêté du 28 mars 2022 (aptitude à la conduite)
- Sécurité routière : « L'aptitude médicale à la conduite »
- Manuel MSD, version grand public

Les URL complètes sont dans `ApneeSommeil/Content/Sources.swift`.

## Structure du projet

```
ApneeSommeil.xcodeproj/          Projet Xcode 16 (dossier synchronisé, aucun fichier à ajouter à la main)
ApneeSommeil/
  ApneeSommeilApp.swift          Point d'entrée
  Models/Models.swift            Chapitre, blocs de contenu, source, glossaire, sévérité IAH
  Content/Chapters.swift         Texte des 9 chapitres
  Content/Sources.swift          Références institutionnelles
  Content/Glossary.swift         Glossaire
  Views/RootView.swift           Onglets + avertissement au premier lancement
  Views/HomeView.swift           Liste des chapitres
  Views/ChapterView.swift        Lecture d'un chapitre
  Views/Components.swift         Composants partagés (Markdown, encadrés, chiffres clés…)
  Views/GlossaryView.swift
  Views/SourcesView.swift
  Views/DisclaimerView.swift
  Views/Tools/                   Epworth, STOP-Bang, sévérité IAH, observance PPC
  Assets.xcassets/               Icône (à fournir) et couleur d'accent
```

## Compilation

1. Ouvrir `ApneeSommeil.xcodeproj` avec Xcode 16 ou plus récent.
2. Dans l'onglet *Signing & Capabilities* de la cible, sélectionner votre équipe de développement.
3. Choisir un simulateur iPhone ou un appareil, puis *Run*.

L'identifiant de bundle par défaut est `fr.somnogard.apneesommeil` (modifiable dans les réglages de la cible).
L'icône d'application (1024 × 1024) est à déposer dans `Assets.xcassets/AppIcon.appiconset`.

## Mettre à jour le contenu

Le contenu est entièrement déclaratif : modifier les tableaux de `Chapters.swift`, `Sources.swift` et `Glossary.swift`.
Les paragraphes acceptent le Markdown en ligne (`**gras**`, `*italique*`). Les blocs disponibles sont
`heading`, `paragraph`, `bullets`, `callout(.info | .tip | .warning | .important, …)` et `figures`.

## Avertissement

Application d'information : elle ne remplace pas une consultation médicale, un diagnostic ni un traitement.
Les seuils cités (IAH, observance, échelles) sont ceux publiés par les organismes cités à la date de rédaction (septembre 2026).
