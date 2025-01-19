

# The Job Finder

The Job Finder is a mobile application designed to simplify the job search process for job seekers and provide an efficient platform for employers to post vacancies and review potential candidates. Built using Flutter and Firebase, it leverages the MVVM architecture for scalability and maintainability and integrates Riverpod for state management.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [App Architecture](#app-architecture)
- [Setup and Installation](#setup-and-installation)
- [How to Use](#how-to-use)
- [App Screens](#app-screens)
- [Roadmap](#roadmap)
- [Acknowledgments](#acknowledgments)

---

## Introduction

The Job Finder addresses the challenges of traditional job-hunting by providing a centralized, user-friendly platform where:
- **Job seekers** can search, filter, and apply for job opportunities.
- **Employers** can post jobs, browse resumes, and connect with qualified candidates.

This project is designed to bridge the gap between job seekers and employers by utilizing modern technologies like cloud computing and big data analytics.

---
## App Screens

<div style="display: flex; flex-wrap: wrap; gap: 20px; justify-content: center; text-align: center;">

  <div style="width: 600px;">
    <img src="https://raw.githubusercontent.com/Ruchan10/theJobFinder/master/assets/screenshots/flutter_02.png" alt="Signup Page" width="300" height="600">
    <p><strong>Signup Page</strong></p>

    <img src="https://raw.githubusercontent.com/Ruchan10/theJobFinder/master/assets/screenshots/flutter_03.png" alt="Login Page" width="300" height="600">
    <p><strong>Login Page</strong></p>
  </div>
  
  <div style="width: 300px;">
    <img src="https://raw.githubusercontent.com/Ruchan10/theJobFinder/master/assets/screenshots/flutter_05.png" alt="Discover Page" width="300" height="600">
    <p><strong>Discover Page</strong></p>
  </div>
  
  <div style="width: 300px;">
    <img src="https://raw.githubusercontent.com/Ruchan10/theJobFinder/master/assets/screenshots/flutter_07.png" alt="Job Details" width="300" height="600">
    <p><strong>Job Details</strong></p>
  </div>
  
  <div style="width: 300px;">
    <img src="https://raw.githubusercontent.com/Ruchan10/theJobFinder/master/assets/screenshots/flutter_06.png" alt="Bookmark Page" width="300" height="600">
    <p><strong>Bookmark Page</strong></p>
  </div>
  
  <div style="width: 300px;">
    <img src="https://raw.githubusercontent.com/Ruchan10/theJobFinder/master/assets/screenshots/flutter_08.png" alt="Settings Page" width="300" height="600">
    <p><strong>Settings Page</strong></p>
  </div>

</div>

---

## Features

1. **Job Search**
   - Search jobs by location, industry, salary, and job type.
   - Save preferences for personalized job alerts.

2. **Job Posting**
   - Employers can post job vacancies and view resumes.
   - Review and manage applicant information.

3. **Resume Upload**
   - Job seekers can upload and update resumes for employers to review.

4. **Notifications**
   - Users receive notifications for new job postings or updates on their applications.

5. **User Profiles**
   - Create and manage detailed profiles for both employers and job seekers.

6. **Filter and Sorting**
   - Filter jobs by criteria like brand, price range, gender, and more.
   - Sort results by recent postings, highest reviews, or lowest prices.

---

## Tech Stack

- **Frontend**: Flutter (Dart)
- **Backend**: Firebase (Firestore, Authentication, Cloud Functions)
- **State Management**: Riverpod
- **Architecture**: MVVM (Model-View-ViewModel)
- **Version Control**: GitHub

---

## App Architecture

This app follows the **MVVM Design Pattern** to ensure a clear separation of concerns:
- **Model**: Handles data and business logic.
- **ViewModel**: Acts as a mediator between the Model and View.
- **View**: Displays the data to the user and interacts with the ViewModel.

For state management, **Riverpod** is used to:
- Handle dynamic updates in UI.
- Manage user preferences and job data efficiently.

---

## Setup and Installation

### Prerequisites
1. Install [Flutter](https://flutter.dev/docs/get-started/install).
2. Set up a Firebase project and configure it for your app:
   - Enable Authentication.
   - Set up Firestore for job data.
   - Download the `google-services.json` file and place it in `android/app`.

### Steps
1. Clone the repository:
   ```
   git clone https://github.com/SoftwaricaCollege/final-assignment-Ruchan10.git
   ```
2. Navigate to the project directory:
   ```
   cd final-assignment-Ruchan10
   ```
3. Install dependencies:
   ```
   flutter pub get
   ```
4. Run the app:
   ```
   flutter run
   ```

---

## How to Use

1. **Job Seekers**:
   - Sign up and complete your profile.
   - Search and filter jobs using the Discover page.
   - Apply for jobs and upload your resume.

2. **Employers**:
   - Sign up as an employer and post job vacancies.
   - Browse resumes and communicate with applicants.

---

## Roadmap

1. **Phase 1 (Complete)**:
   - Basic UI development.
   - Integration with Firebase for authentication and data storage.

2. **Phase 2 (In Progress)**:
   - Implement sorting and filtering options.
   - Replace dummy data with real-time Firestore data.

3. **Phase 3 (Future Enhancements)**:
   - Add premium features for job seekers and employers.
   - Integrate advanced analytics for job recommendations.

---

## Acknowledgments

- **Figma Design**: Provided .fig file as a blueprint.
- **Firebase**: Backend support for authentication and data handling.
- **Flutter Community**: For state management solutions like Riverpod.

Feel free to contribute, report issues, or provide feedback on the GitHub repository.

---

