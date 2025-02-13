import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DocNameRow extends StatelessWidget {
  const DocNameRow({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    final data = switch (name) {
      'ScanDocument' => AppLocalizations.of(context)!.documentScanner,
      'GalleryDocument' => AppLocalizations.of(context)!.documentGallery,
      'FileDocument' => AppLocalizations.of(context)!.documentFile,
      _ => name,
    };
    return Text(data);
  }
}
