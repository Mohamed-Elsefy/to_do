# to_do

📝 To-Do App (Flutter)

A Flutter To-Do application that provides full local CRUD functionality with persistent offline storage, modern state management, and a clean, scalable architecture.

Flutter App — Local CRUD, State Management, Offline Storage


📌 Overview

This project is a task management (To-Do) application built with Flutter.
It focuses on applying best practices, clean architecture, and reusable components, making it suitable as a portfolio project and for real-world extension.

The app works fully offline and preserves data across app restarts.


✨ Features
Core Features

✅ Create, update, and delete tasks (CRUD)

✅ Persistent local storage using Hive

✅ State management with Riverpod

✅ Task completion toggle

✅ Due date selection

✅ Task priority (Low / Medium / High)

✅ Task tags

✅ Undo delete action

✅ Responsive and clean UI

✅ Custom splash screen and app icon


🧱 Tech Stack
Technology                 	Description

Flutter     	            UI framework
Dart	                    Programming language
Riverpod                    State management
Hive	                    Local NoSQL database
hive_flutter	            Flutter integration for Hive
uuid	                    Unique ID generation
flutter_native_splash   	Splash screen
flutter_launcher_icons	    App icons


📂 Project Structure
lib/
├─ main.dart
├─ models/
│  ├─ task.dart
│  └─ task_adapter.dart
├─ services/
│  ├─ storage_service.dart
│  └─ hive_storage_service.dart
├─ providers/
│  └─ task_provider.dart
├─ screens/
│  ├─ home_screen.dart
│  └─ task_edit_screen.dart
├─ widgets/
│  ├─ task_tile_widget.dart
│  ├─ app_bar_widget.dart
│  └─ ...
├─ utils/
│  ├─ constants/
│  ├─ themes/
│  └─ ui_helper.dart


🧠 Architecture

Separation of Concerns

    UI Layer: Screens & Widgets

    State Layer: Riverpod StateNotifiers

    Data Layer: StorageService abstraction

Storage Abstraction

    Makes it easy to switch from Hive to Sqflite or a remote API later

Optimistic UI Updates

    UI updates immediately before persistence completes


👤 Author

Name: Mohamed

Role: Flutter Developer

Focus: Clean architecture, scalable Flutter apps, and best practices


📄 License

This project is open-source and available for learning and educational purposes.