# 🏦 Banking Management System

A full-stack Banking Management System built using **Java, Spring Boot, Spring MVC, Hibernate (JPA), Oracle Database, JSP, HTML, CSS, and JavaScript**. The application enables users to securely manage their accounts, transfer funds, track transaction history, and perform banking operations through an intuitive and responsive interface.

---

## 📌 Project Overview

The Banking Management System is designed to simulate core banking operations while following industry-standard development practices such as MVC architecture, layered design, session management, database integration, and transaction processing.

The application allows users to:

* Register and create an account
* Login securely
* Upload and manage profile images
* Check account balance using PIN verification
* Transfer money between users
* View transaction history
* Track sent and received transactions
* Manage account information through a responsive UI

---

## 🚀 Features

### 👤 User Management

* User Registration
* User Login Authentication
* Session-Based Authentication
* Profile Management
* Profile Image Upload and Display

### 🔒 Security Features

* Secure PIN Verification
* Session Handling
* Authentication Validation
* Input Validation
* Protected Banking Operations

### 💰 Banking Operations

* Balance Inquiry
* Fund Transfer Between Users
* Sender and Receiver Validation
* Automatic Balance Updates
* Transaction Processing

### 📜 Transaction Management

* Transaction Recording
* Transaction History
* Sent Transaction Tracking
* Received Transaction Tracking
* Chat-Style Transaction Interface

### 🎨 User Interface

* Responsive JSP Pages
* Mobile-Friendly Design
* Interactive Banking Dashboard
* Transaction Success Animations
* Clean Banking-Themed UI

---

## 🏗️ Architecture

The project follows the **MVC (Model-View-Controller)** architecture.

Client
   │
   ▼
Controller Layer
   │
   ▼
Service Layer
   │
   ▼
Repository Layer
   │
   ▼
Oracle Database
```

### Layers Used

1. Controller Layer

Handles incoming HTTP requests and user actions.

2. Service Layer

Contains business logic such as:

* Money Transfer
* Balance Management
* PIN Verification
* User Validation

3. Repository Layer

Handles database operations using Spring Data JPA.

4. Database Layer

Stores:

* User Information
* Transaction Records
* Profile Images
* Account Details

---

## 🛠️ Technologies Used

### Backend

* Java
* Spring Boot
* Spring Boot MVC
* Hibernate
* JPA
* Spring Data JPA

### Frontend

* JSP
* HTML5
* CSS3
* JavaScript

### Database

* Oracle Database

### Build Tool

* Maven

### Version Control

* Git
* GitHub

---

## 📂 Project Structure

```text
src
 ├── controller
 ├── service
 ├── repository
 ├── entities
 ├── configuration
 └── resources

webapp
 ├── JSP Pages
 ├── CSS
 ├── Images
 └── JavaScript
```

---

## 🗄️ Database Tables

### User Table

Stores:

* User ID
* Name
* Email
* Password
* PIN
* Balance
* Profile Image

### Transaction Table

Stores:

* Transaction ID
* Sender Account
* Receiver Account
* Amount
* Action
* Transaction Date
* Transaction Time

---

## 🔄 Money Transfer Workflow


User Login
     │
     ▼
Select Receiver
     │
     ▼
Enter Amount
     │
     ▼
PIN Verification
     │
     ▼
Balance Validation
     │
     ▼
Deduct Sender Balance
     │
     ▼
Credit Receiver Balance
     │
     ▼
Create Transaction Record
     │
     ▼
Transfer Successful
```

---

## 📱 Screens

The application includes:

* Registration Page
* Login Page
* Home Dashboard
* Profile Page
* Balance Inquiry Page
* Transfer User Page
* Transaction Chat Interface
* Transaction History Page
* Transfer Success Page

---

## 🎯 Learning Outcomes

Through this project, I gained practical experience in:

* Spring Boot Development
* MVC Architecture
* Hibernate ORM
* Oracle Database Integration
* Session Management
* Authentication & Authorization
* JPA Repository Operations
* Responsive Web Design
* Transaction Processing
* Full Stack Development

---

## 🔮 Future Enhancements

Planned improvements:

* Email Notifications
* Password Encryption
* Transaction Search & Filters
* Admin Dashboard
* REST API Integration
* OTP Verification
* Account Statement Download (PDF)
* Microservices Architecture

---


---

## ⚙️ Installation

### Clone Repository

```bash
git clone https://github.com/shaikhasef/Banking-Management-System.git
```

### Navigate to Project

```bash
cd banking-management-system
```

### Configure Database

Update database credentials in:

```properties
application.properties
```

### Run Application

```bash
mvn spring-boot:run
```

### Open Browser

http://localhost:4041/bms/
```

---

## 👨‍💻 Author

**Shaikh Asef**

Java Developer | Spring Boot Enthusiast

LinkedIn: https://www.linkedin.com/in/shaikh-asef-7546b52b2?utm_source=share_via&utm_content=profile&utm_medium=member_android

GitHub: https://github.com/shaikhasef

---

## ⭐ Support

If you found this project helpful, consider giving it a ⭐ on GitHub.
