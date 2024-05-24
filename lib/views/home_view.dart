import 'package:conversor/components/currency_box.dart';
import 'package:conversor/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController? homeController;
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.only(top: 100, left: 30, right: 30),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                CurrencyBox(
                  selectedItem: homeController!.toCurrencie,
                  items: homeController!.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController!.toCurrencie = model!;
                    });
                  },
                  controller: toText,
                ),
                SizedBox(
                  height: 20,
                ),
                CurrencyBox(
                  selectedItem: homeController!.fromCurrencie,
                  items: homeController!.currencies,
                  onChanged: (model) {
                    setState(() {
                        homeController!.fromCurrencie = model!;
                    });},
                  controller: fromText,
                ),
                SizedBox(
                  height: 50,
                ),
                OutlinedButton(
                    style:
                        OutlinedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      homeController!.convert();
                    },
                    child: Text(
                      style: TextStyle(color: Colors.black),
                      'Converter',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
