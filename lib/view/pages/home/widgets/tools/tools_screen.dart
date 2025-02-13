import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(AppLocalizations.of(context)!.tools,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 30, fontWeight: FontWeight.w700)),
          const Spacer(),
          Icon(Icons.settings, color: Colors.black.withOpacity(0.25), size: 26)
        ],
      ),
    );
  }
}
