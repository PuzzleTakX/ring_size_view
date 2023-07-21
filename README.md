# Ring Size View

A Flutter package that provides a custom widget for calculating and displaying ring sizes.

## Installation

To use this package, add `ring_size_view` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  flutter:
    sdk: flutter
  ring_size_view: ^1.0.0 # Use the latest version from pub.dev
  ````

Usage

````import 'package:ring_size_view/ring_size_view.dart';````


## Calculation Functions

The `calculateCircumference`, `calculateRadius`, and `calculateDiameter` functions are used in the `RingSizeView` widget to perform calculations and update the corresponding values.

### `calculateCircumference(value)`

This function is called when the user interacts with the `RingSizeView` widget and updates the value of `circumference`. It takes the calculated circumference value as an argument and updates the `circumference` variable. For example:

```dart
calculateCircumference(double value) {
  circumference = value;
  print("Info calculateCircumference : $value");
}
````


Features

    Calculate ring diameter, circumference, and radius.
    Slider to adjust the ring size.
    Customizable styles.

Getting Started

For more details and examples, check out the documentation.
Contributing

Contributions are welcome! Please fork the repository and submit a pull request.
License

This project is licensed under the Apache License 2.0 - see the LICENSE file for details.