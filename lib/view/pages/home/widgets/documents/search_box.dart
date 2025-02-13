import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:test_work/services/scanner/data/bloc/scan_bloc.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key, required this.searchValue});
  final String searchValue;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34), color: Colors.white),
        height: 56,
        child: TextFormField(
          initialValue: searchValue,
          onChanged: (value) =>
              context.read<ScanBloc>().add(PressSearchValue(value: value)),
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: AppLocalizations.of(context)!.search,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black.withOpacity(0.25)),
              prefixIcon: const Icon(Icons.search, size: 25),
              prefixIconColor: Colors.black.withOpacity(0.25),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20)),
        ),
      ),
    );
  }
}
