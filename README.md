
# 🛒 Pure Harvest E‑Commerce App

A sleek, full-featured **E‑Commerce mobile application** built using **Flutter**, structured with **Clean Architecture**, and backed by **Firebase** and **Supabase** for a powerful and scalable backend. The app integrates modern tools and best practices for maintainability and performance.

---

## 🖼 App Preview

![App Screenshot](assets/images/app_screenshot.jpg)

---

## 📦 Tech Stack

| Layer       | Tools/Services                             |
|-------------|--------------------------------------------|
| Frontend    | Flutter (Dart)                             |
| Backend     | Firebase (Firestore, Authentication, Storage) |
| Realtime DB | Supabase (Orders & Products data)          |
| State Mgmt  | Cubit, Provider                            |
| Styling     | Flutter Widgets & Custom Themes            |
| Payments    | Stripe                                     |
| Hosting     | Firebase Hosting or any static web host    |

---

## 📂 Project Structure

```
Pure_Harvest_e_commerce/
├── android/
├── assets/
│   ├── fonts/
│   ├── icons/
│   └── images/
├── ios/
├── lib/
│   ├── core/
│   ├── features/
│   │   ├── auth/
│   │   ├── cart/
│   │   ├── checkout/
│   │   ├── home/
│   │   ├── onboarding/
│   │   ├── order/
│   │   ├── product/
│   │   ├── profile/
│   │   └── settings/
│   ├── app.dart
│   └── main.dart
├── test/
│   ├── features/
│   └── widget_test.dart
├── pubspec.yaml
└── README.md
```

---

## ✅ Features

- 🔐 User Authentication (Firebase Email & Password)
- 🛍 Product Browsing & Details (from Firestore)
- 🛒 Add to Cart, Modify Quantities
- 🚚 Place & Track Orders
- 🎨 Light/Dark Mode Theme Switching
- 🌐 Multi-language Support (Localization)
- 💳 Stripe Payment Integration

---

## 🚀 Get Started

1. Clone the repo  
   ```bash
   git clone https://github.com/samir-227/Pure_Harvest_e_commerce.git
   ```

2. Install dependencies  
   ```bash
   flutter pub get
   ```

3. Setup Firebase for Android & iOS (add `google-services.json` / `GoogleService-Info.plist`)

4. Run the app  
   ```bash
   flutter run
   ```

---

## 🙌 Contributions

Contributions are welcome! Feel free to open issues or submit PRs to improve functionality, UI/UX, or add more features.

---

## 📬 Contact

- LinkedIn: [Samir Medhat](https://www.linkedin.com/in/samir-medhat-a321b920a/)
- GitHub: [samir-227](https://github.com/samir-227)
- Email: samermedhat227@gmail.com

---

🌱 Keep learning, keep building, and never stop exploring! 🌱
