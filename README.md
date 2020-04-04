# La classe à la maison

[La Classe à la maison](https://www.laclassealamaison.org/) permet de mettre en relation des professeurs bénévoles de l’Education Nationale et des enfants/parents de la maternelle au CM2.

Le projet a été lancé lors du hackathon [Hack la crise](https://www.hacklacrise.fr/), dans le contexte de l'épidémie de COVID-19.

## Informations

Le projet utilise :
- Ruby 2.6.6
- Ruby on Rails 6.0.2.2
- Devise pour l'authentification
- Pundit pour les autorisations
- high_voltage pour les pages statiques
- meta-tags
- simple_calendar pour le calendrier
- httparty pour les notifications webhooks

## Développement

Pour développer sur le projet, les dépendances Ruby 2.6.6 et bundler sont requises. Après avoir cloné le dépôt, exécuter les commandes suivantes pour démarrer le projet :

```
bundle
yarn
bin/rails db:setup
bin/rails s
```

Vous pouvez alors utiliser l'application et vous connecter en observant les utilisateurs créés dans le fichier db/seeds.rb

Pour développer une feature souhaitée, partir de la branche develop pour créer une nouvelle branche feature/nom-de-la-feature.
Faire un push de cette branche et créer une pull request vers la branche develop.

Pour proposer une nouvelle version à mettre en production, partir de la branche develop pour créer une nouvelle branche release/vAAAA.MM.N avec AAAA l'année en cours sur 4 chiffres, MM le mois en cours sur 2 chiffres, N le numéro de la release dans le mois en cours.
Faire un push de cette branche et créer une pull request vers la branche master.


## Contributeurs

- [@chou34500](https://github.com/chou34500), développeuse
- [@cyrildotcc](https://github.com/cyrildotcc), développeur
- [@Pil0u](https://github.com/Pil0u), développeur

Pour voir la liste des contributeurs :
https://github.com/laclassealamaison-org/laclassealamaison/graphs/contributors
