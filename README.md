## Features

A widget that provides a callback that is triggered when its size changes even when it is offstage.

## Usage

```dart
import 'package:widget_size_observer/widget_size_observer.dart';

Widget build(BuildContext context) {
  Size? size;
  return WidgetSizeObserver(
    offstage: false,
    onSizeChanged: (size) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          this.size = size;
        });
      });
    },
    child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
  );
}

```