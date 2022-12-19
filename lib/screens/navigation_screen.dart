import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Navigation Page'),
          backgroundColor: Colors.pink,
        ),
        body: const Center(
          child: Text('NavigationScreen'),
        ),
        bottomNavigationBar: const BottomCustomNavigation(),
        floatingActionButton: const FloatingCustomButton(),
      ),
    );
  }
}

class BottomCustomNavigation extends StatelessWidget {
  const BottomCustomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int notificationNumber =
        Provider.of<_NotificationModel>(context).getNumber;

    return BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.pink,
        items: [
          const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.bone), label: 'Bones'),
          BottomNavigationBarItem(
              icon: Stack(
                children: [
                  const Icon(Icons.notifications_none),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: BounceInDown(
                      from: 8,
                      animate: (notificationNumber > 0) ? true : false,
                      child: Bounce(
                        from: 8,
                        controller: (controller) =>
                            Provider.of<_NotificationModel>(context)
                                ._bounceController = controller,
                        child: Container(
                          width: 11,
                          height: 11,
                          decoration: const BoxDecoration(
                              color: Colors.redAccent, shape: BoxShape.circle),
                          alignment: Alignment.center,
                          child: Text(
                            '$notificationNumber',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              label: 'Notifications'),
          const BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.dog), label: 'My Dog'),
        ]);
  }
}

class FloatingCustomButton extends StatelessWidget {
  const FloatingCustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        int numero =
            Provider.of<_NotificationModel>(context, listen: false).getNumber;
        numero++;
        Provider.of<_NotificationModel>(context, listen: false).setNumber =
            numero;
        if (numero >= 2) {
          final controller =
              Provider.of<_NotificationModel>(context, listen: false)
                  .getBounceController;

          controller.forward(from: 0.0);
        }
      },
      backgroundColor: Colors.pink,
      elevation: 0,
      child: const FaIcon(FontAwesomeIcons.play),
    );
  }
}

class _NotificationModel extends ChangeNotifier {
  int _number = 0;
  late AnimationController _bounceController;

  int get getNumber => _number;

  set setNumber(int value) {
    _number = value;
    notifyListeners();
  }

  AnimationController get getBounceController => _bounceController;

  bounceController(AnimationController controller) {
    _bounceController = controller;
    notifyListeners();
  }
}
