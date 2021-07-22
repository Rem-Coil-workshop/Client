import 'package:flutter/material.dart';

class DropdownWidget<T> extends StatelessWidget {
  final List<T> _elements;
  final ValueChanged<T?> _onChanged;
  final T _currentElement;
  final bool isExpanded;

  const DropdownWidget({
    Key? key,
    required List<T> elements,
    required ValueChanged<T?> onChanged,
    required T currentElement,
    this.isExpanded = false,
  })  : _elements = elements,
        _onChanged = onChanged,
        _currentElement = currentElement,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      isExpanded: isExpanded,
      value: _currentElement,
      icon: const Icon(Icons.keyboard_arrow_down),
      iconSize: 24,
      onChanged: _onChanged,
      items: _elements.map<DropdownMenuItem<T>>((T element) {
        return DropdownMenuItem<T>(
          value: element,
          child: Text(element.toString()),
        );
      }).toList(),
    );
  }
}