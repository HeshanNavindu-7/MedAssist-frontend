# MedAssist - Flutter Frontend 🚀

Welcome to the **MedAssist** Flutter Frontend repository! This project is part of the MedAssist mobile application, designed to simplify healthcare information and enhance decision-making for users through features like medical report analysis, personalized doctor recommendations, and interactive AI-based healthcare insights.

## Features 🌟
- **Medical Report Analysis**: Upload and analyze medical reports with easy-to-understand explanations. 📄🔍
- **Doctor Recommendations**: Personalized healthcare provider suggestions based on the user’s medical condition. 🏥👨‍⚕️👩‍⚕️
- **AI Chatbot**: A virtual assistant offering healthcare information and answering user questions. 🤖💬
- **Image Classification**: Analyze CT, X-ray, MRI, and PET scans to provide preliminary diagnoses. 🩺🖼️
- **User Feedback Portal**: Users can rate and provide feedback on their healthcare experiences. ⭐📝

## Tech Stack 🛠️
- **Flutter**: The frontend of the application is built using Flutter for cross-platform mobile app development. 📱
- **Dart**: Flutter’s primary programming language. 🏷️
- **Django**: Backend framework for handling APIs, user authentication, and data processing. 🔄
- **Firebase**: For user authentication and real-time updates. 🔥
- **REST API**: Integrated with Django backend services for report analysis, doctor recommendations, and chatbot functionality. 🌐

## Getting Started 🚀

### Prerequisites
- Flutter SDK installed on your machine. 📦
- A configured Django backend. 🔧
- Firebase project set up for authentication. 🔑

### Installation 🛠️
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/medassist-frontend.git
   cd medassist-frontend
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Set up Firebase by adding your `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files in the respective directories. 📁

4. Configure the Django backend API URLs in the Flutter project. Update the `lib/services/api_service.dart` file with the correct endpoint URLs. 📝

5. Run the app:
   ```bash
   flutter run
   ```
