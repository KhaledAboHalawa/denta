# 🦷 Denta

> Connecting dental students with patients for free treatment, and with each other to exchange dental tools.

![Flutter](https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?logo=firebase&logoColor=black)
![Status](https://img.shields.io/badge/status-in%20development-orange)
![License](https://img.shields.io/badge/license-MIT-green)

---

## 📖 Table of Contents

- [About](#-about)
- [The Problem](#-the-problem)
- [Features](#-features)
- [Tech Stack](#-tech-stack)
- [Architecture](#-architecture)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Screenshots](#-screenshots)
- [Roadmap](#-roadmap)
- [Contributing](#-contributing)
- [License](#-license)
- [Author](#-author)

---

## 🦷 About

**Denta** is a mobile application that bridges a gap in dental education.

Dental students are required to complete clinical tasks on real patients, but finding suitable patients is often difficult. At the same time, many people cannot afford dental care. Denta connects the two: students post the cases they need to complete, patients receive **free** dental treatment, and students can also **exchange tools and equipment** with one another.

---

## 🎯 The Problem

| Who | Challenge |
| --- | --- |
| **Dental students** | Struggle to find patients who match their required clinical cases. |
| **Patients** | Cannot always afford dental treatment. |
| **Students (equipment)** | Dental tools are expensive and often needed only for a short period. |

Denta addresses all three with a single platform.

---

## ✨ Features

### For Students
- Create and publish clinical case requests (type of procedure, requirements, location, availability)
- Browse and accept patient applications
- Manage appointments and track completed cases
- Post, lend, borrow, or swap dental tools and equipment
- Chat with patients and other students

### For Patients
- Browse available treatment opportunities near them
- Apply for free dental care that matches their needs
- Book and manage appointments
- Receive reminders and status notifications

### General
- Secure authentication and role-based access (student / patient)
- Real-time notifications
- Ratings and reviews
- Multi-language support (Arabic / English)

> **Note:** This feature list reflects the project vision. Items are marked in the [Roadmap](#-roadmap) as they are implemented.

---

## 🛠 Tech Stack

| Layer | Technology |
| --- | --- |
| **Framework** | Flutter, Dart |
| **State Management** | Cubit / Bloc |
| **Architecture** | Clean Architecture, MVVM |
| **Backend & Services** | Firebase (Auth, Firestore, Storage, Cloud Messaging) |
| **Networking** | Dio, Retrofit |
| **Local Storage** | Hive, SQFlite |
| **Dependency Injection** | GetIt |
| **CI/CD** | GitHub Actions |

---

## 🏗 Architecture

Denta follows **Clean Architecture** with an **MVVM** presentation layer, separating the codebase into three independent layers:

```
┌──────────────────────────────────────────┐
│  Presentation  →  UI, Cubits, Widgets    │
├──────────────────────────────────────────┤
│  Domain        →  Entities, Use Cases,   │
│                   Repository Contracts   │
├──────────────────────────────────────────┤
│  Data          →  Models, Data Sources,  │
│                   Repository Impl.       │
└──────────────────────────────────────────┘
```

- **Presentation** depends on **Domain** only.
- **Domain** is pure Dart and has no dependency on any framework.
- **Data** implements the contracts defined in **Domain**.

This keeps the code testable, scalable, and easy to maintain.

---

## 📁 Project Structure

```
lib/
├── core/
│   ├── di/              # GetIt service locator
│   ├── errors/          # Failures and exceptions
│   ├── network/         # Dio client, interceptors
│   ├── theme/           # Colors, typography, themes
│   ├── utils/           # Helpers and constants
│   └── widgets/         # Shared reusable widgets
│
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── cases/
│   ├── appointments/
│   ├── tools_exchange/
│   ├── chat/
│   └── profile/
│
└── main.dart
```

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (3.x or later)
- Dart SDK (bundled with Flutter)
- Android Studio or VS Code
- A Firebase project

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/<your-username>/denta.git
   cd denta
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure Firebase**

   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

   This generates `lib/firebase_options.dart` for your project.

4. **Generate code** (if using code generation such as Retrofit or Hive adapters)

   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**

   ```bash
   flutter run
   ```

### Running Tests

```bash
flutter test
```

---

## 📸 Screenshots

_Screenshots will be added as the UI is completed._

| Login | Cases | Tool Exchange |
| --- | --- | --- |
| _coming soon_ | _coming soon_ | _coming soon_ |

---

## 🗺 Roadmap

- [x] Project setup and architecture
- [ ] Authentication (student / patient roles)
- [ ] Case creation and discovery
- [ ] Appointment booking
- [ ] Tool exchange marketplace
- [ ] In-app chat
- [ ] Push notifications
- [ ] Ratings and reviews
- [ ] Arabic / English localization
- [ ] CI/CD pipeline
- [ ] Release on Google Play / App Store

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome.

1. Fork the project
2. Create your feature branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m "feat: add amazing feature"`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

Please follow [Conventional Commits](https://www.conventionalcommits.org/) and keep to the existing architecture.

---

## 📄 License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## 👤 Author

**Khaled Abo Halawa**

- GitHub: [@KhaledAhmed31](https://github.com/KhaledAhmed31)
- LinkedIn: [khaled-abo-halawa](https://linkedin.com/in/khaled-abo-halawa)
- Portfolio: [khaledabohalawa.github.io](https://khaledabohalawa.github.io)
