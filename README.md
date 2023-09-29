# ShayBuna Documentation

## Introduction
ShayBuna is a coffee shop application that aims to express the rich Ethiopian culture through its offerings. The name "ShayBuna" combines the English words "tea" and "coffee." This project serves as a starting point for developing a coffee shop mobile application that highlights the Ethiopian coffee tradition and provides a unique cultural experience.
If you're interested in exploring a demo video of the Shay Buna Flutter project, I invite you to watch it on TikTok. The video, available at the following URL, provides a firsthand demonstration of the project's features and functionalities:
[Shay Buna Flutter Demo Video](https://www.tiktok.com/@linat416/video/7276966436474522886)

## Getting Started
To get started with the ShayBuna project, follow the steps below:

1. Clone the repository:
   ```
   git clone https://github.com/mrnpro/ShayBuna.git
   ```
3. Open the project in your preferred Flutter development environment (e.g., Visual Studio Code, Android Studio).

4. Install the required dependencies by running the following command in the project directory:
   ```
   flutter pub get
   ```
5. Implement the CoffeeData backend:
- The ShayBuna project currently uses mock data to simulate the coffee shop functionality. To make the application work with real data, you need to implement the `CoffeeData` abstract class.
- Create a new class that extends the `CoffeeData` class and implement the required methods to fetch coffee product data from your backend server or API.
- Replace the dependency injection in `main.dart` with the new implementation of `CoffeeData`. Change the line:
  ```dart
  ChangeNotifierProvider<CoffeeDataController>(
      create: (_) => CoffeeDataController(MockDatas())
  ```
  to:
  ```dart
  ChangeNotifierProvider<CoffeeDataController>(
      create: (_) => CoffeeDataController(CoffeeDataImpl())
  ```

5. Run the application on an emulator or physical device using the following command:
  ```
   flutter run
   ```
### Features
The ShayBuna project showcases the following features:

- **Onboarding**: Provides a seamless onboarding experience for new users, introducing them to the application and its features.
- **Home page**: Displays a search coffee feature that allows users to search for specific coffee products. It also showcases categorized coffee lists, making it easy for users to browse and discover different types of coffee.
- **Product details**: Shows detailed information about a specific coffee product, including its name, description, price, and image.
- **Payment**: Integrates with Chapa payment platform to enable secure and convenient online payments for coffee purchases.
 
Please note that the payment feature is made with Chapa, a third-party payment platform. To learn more about Chapa and its integration with the ShayBuna project, you can visit their website at [https://chapa.co](https://chapa.co).

Feel free to customize and expand upon these features based on your specific requirements and the functionalities provided by the Chapa payment platform.

### Backend Integration
To make the ShayBuna application work with real data, you need to implement the `CoffeeData` abstract class. This class defines the methods for fetching coffee product data from your backend server or API. By implementing this class and injecting it into the `CoffeeDataController`, you can seamlessly integrate your backend with the application.
 
## Contributing
Contributions to the ShayBuna project are welcome. If you have any suggestions, bug fixes, or additional features to propose, feel free to open an issue or submit a pull request on the GitHub repository.

## Contact
For any further inquiries or questions regarding the ShayBuna project, you can reach out to the project owner through their GitHub profile: [mrnpro](https://github.com/mrnpro).

---

This documentation provides an overview of the ShayBuna project, its features, and instructions for getting started. It also includes information on how to implement the backend and integrate it with the application. Feel free to customize and expand upon this documentation to suit the specific needs of your coffee shop application.
