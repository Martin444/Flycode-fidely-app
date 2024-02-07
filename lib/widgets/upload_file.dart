import 'package:flutter/material.dart';

import '../utils/styles_fonts/fonts_styles.dart';

class UploadFile extends StatelessWidget {
  const UploadFile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.file_download_outlined,
            color: Colors.white,
            size: 30,
          ),
          Text(
            'Subir foto',
            style: FlTextStyle.description1,
          ),
        ],
      ),
    );
  }
}
