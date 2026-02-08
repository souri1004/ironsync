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

```mermaid
graph LR
    A[Field Agent (Mobile)]
    B[FastAPI Gateway]
    C[(PostgreSQL DB)]
    D[HQ Manager (Web)]

    A -- Offline Storage (SQLite) --> A
    A -- Sync (JSON/HTTP) --> B
    B -- Persist --> C
    D -- Polls Data --> B
