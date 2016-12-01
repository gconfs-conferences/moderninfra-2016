# DevOps

### Syndrômes

- « Je teste en prod, c'est plus rapide »
- « Coucou cher admin sys, tu peux me mettre en prod la tarball que je t'ai
  envoyé par mail et qui segfault dès que tu lances le binaire ? »
- « Les devs sont nuls »
- « Les admin sys font chier »
- « Oui on fait du DevOps, on a installé un Jenkins »

### C'est quoi en vrai

- Problème organisationel avant d'être technique
- Culture
- Agile

### Prérequis

* Equipe de gestion de l'infra en interne (ops)
* Développeurs en interne (devs)
* Managers prêts à évoluer !
* Projet !

### Problématiques

* Equipes ops/dev séparées
* Manque de communication
* Over-process ou inexistants
* Manque de confiance du métier en l'IT
* Chacun garde son bout de process dans un coin pour le faire évoluer comme il
  veut


### Code

```c
void groups_free(struct group_info *group_info)
{
        if (group_info->blocks[0] != group_info->small_block) {
                int i;
                for (i = 0; i < group_info->nblocks; i++)
                        free_page((unsigned long)group_info->blocks[i]);
        }
        kfree(group_info);
}
```

### Livraison

* Testing, en local, côté dev (quand vous avez de la chance)
* Devs (prérequis + code packagé) → ops
* "Mise en prod" par les ops

### Et si ça ne marche pas ?

* Retour aux devs
    * Manque d'infos
    * Délais
    * Rejet de la faute
    * Perte de confiance
* Restart du process

"And again, and again, and again..."

### Objectifs/Bénéfices

* Réduction des cycles de livraison (automatisation)
* Amélioration de la qualité (CI, tests, metrics)
* Nouvelle culture (amélioration basée sur l'apprentissage continu)
* Accélération du Time To Market
* Accélération des résolutions d'incidents (MTTR, Mean Time To Repair)
* Industrialisation des déploiements

### Vision positive de l'échec

* Fail fast
* Anticipation

> I have not failed. I've just found 10,000 ways that won't work.
> -- Thomas A. Edison

### Comment ?

* Rapprochement des équipes :
    * Métier
    * Ops
    * Devs
* Centralisation des outils
* Promotion systématiques des valeurs précédentes :
    * Partage
    * Confiance
    * Amélioration continue
    * Partage des responsabilités

### Misc

* Testing / CI
* Accélération du provisionning → Gagner du temps !
* Fiabilisation des déploiements
* Automatisation, systématisation des tests

### Please

As a dev :

- Follow what you code until it's live and working as expected
- Talk to your Ops *before* the start of the project, and *during* it

As an ops :

- Listen to what the devs want
- Make their life easy : if it isn't, they will bypass you
