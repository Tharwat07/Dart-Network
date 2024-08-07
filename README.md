# network_layer

This Flutter project demonstrates a basic network layer implementation for making HTTP requests. The app includes the following features:

- **Network Service**: A `NetworkService` class that handles HTTP requests using Dart's `HttpClient`. It supports various HTTP methods such as GET, POST, PUT, PATCH, and DELETE.
- **Authentication**: An `AuthProvider` class that extends `NetworkService` to perform authentication operations like signing in.
- **Configuration**: A `network_config.dart` file that contains configuration constants and helper functions for building URLs, adding headers, and handling request bodies.

### Key Components

1. **NetworkService**:
   - Provides a `callAPI` method to make HTTP requests.
   - Handles different HTTP methods and adds necessary headers and body to the requests.
   - Parses the response and handles errors.

2. **AuthProvider**:
   - Extends `NetworkService` to implement authentication-related methods.
   - Example method `signIn` to authenticate a user.

3. **Configuration**:
   - Contains constants like `baseUrl`, `token`, and helper functions for request handling.
   - `switchFunc` to switch between different HTTP methods.
   - `addHeaders` and `addBody` to add headers and body to the requests.

### Usage

- **Making a GET Request**:
  ```dart
  void main() {
    NetworkService.get('https://jsonplaceholder.typicode.com/posts')
        .then((value) {
      print(value);
    });
  }
  ```

- **Authentication**:
  ```dart
  void main() {
    final authProvider = AuthProvider();
    authProvider.signIn('userName', 'password');
  }
  ```

This project serves as a starting point for building more complex network interactions in a Flutter application.
