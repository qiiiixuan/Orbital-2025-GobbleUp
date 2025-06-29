# 🍽️ GobbleUp

**NUS Orbital 2025 · Team GobbleUp · ID: 7035**  
Proposed Level of Achievement: **Apollo 11**

## 📌 Motivation

Looking for places to eat has become a chore in the age of overwhelming choices. With platforms like Yelp, Google, and TikTok, users are inundated with inconsistent reviews and unfiltered information. Many experience decision fatigue and struggle to choose a meal quickly and confidently.

**GobbleUp** aims to solve this problem through a fun and efficient swiping interface that connects foodies with nearby restaurants—like Tinder, but for food.

---

## 🎯 Aim

GobbleUp is a mobile platform that:
- Allows users (Gobbler) to swipe on restaurants (Gobbled) that match their preferences.
- Helps lesser-known restaurants gain exposure through randomized matching.
- Consolidates all food discovery info into a single app, reducing app-switching fatigue.
- Makes food browsing enjoyable during both meal planning and casual scrolling.

---

## 🎯 Target Audience
- **Gobbler**: Foodie users looking for places to eat.
- **Gobbled**: Restaurants seeking exposure to targeted audiences.

---

## 🧑‍💻 Tech Stack

### Frontend
- **Framework**: Flutter (Dart)

### Backend
- **Authentication**: Firebase Auth
- **Database**: Firebase Realtime Database
- **Image Hosting (Planned)**: Cloudflare R2

---

## 🔧 Software Engineering Practices

### ✅ Version Control
- Git + GitHub with a clear branching strategy.
- Use of `main`, `dev`, and `feature/` branches.
- Rebase strategy used to prevent noisy merge commits.
- Issues and milestones mapped to Orbital milestones for traceability.

### 📝 Documentation
- Inline code comments explain component purpose and usage—not every line, but enough to follow logic.
- Widget annotations clarify structure in complex UI trees.
- Helps contributors read and scale the codebase faster.

### 📱 Responsive UI
- Adaptive layout implemented via `LayoutBuilder` and `MediaQuery`.
- Components adjust dynamically to screen constraints and device orientation.
- Ensures a seamless experience on various screen sizes.

### ⚠️ Error Handling
- All asynchronous Firebase operations use `try-catch` blocks.
- User-friendly error messages via `SnackBar` alerts.
- Prevents app crashes and guides users when errors occur (e.g., invalid credentials).

### 🧹 KISS Principle
- Functions are kept concise, clear, and minimally stateful.
- Avoids deeply nested logic or convoluted side effects.

### 🔄 Continuous Integration
- Each new feature builds incrementally on stable code.
- Regular integration ensures that progress is stable and testable, not delayed until the end.

### 🧱 Data Abstraction
- Authentication and database logic are encapsulated in services.
- Widgets call high-level methods instead of implementing low-level logic themselves.

---

## 👥 User Stories

1. **As a foodie**, I want to swipe through food places based on my taste preferences.
2. **As a user with dietary restrictions**, I want to filter recommendations to fit my needs (e.g. vegetarian, halal).
3. **As a frequent restaurant-goer**, I want to leave reviews for places I love.
4. **As a restaurant owner**, I want to promote my eatery to users who match my cuisine type.
5. **As a planner**, I want to save restaurants I like for future dates or hangouts.
6. **As a responsible partner**, I want to ensure the places I choose for meals are special and high quality.

---

## 🚀 Features

| Feature                      | Status         | Description |
|-----------------------------|----------------|-------------|
| Swipe Mechanism             | ✅ Implemented | Users swipe left/right on restaurant cards |
| User Profiles               | ✅ Implemented | Custom profiles for Gobbler and Gobbled |
| Restaurant Integration      | ✅ Implemented | Restaurants can register and edit listings |
| Authentication              | ✅ Implemented | Firebase Auth for secure login |
| Reset Password              | ✅ Implemented | Allows users to recover accounts |
| External Links              | ⏳ To-do       | Links to TikTok, Maps, websites on profile |
| Saving Feature              | ⏳ To-do       | Save places you've liked/swiped right on |
| Filtering System            | ⏳ To-do       | Filter cards by cuisine, dietary needs, etc. |
| Review & Rating             | ⏳ To-do       | Add feedback and view past experiences |
| Personalized Matching       | 🔜 Future      | Smart suggestions based on user data |
| Reservation System          | 🔜 Future      | In-app reservations for swiped restaurants |

---

## 📅 Project Timeline

### ✅ Milestone 1 (by 2 June)
- Ideation, system design, and tech exploration
- Functional login & register flow
- GitHub project + issues setup

### ✅ Milestone 2 (by 30 June)
- Swipe mechanism implemented
- MVP features like account creation and login
- Initial UI complete

### ⏳ Milestone 3 (by 28 July)
- Implement filters, saving, external links
- Dark mode and region-aware suggestions
- User and system testing

---

## 🛠️ Installation Instructions

### Prerequisites
- Flutter SDK installed
- Firebase CLI (if modifying backend)
- Android Studio / VSCode emulator set up

### Steps to Run Locally

To clone the repository, run in Git Bash
```bash
git clone https://github.com/qiiiixuan/Orbital-2025-GobbleUp.git
```
After cloning, go to directory
```terminal
cd Orbital-2025-GobbleUp
```
To fetch dependencies
```terminal
flutter pub get
```
To run the program
```terminal
flutter run
```
