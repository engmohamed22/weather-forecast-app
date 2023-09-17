

This Flutter weather app is designed to provide users with up-to-date weather information for their desired locations. It offers a clean and intuitive user interface and is built using Clean Architecture principles. Below are the key features and requirements of the app:

### Features:

1. **Location Input:**
   - Users can enter the name of a city or location (e.g., "Egypt" or "Cairo") in a text input field.
   - The app also provides geolocation functionality to automatically detect the user's current location.

2. **Weather Display:**
   - The app displays current weather conditions for the specified location, including:
      - Temperature (in Celsius).
      - Weather description (e.g., "Clear sky," "Rain," "Snow").
      - Humidity percentage.
      - Wind speed.

3. **5-Day Forecast:**
   - Users can view a 5-day weather forecast that includes:
      - Date.
      - Temperature (high and low).
      - Weather description.

4. **Favourite Locations:**
   - Users can add locations to their list of favorite locations.
   - The list of favorite locations is cached for quick access.
   - Users can choose from their list of favorite locations in the app's drawer and search field for easy weather updates.

5. **Current Location Weather:**
   - Users can press a button in the app's drawer to retrieve the weather and forecast for their current location.

### Requirements:

- **Clean Architecture:** The app is built using Clean Architecture principles to ensure a well-structured and maintainable codebase.

- **User Interface:** The user interface is designed to be clean and intuitive, providing users with a seamless experience.

- **Unit Tests:** Comprehensive unit tests are written for use cases and domain logic to ensure the reliability of the app's core functionality.

- **Widget Tests:** Widget tests are included to cover individual UI components and interactions, guaranteeing that each component functions as intended.

- **Integration Tests:** Integration tests are used to verify the overall functionality of the app, ensuring that different parts of the app work harmoniously together.

### Technologies Used:

- **State Management:** The app uses the Bloc pattern for state management, allowing for efficient handling of app state.

- **API Integration:** Dio is employed to handle API integration, specifically with endpoints provided by openweathermap.org.

- **Modular Code:** The codebase is structured into multiple widgets and components, adhering to clean code principles for improved maintainability.

- **Shared Preferences:** Singleton design is utilized to create a Shared Preferences service, enabling data persistence and efficient access to user preferences.

---
