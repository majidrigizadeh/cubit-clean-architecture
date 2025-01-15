
# Cubit Clean Architecture 

This project is a Flutter application that demonstrates a modular implementation of the **UserDetails** feature using **Clean Architecture** principles, **BLoC (Cubit)** for state management, and **dependency injection** with `get_it`.

---

## **Features**
- Displays user details: Name and Email.
- Accepts and validates an Iranian phone number.
- Submits the phone number to a remote data source (mocked in this example).
- Modular structure for scalability and maintainability.
- Fully adheres to **Clean Architecture**, **SOLID Principles**, and **Separation of Concerns**.

---

## **Project Structure**

The project follows the modular and layered architecture principles:

```bash
lib/
├── core/
│   ├── errors/               # Error and failure handling
│   ├── utils/                # Utility classes like validators
│   └── di/                   # Dependency injection setup
├── features/
│   ├── user_details/         # Feature module
│       ├── data/             # Data layer: models, mappers, data sources, etc.
│       ├── domain/           # Domain layer: entities, repositories, use cases
│       └── presentation/     # Presentation layer: UI and BLoC (Cubit)
├── main.dart                 # Entry point of the application
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
