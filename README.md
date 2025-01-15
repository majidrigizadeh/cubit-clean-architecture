
# Cubit Clean Architecture, 


### This is Isolated module version, for Folder base feature you can see [feature/folder_base branch](https://github.com/majidrigizadeh/cubit-clean-architecture/tree/feature/folder_base)

This project is a Flutter application that demonstrates a modular implementation of the **UserDetails** feature using **Clean Architecture** principles, **BLoC (Cubit)** for state management, and **dependency injection** with `get_it`.

---

## **Project Structure**

The project follows the modular and layered architecture principles:

```bash
lib/
├── core/
│   └── di/                   # Dependency injection setup
│   └── navigation/           # Routing 
├── main.dart                 # Entry point of the application
shared/                       # Shared Files
user_details/                 # Feature module
├── data/                     # Data layer: models, mappers, data sources, etc.
├── domain/                   # Domain layer: entities, repositories, use cases
└── presentation/             # Presentation layer: UI and BLoC (Cubit)
```

---

## **Installation and Setup**

Follow these steps to set up and run the project:

### **Step 1: Clone the Repository**

```bash
git clone https://github.com/majidrigizadeh/cubit-clean-architecture
cd cubit-clean-architecture
```

### **Step 2: Install Dependencies**

Run the following command to install the required dependencies:

```bash
flutter pub get
```

### **Step 3: Run the Application**

Run the project using the following command:

```bash
flutter run
```

Make sure you have an emulator or physical device connected.

---

## **How to Create and Use a Feature Module**


### **Step 1: Create a Feature Module**

To create an isolated feature module, run:

```bash
flutter create --template=package user_details_module
```

This creates a standalone Dart/Flutter package named `user_details_module` with its own `pubspec.yaml`.

---

### **Step 2: Develop the Feature Module**

1. Navigate to the module directory:

   ```bash
   cd user_details_module
   ```

2. Implement the `lib/` structure:
    - `data/`: Models, data sources, and mappers.
    - `domain/`: Use cases, entities, and repositories.
    - `presentation/`: UI components and BLoC (Cubit) logic.

3. Add feature-specific dependencies to the module's `pubspec.yaml` file. For example:

   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     flutter_bloc: ^8.1.0
     get_it: ^7.6.0
   ```

---

### **Step 3: Integrate the Feature Module into the Master App**

1. Add the feature module as a dependency in the main app's `pubspec.yaml`:

   ```yaml
   dependencies:
     user_details_module:
       path: user_details_module
   ```

2. Import the module in the main app:

   ```dart
   import 'package:user_details_module/user_details_module.dart';

   ...
   MaterialPageRoute(
          builder: (_) => UserDetailsModule.create(),
        );

   ....

   await initUserDetailsModule();   

   ...
   ```

---

## **Advantages of Feature Module (Isolated Development)**

1. **Independent Development**:
   Each module is self-contained, allowing teams to work on features independently.

2. **Reusability**:
   Feature modules can be reused across multiple projects.

3. **Scalability**:
   Clear separation of concerns enables better scalability for large projects.

4. **Testing**:
   Modules can be tested independently without depending on the main app.

---

## **How It Works**

1. The feature module (e.g., `user_details_module`) is developed as a package.
2. The main app integrates the package using a `path` dependency.
3. Each module contains its own `data`, `domain`, and `presentation` layers.

---

## **Dependencies**

Each feature module has its own `pubspec.yaml`. For this project, the `user_details_module` module includes:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.0
  get_it: ^7.6.0
```

In the main app, the module is included as a local dependency.

---
