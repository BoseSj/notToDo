# Flutter Project Structure Guide

## 📁 Folder Organization

This project follows the **Layered Architecture Pattern** recommended by Google for Flutter apps.

### Directory Structure

```
lib/
├── main.dart                 # Application entry point
├── data/                     # Data layer (SSOT - Single Source of Truth)
│   ├── models/              # Domain models (immutable data classes)
│   │   ├── user_model.dart
│   │   └── todo_model.dart
│   ├── services/            # API & external data wrappers (stateless)
│   │   ├── api_service.dart
│   │   └── local_storage_service.dart
│   ├── repositories/        # Data transformers & caching logic
│   │   ├── user_repository.dart
│   │   └── todo_repository.dart
│   └── notifier.dart        # (Legacy - can be removed)
│
├── view/                     # Presentation/UI layer
│   ├── viewmodels/          # UI state management
│   │   └── dashboard_viewmodel.dart
│   ├── pages/               # Full-page layouts
│   │   └── Dashboard/
│   │       ├── dashboard.dart
│   │       └── dashboard_tree.dart
│   ├── screens/             # Screen-specific widgets
│   │   ├── feed_screen.dart
│   │   ├── following_screen.dart
│   │   └── profile_screen.dart
│   └── widgets/             # Reusable UI components
│       ├── box_widget.dart
│       ├── codingAdvices_widget.dart
│       └── homeNavBar.dart
│
└── utils/                    # Helpers & constants
    └── constants.dart
```

## 🏗️ Architecture Layers Explained

### 1. **Data Layer** (`/lib/data`)
- **Responsibility:** Single Source of Truth (SSOT) for all application data
- **Components:**
  - **Models:** Immutable Dart classes representing your data (User, Todo, etc.)
  - **Services:** Stateless classes that wrap external APIs or databases
  - **Repositories:** Combine services with caching, transformation, and retry logic

**Example Flow:**
```
API/Database → Service → Repository → ViewModel
```

### 2. **View Layer** (`/lib/view`)
- **Responsibility:** Display UI and handle user interactions
- **Components:**
  - **ViewModels:** Manage UI state and expose data to widgets
  - **Pages:** Full-page layouts (e.g., Dashboard)
  - **Screens:** Individual screen components (Feed, Following, Profile)
  - **Widgets:** Reusable UI components (buttons, cards, etc.)

### 3. **Utils** (`/lib/utils`)
- **Responsibility:** Shared utilities across the app
- **Contains:** Constants, extensions, helper functions

## 📊 Data Flow (Unidirectional)

```
┌─────────────────────────────────────────┐
│          User Interaction                │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│         Widget (UI Layer)                │
│   - Calls viewModel.selectPage()         │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│      ViewModel (Business Logic)          │
│   - Updates state                        │
│   - Calls repository methods             │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│   Repository (Data Transformation)       │
│   - Caches data                          │
│   - Calls services                       │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│      Service (External APIs)             │
│   - Fetches raw data                     │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│    Repository returns Domain Models      │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│   ViewModel notifies listeners            │
│   (widgets rebuild reactively)           │
└─────────────────────────────────────────┘
```

## 🚀 How to Use This Structure

### Adding a New Feature

Follow these steps:

1. **Create Model** (`data/models/feature_model.dart`)
   ```dart
   class Feature {
     final String id;
     final String name;
     const Feature({required this.id, required this.name});
   }
   ```

2. **Create Service** (`data/services/feature_service.dart`)
   ```dart
   class FeatureService {
     Future<List<Map>> fetchFeatures() async {
       // API call here
     }
   }
   ```

3. **Create Repository** (`data/repositories/feature_repository.dart`)
   ```dart
   class FeatureRepository {
     final FeatureService _service;
     FeatureRepository(this._service);
     
     Future<List<Feature>> getFeatures() async {
       final raw = await _service.fetchFeatures();
       return raw.map((e) => Feature(...)).toList();
     }
   }
   ```

4. **Create ViewModel** (`view/viewmodels/feature_viewmodel.dart`)
   ```dart
   class FeatureViewModel extends ChangeNotifier {
     final FeatureRepository _repository;
     List<Feature> features = [];
     
     Future<void> loadFeatures() async {
       features = await _repository.getFeatures();
       notifyListeners();
     }
   }
   ```

5. **Create View** (`view/screens/feature_screen.dart`)
   ```dart
   class FeatureScreen extends StatelessWidget {
     final FeatureViewModel viewModel;
     
     @override
     Widget build(BuildContext context) {
       return ListenableBuilder(
         listenable: viewModel,
         builder: (context, child) {
           return ListView(...);
         },
       );
     }
   }
   ```

## 📝 Current Example: Dashboard ViewModel

Your dashboard currently uses a simple ViewModel to manage navigation:

```dart
// view/viewmodels/dashboard_viewmodel.dart
class DashboardViewModel extends ChangeNotifier {
  int _selectedPageIndex = 0;
  
  int get selectedPageIndex => _selectedPageIndex;
  
  void selectPage(int index) {
    _selectedPageIndex = index;
    notifyListeners();
  }
}
```

**Used in widgets:**
```dart
// In dashboard.dart and homeNavBar.dart
ListenableBuilder(
  listenable: dashboardViewModel,
  builder: (context, child) {
    // Access dashboardViewModel.selectedPageIndex
    // Call dashboardViewModel.selectPage(index)
  },
)
```

## ✅ Next Steps

1. ✅ You've created the folder structure
2. ✅ You've converted `notifier.dart` to a proper ViewModel
3. ✅ You've created domain models (User, Todo)
4. 📋 **TODO:** Create Service classes for your APIs
5. 📋 **TODO:** Create Repository classes
6. 📋 **TODO:** Create ViewModels for Feed, Following, and Profile screens
7. 📋 **TODO:** Refactor your screens to use ViewModels

## 🎯 Key Principles

- ✅ **Separation of Concerns:** UI, Logic, and Data are separate
- ✅ **Single Responsibility:** Each class has one reason to change
- ✅ **Testability:** Services and Repositories can be tested independently
- ✅ **Scalability:** Easy to add features without massive refactoring
- ✅ **Maintainability:** Code organization makes it easy to find things

---

For more info on Flutter architecture, visit: https://flutter.dev/docs/development/data-and-backend
