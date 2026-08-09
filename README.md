# 🍎 Fruitify

A modern fruit e-commerce mobile application built with **Flutter** and **Supabase**, designed to provide a smooth and simple shopping experience.

## 📱 About The Project

**Fruitify** is a Flutter-based e-commerce application for browsing and purchasing fresh fruits.

The project focuses on applying **Clean Architecture**, **BLoC/Cubit state management**, **Repository Pattern**, and **Dependency Injection** while integrating Supabase as the backend.

---

## ✨ Features

- 🔐 **Authentication**
  - Sign Up with Email & Password
  - Login with Email & Password
  - Supabase Authentication

- 🍎 **Products**
  - Browse available products
  - View product information
  - Display product prices
  - Product filtering

- 🛒 **Shopping Cart**
  - Add products to cart
  - Increase product quantity
  - Remove products from cart

- ❤️ **Favorites**
  - Add products to favorites
  - Remove products from favorites
  - Dedicated Favorites screen

- 📦 **Orders**
  - Create orders
  - View user orders
  - Display order details
  - Track order status

- 👤 **Profile**
  - Display user information
  - Profile settings
  - About Us page
  - Logout

- 🌍 **Localization**
  - Arabic language support
  - RTL layout

- 🎨 **UI / UX**
  - Modern and clean interface
  - Light & Dark Mode support
  - Responsive UI

---

## 🛠️ Tech Stack

| Technology | Usage |
|---|---|
| Flutter | Mobile Application Development |
| Dart | Programming Language |
| Supabase | Authentication & Backend |
| BLoC / Cubit | State Management |
| SharedPreferences | Local Storage |
| Flutter SVG | SVG Asset Rendering |
| ScreenUtil | Responsive UI |

---

## 🏗️ Architecture

The project follows **Clean Architecture** principles and separates the application into three main layers:

```text
lib/
│
├── core/
│   ├── assets/
│   ├── cubits/
│   ├── entities/
│   ├── errors/
│   ├── helper/
│   ├── repos/
│   ├── services/
│   ├── utils/
│   └── widgets/
│
└── features/
    │
    ├── auth/
    ├── home/
    ├── checkout/
    ├── profile/
    └── splash/
