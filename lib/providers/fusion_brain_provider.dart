import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:brain_fusion/brain_fusion.dart';
import 'package:provider/provider.dart';

class FusionBrainProvider extends ChangeNotifier {
 static final AI ai = AI();
  static Future<Uint8List> generate(String query, BuildContext context) async {
    final provider = Provider.of<FusionBrainProvider>(context, listen: false);
    Uint8List image =
        await ai.runAI(query, AIStyle.digitalPainting, Resolution.r1x1);
    provider.notifyListeners();
    return image;
  }
}
