import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vti_express/ui/home_page/widget/build_drawer.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations
                  .of(context)
                  .openAppDrawerTooltip,
            );
          },
        ),
        title: Text("HomePage",
            style: GoogleFonts.inter(
                textStyle: const TextStyle(fontSize: 20, color: Colors.black))),
      ),
      backgroundColor: Colors.white,
      body: ListView(),
      drawer: const BuildDrawer(),
    );
  }
}





