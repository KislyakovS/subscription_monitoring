import 'package:flutter/material.dart';
import 'package:subscription_monitoring/models/Subscription.dart';

import 'components/body.dart';
import 'form_model.dart';
import 'form_provider.dart';

class FormScreen extends StatefulWidget {
  static String routeName = '/form';

  FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  FormModel? _model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_model == null) {
      final arguments =
          ModalRoute.of(context)!.settings.arguments as FormArguments;

      _model = FormModel(
          subscription: arguments.subscription, isUpdate: arguments.isUpdate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = _model;

    if (model == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return FormModelProvider(
      model: model,
      child: Scaffold(
        appBar: _AppBar(),
        // body: Body(),
      ),
    );
  }
}

class ForModel {}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final model = FormModelProvider.read(context)?.model;
    final isUpdate = model?.isUpdate;
    final subscription = model?.subscription;

    return AppBar(
      title: Text(
        subscription != null ? subscription.title : 'New subscription',
        style: const TextStyle(color: Colors.black),
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.transparent),
          ),
          onPressed: () => model?.save(),
          child: Text(
            isUpdate == true ? 'Update' : 'Save',
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}

class FormArguments {
  final Subscription? subscription;
  final bool isUpdate;

  FormArguments({
    this.subscription,
    this.isUpdate = false,
  });
}
