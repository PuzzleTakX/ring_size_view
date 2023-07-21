import 'package:flutter_test/flutter_test.dart';

import 'package:ring_size_view/ring_size_view.dart';

void main() {
  test('adds one to input values', () {
    return RingSizeView(ringSize: 6.5, calculateDiameter: (e){},
        calculateRadius: (e){},
        calculateCircumference: (e){},
        height: 190, width: 190);
  });
}
