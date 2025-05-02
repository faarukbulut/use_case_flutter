import 'package:flutter/material.dart';

mixin ShowSheetMixin {

  static Future<T?> showCustomSheet<T>({required BuildContext context, required Widget child}){
    return showModalBottomSheet<T>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (context){
        return Column(
          children: [
            _Header(),
            Expanded(child: child),
          ],
        );
      }
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.close)
        )
      ],
    );
  }
}