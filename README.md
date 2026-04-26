# Places

<p align="center">
  <img src="Places/Assets.xcassets/AppIcon.appiconset/icon-ios-1024x1024.png" width="160" alt="Places App Icon">
</p>

<p align="center">
  <strong>A SwiftUI app that displays locations from a remote API and opens them in Wikipedia using deep links.</strong>
</p>

---

## Overview

Places is a small iOS application built as a technical assignment.

The app includes two tabs:

- *Places*: Displays a list of locations fetched from a remote API. Tapping an item opens it in Wikipedia.
- *Custom Location*: Allows users to enter latitude and longitude manually and open the location in Wikipedia.

The focus of this project is not feature complexity, but rather:
- writing clean and maintainable code
- using modern Swift concurrency
- ensuring testability
- making deliberate architectural decisions

---

## Features

- Location fetching from a remote API
- Wikipedia deep linking
- Manual coordinate input with validation
- Loading and error states
- Accessibility support with VoiceOver labels and Dynamic Type

---

## Tech Stack

- **SwiftUI**
- **Swift Concurrency (async/await)**
- **MVVM architecture**
- **Protocol-oriented design**
- **Dependency Injection**

---

## Architecture

The project follows a simple and pragmatic **MVVM architecture**:

### Why MVVM?

I chose a lightweight **MVVM architecture** for this project because it fits the scope well and keeps the code easy to understand and maintain.

**Testability**:  
ViewModels depend on protocols rather than concrete implementations, which makes it easy to inject mocks and test logic in isolation without involving the UI or network layer.

**Separation of Concerns**:  
Views are responsible only for rendering UI, while ViewModels manage state and coordinate actions. Services handle networking and reusable logic. This keeps each layer focused and easier to reason about.

**Simplicity over Complexity**:  
Given the limited scope of the project, MVVM provides a good balance between structure and simplicity without introducing unnecessary layers or abstractions.


### Responsibilities

**View**
- Renders UI
- Binds to ViewModel state
- Handles user interactions

**ViewModel**
- Holds UI state
- Coordinates user actions
- Calls services

**Services**
- Handle networking
- Contain reusable logic
- Are fully testable via protocols

---

## Project Structure

```
Places/
├── App/
│   ├── AppRootView.swift         
│   └── PlacesApp.swift        
├── Core/                   
│   ├── DeepLinking/
│   └── Networking/
├── Features/                   
│   └── Locations/
│       ├── Model/
│       ├── ViewModel/
│       └── Views/
└── Shared/                   
    ├── Coordinates/
    ├── DesignSystem/
    ├── DI/
    ├── Extensions/
    └── Resources/
```

---

## Networking

The app uses a small and focused networking layer built around a protocol-based design.

### Implementation

The `APIService` uses a session abstraction (`HTTPSession`) backed by `URLSession` and provides a generic way to fetch and decode data:

- Executes requests using async/await
- Validates HTTP status codes
- Decodes responses into strongly typed models
- Maps errors into a domain-specific `NetworkError`

### Why This Approach?

**Decoupling**  
The app depends on a protocol (`APIFetching`) rather than a concrete implementation, which improves flexibility and separation of concerns.

**Testability**  
Network calls are mocked through a lightweight `HTTPSession` abstraction, allowing tests to run deterministically without relying on real network requests or shared static state.

**Simplicity**  
The networking layer is intentionally minimal and avoids introducing unnecessary layers, keeping it easy to understand and maintain.

---

## Testing

The project includes a set of unit and integration-style tests focused on correctness and reliability.

### Strategy

The testing approach focuses on isolating responsibilities and validating API behavior, ViewModel state, and core flows.

### How Tests Are Written

**Dependency Injection + Protocols**  
Components depend on protocols rather than concrete implementations, which helps decouple components and makes it easy to replace dependencies in tests.

**Isolated Test Cases**  
Each test focuses on a single responsibility and validates behavior such as state updates, error handling, and data transformation.

**Mocking Approach**  
External dependencies are replaced with lightweight mocks:

- `MockHTTPSession` simulates networking responses for API service tests
- `MockAPIService` isolates ViewModel logic

This ensures tests are:

- Deterministic
- Fast
- Independent from external systems

**Testing Framework**  
The project uses Swift’s modern **Testing** framework, which provides a clean syntax, native async/await support, and improved readability.

### Design Decisions

I kept the test structure flat and avoided introducing unnecessary abstraction, since the scope of the project is small.

This keeps the tests easy to read, maintain, and extend without over-engineering the test suite.

---

## Trade-offs & Decisions

### 1. MVVM Architecture

I chose a lightweight **MVVM architecture** instead of more complex patterns like VIP (Clean Swift).

**Why:**
- The scope of the assignment is small
- MVVM keeps the code easy to understand and reason about
- It provides sufficient separation between UI, state, and services
- Improves maintainability

**Trade-off:**
- More layered patterns such as VIP or Clean Architecture can provide stricter separation, but would introduce unnecessary complexity for this project


### 2. Mocked Networking vs Real Network Calls

Network behavior is mocked in tests using an `HTTPSession` abstraction.

**Why:**
- Tests remain deterministic and fast
- No dependency on external APIs
- Avoids flaky tests in CI environments
- Avoids shared mutable state in network tests

**Trade-off:**
- Does not validate real API availability
- Can be extended with end-to-end tests if needed


### 3. No Third-party Dependencies

The project avoids external libraries.

**Why:**
- Keeps the project lightweight
- Demonstrates understanding of native APIs

**Trade-off:**
- Some features could be implemented faster using libraries

---

## Technical Decisions

### Swift Concurrency

The app uses modern Swift Concurrency for all asynchronous operations.

- `async/await` is used for networking
- Data models conform to `Sendable` where required for safe concurrency

This approach keeps the code simple, readable, and safe when working with asynchronous tasks.

---

## Accessibility

The app includes accessibility support to improve usability:

- VoiceOver labels for interactive elements
- Context-aware accessibility hints
- Dynamic Type support for adaptable text sizes
- Coordinate formatting optimized for screen readers

---

## Requirements & Setup

- iOS 17+
- Xcode 16+ (required for Swift 6 support)
- Wikipedia app (optional, for testing deep linking)


### Installation

Clone the repository and open the project in Xcode:

```bash
git clone <repository-url>
cd Places
open Places.xcodeproj
```

Run the app using `Cmd + R`.


### Running Tests

Run all tests using `Cmd + U` in Xcode.


### Deep Linking

To test Wikipedia integration, install the Wikipedia app on the simulator or device and open a location from either the *Places* list or the *Custom Location* tab.

---

## Final Note

This project focuses on clarity, correctness, and testability rather than over-engineering.

Given the limited scope, I intentionally avoided premature abstraction, keeping the structure pragmatic, simple, and easy to reason about.
