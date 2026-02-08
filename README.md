# 🏭 IronSync: Offline-First Manufacturing Audit System

> **An enterprise-grade distributed system for field data collection in zero-connectivity environments.**

![Project Banner](https://img.shields.io/badge/Status-MVP_Complete-success?style=for-the-badge)
![Flutter](https://img.shields.io/badge/Mobile-Flutter-blue?style=for-the-badge&logo=flutter)
![Python](https://img.shields.io/badge/Backend-FastAPI-009688?style=for-the-badge&logo=fastapi)
![React](https://img.shields.io/badge/Web-React-61DAFB?style=for-the-badge&logo=react)
![Postgres](https://img.shields.io/badge/DB-PostgreSQL-336791?style=for-the-badge&logo=postgresql)

---

## 📖 Project Overview

**IronSync** solves a critical problem in the manufacturing industry: **data loss in dead zones**.

Factory inspectors often work in basements or Faraday cages where internet connectivity is non-existent. Standard cloud-based apps fail in these environments.

IronSync uses a **local-first architecture**, allowing inspectors to log defects and audits completely offline. When connectivity is restored, the **sync engine** automatically pushes pending data to the central server, which updates the HQ dashboard in real time.

---

## 🚀 Key Features

- **Offline-First Mobile App**  
  Built with Flutter and SQLite (Drift). Zero data loss during network failures.

- **Resilient Sync Engine**  
  Custom dirty-flag–based synchronization protocol to handle intermittent connectivity.

- **Real-Time Dashboard**  
  React-based web app for managers to monitor field operations instantly.

- **High-Performance Backend**  
  FastAPI (Python) handling high-concurrency requests with PostgreSQL.

---

## 🏗️ System Architecture

The system follows a **hub-and-spoke distributed architecture**.

````mermaid
graph LR
    A[Field Agent (Mobile)]
    B[FastAPI Gateway]
    C[(PostgreSQL DB)]
    D[HQ Manager (Web)]

    A -- Offline Storage (SQLite) --> A
    A -- Sync (JSON/HTTP) --> B
    B -- Persist --> C
    D -- Polls Data --> B

## 🧠 Technical Decisions

| Component | Tech Stack | Reason |
|----------|------------|--------|
| Mobile DB | SQLite (Drift) | ACID compliance and structured querying for thousands of offline records |
| Backend | FastAPI (Python) | High performance with async/await and rapid development |
| Protocol | REST + JSON | Lightweight, universal, and bandwidth-efficient |
| Web UI | React + Vite | Fast SPA with real-time dashboard updates |

---

## 📸 Screenshots

| Mobile Offline Mode | Sync Terminal | Manager Dashboard |
|--------------------|--------------|------------------|
| Audits stored locally (orange dot = pending) | Server acknowledging receipt | Dark-mode dashboard updating in real time |

---

## 🛠️ How to Run Locally

### Prerequisites

- Flutter SDK
- Python 3.8+
- Node.js & npm
- PostgreSQL (or Docker)

---

### 1️⃣ Backend (FastAPI)

```bash
cd backend
python -m venv venv

# Windows
venv\Scripts\activate

# macOS / Linux
source venv/bin/activate

pip install fastapi uvicorn sqlalchemy psycopg2-binary
uvicorn main:app --reload --host 0.0.0.0 --port 8000

### 2️⃣ Mobile App (Flutter)
cd mobile
flutter pub get
dart run build_runner build
flutter run

### 3️⃣ Web Dashboard (React)
cd web
npm install
npm run dev

Open: http://localhost:5173

### 🧩 Deep Dive: Sync Logic

## Creation

New audits are stored locally in SQLite with syncStatus = 1 (Pending).

## Detection

Sync service queries:

SELECT * FROM audits WHERE syncStatus = 1;

## Transmission

Records are serialized to JSON and sent to:

POST /sync/upload

## Confirmation

On receiving 200 OK, the app updates:

syncStatus = 0


This idempotent design ensures that if the network fails mid-sync, no data is corrupted—the app simply retries later.

### 🔮 Future Roadmap

 Bi-directional sync (server → mobile)
- [ ] Bi-directional sync (server → mobile)
- [ ] Conflict resolution for concurrent edits
- [ ] Image compression for low-bandwidth networks


### 👨‍💻 Author

Sourav Chahar

Role: Full Stack Engineer

Focus: Distributed Systems & Mobile Architecture
````
