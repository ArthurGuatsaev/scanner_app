import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/services/scanner/data/bloc/scan_bloc.dart';

import 'menu_item.dart';

Future showScannerMenu(
    BuildContext context, AnimationController controller) async {
  return showDialog(
    context: context,
    useSafeArea: false,
    builder: (context) {
      return Stack(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                controller.reverse();
              },
              child: Container(color: Colors.transparent)),
          Positioned(
            right: 50, // Укажите положение по оси X
            bottom: 100, // Укажите положение по оси Y
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(28)),
              child: Column(
                children: [
                  MenuItem(
                      func: () {
                        controller.reverse();
                        Navigator.of(context).pop();
                        context.read<ScanBloc>().add(PressTakeScan());
                      },
                      image: 'scan',
                      name: 'Scan'),
                  const SizedBox(height: 10),
                  MenuItem(
                      func: () {
                        controller.reverse();
                        Navigator.of(context).pop();
                        context.read<ScanBloc>().add(PressTakeGallery());
                      },
                      image: 'gallery',
                      name: 'Gallery'),
                  const SizedBox(height: 10),
                  MenuItem(
                      func: () {
                        controller.reverse();
                        Navigator.of(context).pop();
                        context.read<ScanBloc>().add(PressTakeFiles());
                      },
                      image: 'files',
                      name: 'Files'),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
