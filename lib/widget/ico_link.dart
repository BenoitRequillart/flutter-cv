import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// flutter pub add font_awesome_flutter

Widget ico_link(var _ico, String _url) {
  return GestureDetector(
    onTap: () {
      launch(_url, forceSafariVC: false);
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.green.shade600,

        padding: const EdgeInsets.all(8),

        // Change button text when light changes state.

        child: FaIcon(
          _ico,
          color: Colors.white,
          size: 32.0,
        ),
      ),
    ),
  );
}
