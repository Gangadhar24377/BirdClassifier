# Bird Species Classifier using MobileNet-v2 and CNN

**This repository contains a deep learning model and a Flutter app that allows users to classify bird species accurately using the MobileNet-v2 and CNN architectures. The model has been trained on a large dataset of bird images, ensuring high accuracy in bird species predictions.**

## Model Architecture

**The bird species classifier model consists of two main components:**

1. **MobileNet-v2:** MobileNet-v2 is a lightweight deep neural network architecture optimized for mobile and embedded vision applications. It serves as the base model for feature extraction from bird images.

2. **Convolutional Neural Network (CNN):** A custom CNN has been integrated on top of MobileNet-v2 to fine-tune the model specifically for bird species classification. The CNN layers are responsible for learning bird-specific features and improving the model's accuracy.

**The combined architecture of MobileNet-v2 and CNN provides an efficient and accurate model for predicting the bird species from input images.**

## Dataset

**The model has been trained on a diverse dataset of bird images, sourced from various publicly available datasets and image repositories. The dataset contains images of different bird species with appropriate labels. Data augmentation techniques have been employed to increase the diversity of the training data and enhance the model's generalization.**

**The Dataset Used in the project 👉**
[Dataset](https://www.kaggle.com/datasets/gpiosenka/100-bird-species)




## Model Integration into Flutter App

**The trained bird species classifier model has been integrated into a Flutter mobile application. The Flutter app provides an intuitive user interface for users to interact with the model and predict the species of a bird from a given image. Users can either upload an image from their gallery or capture a new image using the device's camera.**

## Installation

**To set up the Flutter app and run it on your device, follow these steps:**

1. **Clone this repository to your local machine.**


2. **Navigate to the 'flutter_app' directory.**


3. **Install the required dependencies using Flutter.**


4. **Launch the app on your connected device (emulator or physical device).**


## Usage

1. **Once the app is running, you will be presented with a simple and user-friendly interface.**

2. **You can either select an image from your gallery or use the camera option to capture a new image of a bird.**

3. **After selecting/capturing an image, the app will process the image through the trained model.**

4. **The model will predict the bird species from the image and display the result on the screen with the associated confidence score.**

5. **Users can view the predicted bird species name along with the confidence score to assess the accuracy of the prediction.**

## Model Performance

**The bird species classifier model has been trained with utmost care to ensure high accuracy. However, it's important to note that the model's performance might vary depending on the quality and diversity of the input images. For optimal results, try to use clear and well-focused images of birds.**

## Contributing

**We welcome contributions to improve the model's accuracy, add new features to the Flutter app, and enhance the overall user experience. If you wish to contribute, please follow the standard GitHub fork and pull request workflow.**


## Acknowledgments

**We would like to express our gratitude to the open-source community and the developers of the MobileNet-v2 architecture for their valuable contributions.**

**If you have any questions or suggestions, feel free to reach out to us or open an issue in the repository.**

**Happy bird species classification! 🐦**
