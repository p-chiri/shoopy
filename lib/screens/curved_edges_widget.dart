import 'package:flutter/cupertino.dart';

import 'common_shapes/curved_edges.dart';

class TCurvedEdges extends StatelessWidget {
  const TCurvedEdges({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: TCustomCurvedEdges(),
        child: child
    );
  }
}
