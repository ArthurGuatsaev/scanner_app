import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/services/scanner/data/bloc/scan_bloc.dart';
import 'package:test_work/view/widgets/loading_indicator.dart';

import 'documents_box.dart';
import 'empty_box.dart';
import 'search_box.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanBloc, ScanState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const LoadingIndicator();
        }
        final docs = state.searchList;
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Image.asset('assets/images/logo.png')),
            SearchBox(searchValue: state.searchKey),
            if (state.pictures.isNotEmpty) DocumentsBox(docs: docs),
            if (state.pictures.isEmpty) const EmptyDocumentsBox(),
            const SliverToBoxAdapter(child: SizedBox(height: 60)),
          ],
        );
      },
    );
  }
}
