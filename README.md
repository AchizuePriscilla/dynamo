# dynamo

An application dynamically updates the UI based on human-like prompts .

## Building and Testing the Application

This project is a Flutter app. Below are instructions for building and testing on **Android** and **iOS** only.

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed
- Android Studio or Xcode (for iOS)
- A connected device or emulator/simulator

### 1. Install Dependencies
Run this command in the project root to install all dependencies:
```sh
flutter pub get
```

### 2. Running on Android
- Start an Android emulator or connect a physical Android device.
- Run:
```sh
flutter run -d android
```

### 3. Running on iOS
- Start an iOS simulator or connect a physical iOS device.
- Run:
```sh
flutter run -d ios
```

> **Note:** For iOS, you may need to open the `ios/` folder in Xcode and set up signing before running on a real device.

For more details, see the [Flutter documentation](https://flutter.dev/docs).
---

## Testing the Functionality of the App

After running the app on your Android or iOS device/emulator:

1. **Try the Prompt Bar:**
   - Enter one of the supported prompts (see the list displayed in the app) into the prompt bar and press "Go".
   - Example prompts:
     - `change the background color to blue`
     - `change app bar color to yellow`
     - `make the dynamo image bigger`
     - `hide the welcome message`
     - `reset`

2. **Observe UI Changes:**
   - The UI should update according to the prompt (e.g., background color changes, image size increases, welcome message hides, etc.).
   - A confirmation message will appear below the prompt bar describing the change.

3. **Use the 'Surprise Me' Feature:**
   - Enter `surprise me` in the prompt bar and press "Go".
   - The app will randomly apply one of the available effects and display a surprise message.

4. **Case Insensitivity:**
   - Prompts are case-insensitive. For example, `CHANGE APP BAR COLOR TO YELLOW` will work the same as `change app bar color to yellow`.

5. **Invalid Prompts:**
   - If you enter an unsupported prompt, the app will show a message indicating the prompt is not recognized.

---
