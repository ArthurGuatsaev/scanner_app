import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/view/pages/home/cubit/home_cubit.dart';
import 'package:test_work/view/pages/home/widgets/documents/sub_listener.dart';
import 'widgets/actions/document_actions.dart';
import 'widgets/documents/documents_screen.dart';
import 'widgets/tools/tools_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocProvider(
        create: (context) => HomeCubit(),
        child: Scaffold(
          body: SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 16),
              child: Builder(builder: (context) {
                return BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Stack(
                      children: [
                        IndexedStack(
                          index: state.pageIndex - 1,
                          children: const [
                            DocumentsScreen(),
                            ToolsScreen(),
                          ],
                        ),
                        DocumentActions(index: state.pageIndex),
                        const SubHomeListener()
                      ],
                    );
                  },
                );
              })),
        ),
      ),
    );
  }
}
