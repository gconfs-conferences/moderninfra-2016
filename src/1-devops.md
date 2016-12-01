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
- Vous voulez des détails ?


### Prérequis

* Equipe de gestion de l'infra en interne (ops)
* Développeurs en interne (devs)
* Managers prêts à évoluer !
* Projet !

### Problématiques

* Equipes ops/dev séparées
* Manque de communication
* Over-process
* Manque de confiance du métier en l'IT

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

# Testing/CI

---

### En pratique

* Iso prod → ça marche en preprod → c'est safe, go live

**Mais :**

La stratégie de recette et de tests :

* ... est rarement partagée
* ... n'est pas toujours définie clairement
* ... n'est pas toujours ni rigoureusement respectée

→ nuit à la crédibilité du résultat

---

### Challenges :

* Avoir les outils
* Obtenir des environnements ISO prod dans des délais raisonnables
* Garantir l'intégrité des tests et des résultats rapides

* Une collaboration qui fonctionne ne doit pas être mise en péril par une
  agrandissement de l'équipe ou un changement des personnes impliquées
* Structuration du processus autour de l'automatisation → créer un cadre dans
  lequel on pourra inclure les nouveaux arrivants

---

# Automatisation

---

### Problématique initiale

* Processus rarement définis
* Chacun garde son bout de process dans un coin pour le faire évoluer comme il
  veut

---

### Objectifs

* Accélération du provisionning → Gagner du temps !
* Fiabilisation des déploiements
* Automatisation, systématisation des tests

---

### Définition

Automatiser ≠ optimiser

* Rendre systématique
* ... à l'aide d'outils technologiques
* ... un **enchainement d'activités** spécifiques
* Pas forcément optimisé ou industrialisé !

ENSUITE : identifier et enlever les étapes inutiles et optimiser la chaine
d'activités pour tendre vers du continuous delivery

---

### Tâches concernées

* Tâches répétitives à faible valeur ajoutée
* Tâches plus complexes techniquement, succeptibles d'introduire des erreurs
  d'innatention !

* Notion même de valeur ajoutée qui peut faire l'objet d'un débat !
* Personne n'aime voir son travail dévalorisé
* → définition complexe

---

Tâches les plus pénibles :

* Chronophages
* Sans intérêt intellectuel particulier
* Complexes et éprouvantes

→ Tâches susceptibles de générer des erreurs et de générer de la tension entre
les partenaires. Ex : mise en prod (CF Hosting)

---

### Accelerated delivery

* Accélération du Time To Market
* Accélération des résolutions d'incidents (MTTR, Mean Time To Repair)
* Industrialisation des déploiements

### Please

As a dev :

- Follow what you code until it's live and working as expected
- Talk to your Ops *before* the start of the project, and *during* it

As an ops :

- Listen to what the devs want
- Make their life easy : if it isn't, they will bypass you

