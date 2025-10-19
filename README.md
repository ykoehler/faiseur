# Faiseur

A powerful, flexible todo list application with collaboration and gamification features, built with Flutter and Firebase.

## 🚀 Features

### Phase 1 (MVP) - v0.1.0
- ✅ User authentication (email/password, anonymous)
- ✅ Create and manage multiple todo lists
- ✅ Create, edit, and complete todos
- ✅ Offline support with automatic sync
- ✅ Dark mode support
- ✅ Settings and user preferences
- ✅ Tutorial list for new users

### Phase 2 (Planned) - v0.2.0
- 🔄 Collaboration and sharing
- 🔄 Assign todos to users
- 🔄 Email notifications
- 🔄 Comments and @mentions
- 🔄 Activity logs

### Phase 3 (Planned) - v0.3.0
- 🔄 Kanban board view
- 🔄 Card grid view
- 🔄 Sprint view
- 🔄 Calendar view

### Phase 4 (Planned) - v0.4.0
- 🔄 Gamification system
- 🔄 XP and leveling
- 🔄 Rewards catalog
- 🔄 Reward redemption workflow

## 🏗️ Technology Stack

### Frontend
- **Flutter** 3.x - Cross-platform UI framework
- **Dart** 3.9.2+ - Programming language
- **Riverpod** 2.6+ - State management
- **Go Router** 14.6+ - Navigation and routing
- **Freezed** - Immutable data classes
- **Hooks** - Functional reactive programming

### Backend
- **Firebase Authentication** - User authentication
- **Cloud Firestore** - NoSQL database
- **Firebase Storage** - File storage
- **Cloud Functions** - Serverless backend logic
- **Firebase Hosting** - Web app hosting

### Development Tools
- **build_runner** - Code generation
- **flutter_lints** - Linting and code quality
- **riverpod_lint** - Riverpod-specific linting
- **mocktail** - Testing mocks
- **GitHub Actions** - CI/CD

## 📱 Supported Platforms

- ✅ Web (Progressive Web App)
- ✅ macOS
- ✅ iOS (iPhone & iPad)
- ✅ Android

## 🛠️ Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart 3.9.2 or higher
- Firebase account
- Xcode (for iOS/macOS development)
- Android Studio (for Android development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/faiseur.git
   cd faiseur
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   
   See [Firebase Setup Guide](docs/firebase-setup.md) for detailed instructions.
   
   Quick start:
   ```bash
   # Install FlutterFire CLI
   dart pub global activate flutterfire_cli
   
   # Configure Firebase for your project
   flutterfire configure
   ```

4. **Run code generation**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   # Web (recommended for initial development)
   flutter run -d chrome
   
   # macOS
   flutter run -d macos
   
   # iOS
   flutter run -d iphone
   
   # Android
   flutter run -d android
   ```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter test integration_test
```

## 📚 Documentation

- [Requirements Document](docs/requirements.md) - Detailed feature requirements
- [Design Document](docs/design.md) - UI/UX design specifications
- [Architecture Document](docs/architecture.md) - Technical architecture
- [Implementation Plan](docs/implementation-plan.md) - Development roadmap

## 🗂️ Project Structure

```
lib/
├── core/                   # Core utilities and shared code
│   ├── constants/         # App constants
│   ├── errors/            # Error handling
│   ├── extensions/        # Dart extensions
│   ├── theme/             # App theme and styling
│   └── utils/             # Utility functions
├── features/              # Feature modules
│   ├── auth/             # Authentication
│   ├── lists/            # Todo lists
│   ├── todos/            # Todo items
│   ├── templates/        # List templates
│   ├── gamification/     # Gamification system
│   └── settings/         # User settings
├── shared/               # Shared components
│   ├── widgets/         # Reusable widgets
│   ├── models/          # Shared models
│   └── providers/       # Shared providers
├── routing/             # Navigation
│   ├── app_router.dart
│   └── routes.dart
└── main.dart           # Entry point
```

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

### Development Workflow

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Coding Standards

- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use meaningful variable and function names
- Write tests for new features
- Document public APIs
- Run `flutter analyze` before committing
- Format code with `dart format .`

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase team for the robust backend platform
- Riverpod community for state management guidance
- All contributors and beta testers

## 📞 Support

- 📧 Email: support@faiseur.app
- 🐛 Bug Reports: [GitHub Issues](https://github.com/yourusername/faiseur/issues)
- 💬 Discussions: [GitHub Discussions](https://github.com/yourusername/faiseur/discussions)

## 🗺️ Roadmap

See the [Implementation Plan](docs/implementation-plan.md) for the detailed development roadmap.

### Current Focus: Phase 1 (MVP)
- [x] Project setup and architecture
- [x] Planning documents
- [ ] Firebase configuration
- [ ] Authentication system
- [ ] Lists and todos functionality
- [ ] Settings and preferences
- [ ] Tutorial and onboarding

### Next Up: Phase 2 (Collaboration)
- Sharing and collaboration
- Email notifications
- Comments system
- Activity logs

---

**Made with ❤️ using Flutter**
