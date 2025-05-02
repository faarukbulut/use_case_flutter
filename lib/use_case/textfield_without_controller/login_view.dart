import 'package:flutter/material.dart';
import 'package:use_case_flutter/use_case/textfield_without_controller/clear_action.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>{

  late final ClearTextAction textAction;
  late final ControllerCleaner _controllerCleaner;
  String value = '';

  @override
  void initState() {
    super.initState();
    textAction = ClearTextAction();
    _controllerCleaner = ControllerCleaner(textAction);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _CustomTextField(
        action: textAction,
        onChange: (String value){
          value = value;
        },
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          _homeButton(),
          _removeButton(),
        ],
      ),
    );
  }

  FloatingActionButton _homeButton() {
    return FloatingActionButton(
      child: Icon(Icons.home),
      onPressed: (){
        _controllerCleaner.update('home');
      },
    );
  }

  FloatingActionButton _removeButton() {
    return FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: (){
        _controllerCleaner.clear();
      },
    );
  }
}

class _CustomTextField extends StatelessWidget {
  _CustomTextField({
    required this.action,
    required this.onChange
  });

  final TextEditingController controller = TextEditingController();
  final ClearTextAction action;
  final void Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return ActionListener(
      action: action,
      listener: (action){
        if(action is ClearTextAction){
          if(action.text.isEmpty){
            controller.clear();
          }
          else{
            controller.text = action.text;
          }
        }
      },
      child: TextField(
        onChanged: onChange,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class ControllerCleaner{
  final ClearTextAction _clearTextAction;

  ControllerCleaner(ClearTextAction clearTextAction) : _clearTextAction = clearTextAction;

  void clear(){
    _clearTextAction.invoke(ClearTextIntent());
  }

  void update(String title){
    _clearTextAction.invoke(ClearTextIntent(text: title));
  }

}

