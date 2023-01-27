import 'package:flutter/material.dart';

class ExpandableTextField extends StatefulWidget {
  final Widget child;

  const ExpandableTextField({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ExpandableTextField> createState() => _ExpandableTextFieldState();
}

class _ExpandableTextFieldState extends State<ExpandableTextField> {
  double _height = 44;
  final double _dividerSpace = 2;
  final double _dividerHeight = 40;
  final double _maxHeight = 600;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _maxHeight,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: _height,
            child: widget.child,
          ),
          SizedBox(height: _dividerSpace),
          SizedBox(
            height: _dividerHeight,
            width: 60,
            child: GestureDetector(
              child: const FittedBox(child: Text("----")),
              onPanUpdate: (details) {
                setState(() {
                  _height += details.delta.dy;

                  // prevent overflow if height is more/less than available space
                  var maxLimit = _maxHeight - _dividerHeight - _dividerSpace;
                  var minLimit = 44.0;

                  if (_height > maxLimit) {
                    _height = maxLimit;
                  } else if (_height < minLimit) {
                    _height = minLimit;
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
