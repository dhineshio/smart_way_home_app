import 'package:flutter/material.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildExpanded(20, 10),
        const Text(
          "OR",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        _buildExpanded(10, 20)
      ],
    );
  }

  Widget _buildExpanded(double indent, double endIndent) {
    return Expanded(
      child: Divider(
        height: 2,
        thickness: 2,
        indent: indent,
        endIndent: endIndent,
      ),
    );
  }
}
