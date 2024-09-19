import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarsScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarsScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Estás seguro'),
              content: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam elit tellus, commodo sed dapibus a, faucibus id sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas nec molestie leo, in dignissim diam. Nam ipsum ligula, convallis ac fermentum sed, placerat eu mi. Maecenas cursus pellentesque odio at rutrum'),
              actions: [
                TextButton(onPressed: () => context.pop() , child: const Text('Cancelar')),
                FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam elit tellus, commodo sed dapibus a, faucibus id sem. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Maecenas nec molestie leo, in dignissim diam. Nam ipsum ligula, convallis ac fermentum sed, placerat eu mi. Maecenas cursus pellentesque odio at rutrum')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context),
                child: const Text('Mostrar Diálogo de pantalla.'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
