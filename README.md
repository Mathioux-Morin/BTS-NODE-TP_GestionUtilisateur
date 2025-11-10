# 👥 TP SIO — Gestion des Utilisateurs (Express.js + Flutter Web)

Ce projet est un TP de BTS SIO SLAM visant à créer une application web permettant de **gérer des utilisateurs** via une API REST en Express.js et une interface graphique développée avec **Flutter Web**.

---

## 🎯 Objectifs pédagogiques

- Créer une API REST avec Express.js
- Interagir avec une base de données MariaDB
- Développer une interface web avec Flutter
- Comprendre les échanges client-serveur via HTTP
- Implémenter l’ajout d’utilisateurs avec nom, email et téléphone

---

## 🛠️ Technologies utilisées

| Outil            | Rôle                                      |
|------------------|-------------------------------------------|
| **Express.js**    | Backend Node.js pour l’API REST           |
| **MariaDB**       | Base de données relationnelle             |
| **Flutter Web**   | Interface utilisateur graphique            |
| **HTTP**          | Protocole de communication                |
| **Dart**          | Langage utilisé par Flutter               |

---

## 📁 Structure du projet (simplifiée)

```
BTS-NODE-TP_GestionUtilisateur/
├── BACKEND/
│   ├── node_modules/                 
│   ├── server.js                  # Serveur Express.js
│   ├── package.json      
│   └── package.json            # Dépendances backend
└── FRONTEND/
    └── gestion_utilisateurs/
        ├── lib/
        │   ├── main.dart       # Interface Flutter
        │   └── api_service.dart # Requêtes HTTP vers l’API
        └── pubspec.yaml        # Dépendances Flutter
```

---

## 🚀 Installation et lancement

### 🔧 Backend (Express.js)

#### Prérequis
- Node.js
- MariaDB installé et configuré

#### Étapes
```bash
cd BACKEND
npm install
node index.js
```

L’API est disponible sur : `http://localhost:5000/api/utilisateurs`

---

### 🌐 Frontend (Flutter Web)

#### Prérequis
- Flutter installé
- Navigateur web

#### Lancement
```bash
cd FRONTEND/gestion_utilisateurs
flutter run -d web-server --web-hostname=0.0.0.0 --web-port=xxxx --web-render=html
```

L’interface est accessible sur : `http://localhost:xxxx`

---

## 📡 Endpoint disponible

### `POST /api/utilisateurs`

Permet d’ajouter un utilisateur avec les champs suivants :
```json
{
  "nom": "Jean Dupont",
  "email": "jean.dupont@mail.com",
  "telephone": "0601020304"
}
```

---

## 🎨 Fonctionnalités actuelles

- Formulaire d’ajout d’utilisateur
- Envoi des données vers l’API via HTTP
- Affichage graphique via Flutter Web

---

## 🔗 Connexion frontend ↔ backend

- Le fichier [`api_service.dart`](FRONTEND/gestion_utilisateurs/lib/api_service.dart) gère les appels HTTP vers l’API.
- Le fichier [`main.dart`](FRONTEND/gestion_utilisateurs/lib/main.dart) contient l’interface utilisateur.

---

👨‍💻 *Projet réalisé dans le cadre du BTS SIO SLAM — Lycée Fénelon*
