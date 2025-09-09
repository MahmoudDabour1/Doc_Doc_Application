# Doc Doc Application
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/MahmoudDabour1/Doc_Doc_Application)

Doc Doc is a comprehensive Flutter application designed to streamline the process of finding and booking medical appointments. It connects patients with doctors, allowing for easy scheduling, management of appointments, and finding nearby clinics.

## Features

-   **User Authentication**: Secure sign-up, login, OTP verification, and password reset functionality.
-   **Onboarding**: A user-friendly introduction to the app's features.
-   **Profile Management**: Users can view and update their personal information, including their name, phone number, and profile picture.
-   **Doctor Speciality Browsing**: View a list of all available medical specialities with corresponding icons.
-   **Nearby Clinic Discovery**: Utilizes Google Maps to help users find and view nearby clinics. The map is custom-styled for a unique look and feel.
-   **Clinic Management (for Doctors)**: Doctors can register their clinics, set their location, and define their workdays and appointment slots with pricing.
-   **Appointment Booking**: A multi-step process for patients to book available appointment slots.
-   **Home Dashboard**: Displays doctor specialities and recommended doctors for easy access.
-   **Responsive UI**: Built with `flutter_screenutil` to ensure the layout adapts to different screen sizes.

## Architecture

This project is built following the principles of **Clean Architecture** to ensure a scalable, testable, and maintainable codebase. The code is organized into three main layers for each feature:

-   **Domain**: Contains the core business logic, entities, and use cases. It is independent of any other layer.
-   **Data**: Implements the repositories defined in the domain layer and handles data from sources like REST APIs and local databases.
-   **Presentation**: Contains the UI (Widgets) and the state management logic (BLoC/Cubit) that interacts with the user.

State management is handled using the **BLoC (Business Logic Component)** pattern, which helps separate business logic from the UI. **Dependency Injection** is implemented using `get_it` to manage dependencies throughout the application.

## Project Structure

The project is organized by feature, with core functionalities located in the `lib/core` directory.

```
lib/
├── core/
│   ├── networks/        # API constants and Dio helper for networking
│   ├── services/        # Service locator setup (GetIt)
│   ├── usecase/         # Base use case classes
│   └── utils/           # Shared utilities (colors, strings, helpers)
│   └── widgets/         # Common widgets used across the app
│
└── features/
    ├── auth/            # Authentication features (login, signup, OTP)
    ├── clinic/          # Clinic registration and nearby search
    ├── home/            # Home screen dashboard
    ├── speciality/      # Doctor speciality browsing
    ├── user/            # User profile and personal info management
    └── ...              # Other feature modules
```

## Key Technologies & Packages

-   **State Management**: `flutter_bloc`
-   **Networking**: `dio`
-
-   **Dependency Injection**: `get_it`
-   **UI & UX**:
    -   `flutter_screenutil` for responsive design.
    -   `google_maps_flutter` for map integration.
    -   `shimmer` for loading animations.
    -   `awesome_dialog` for custom dialogs.
    -   `easy_stepper` & `easy_date_timeline` for appointment booking UI.
-   **Local Storage**: `shared_preferences`
-   **Utilities**: `dartz`, `equatable`, `image_picker`, `geolocator`

## Setup and Installation

1.  **Clone the Repository**
    ```bash
    git clone https://github.com/mahmouddabour1/doc_doc_application.git
    cd doc_doc_application
    ```

2.  **Install Dependencies**
    ```bash
    flutter pub get
    ```

3.  **Configure API Keys**
    This project uses Google Maps. You need to provide your own API key.
    -   **Android**: Add your key to `android/app/src/main/AndroidManifest.xml`:
        ```xml
         <meta-data android:name="com.google.android.geo.API_KEY"
            android:value="YOUR_API_KEY_HERE"/>
        ```
    -   **iOS**: Add your key to `ios/Runner/AppDelegate.swift`:
        ```swift
        GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
        ```

4.  **Run the Application**
    ```bash
    flutter run
