



# EMF Detector App

### Overview
The EMF Detector app is a sophisticated tool designed to measure and display electromagnetic fields (EMF) in your surroundings. Utilizing the sensors available on your mobile device, this app provides real-time readings of the magnetic field strength, giving users insights into the levels of electromagnetic radiation they are exposed to.

### Key Features

- **Real-Time EMF Readings**: The app continuously monitors and displays the EMF levels in microteslas (µT) with high precision.
- **User-Friendly Interface**: An intuitive and visually appealing interface that is easy to navigate.
- **Radial Gauge Display**: A dynamic radial gauge that visually represents the EMF strength, categorizing the readings into safe, moderate, and dangerous zones.
- **Historical Data**: The app stores a limited history of recent readings, allowing users to observe trends and changes over time.
- **Unit Display**: The app displays the EMF readings in both numeric and textual formats, ensuring clarity and ease of understanding.

### Technical Details

- **Built with Flutter**: The app is developed using the Flutter framework, ensuring a smooth and responsive user experience across both iOS and Android platforms.
- **Sensors Plus Package**: Leverages the `sensors_plus` package for accessing the device's magnetometer sensor, which is crucial for detecting EMF levels.
- **Provider Package**: Utilizes the `provider` package for state management, ensuring that the UI updates in real-time as the sensor data changes.
- **Syncfusion Flutter Gauges**: Uses the Syncfusion Flutter Gauges package to create a visually appealing and informative radial gauge that displays the EMF readings.

### How It Works

1. **Sensor Initialization**: Upon launching the app, it initializes the magnetometer sensor to start receiving EMF data.
2. **Data Processing**: The raw data from the sensor is processed to calculate the magnitude of the electromagnetic field.
3. **UI Updates**: The processed data is then used to update the UI elements, including the radial gauge and the textual display of the EMF reading.
<p align="center">
  <img src="https://github.com/user-attachments/assets/e77f5b34-a2ed-4f4f-93b0-d490334af040" alt="Image 1" width="25%"height=500>
  <img src="https://github.com/user-attachments/assets/86453a94-e30b-4b71-8f35-9dc92b3f0449" alt="Image 2" width="25%" height=500>
</p>


### Usage Scenarios

- **Home Safety**: Identify areas in your home with high electromagnetic radiation to ensure a safe living environment.
- **Device Testing**: Test the electromagnetic emissions from various electronic devices and appliances.
- **Curiosity and Education**: Learn about electromagnetic fields and their presence in everyday environments.
