import 'package:flutter/material.dart';
import 'package:todo_application/BaseUtility/component/base_text.dart';
import 'package:todo_application/BaseUtility/component/image_networking.dart';

class PageClase {
  String title = "Cooking Page";
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: [
            FloatingActionButton(
                heroTag: 1,
                child: const Text("Press me"),
                onPressed: () {
                  Navigator.pushNamed(context, "/test");
                }),
            ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(
                    parent: NeverScrollableScrollPhysics()),
                itemCount: 1,
                itemBuilder: (BuildContext buildContext, int index) {
                  return Column(
                    children: [
                      const ListTile(
                        title: Text("test"),
                        subtitle: Text("test2c"),
                      ),
                      BaseText(
                        title: "สวัสดี",
                      ),
                      const ImageNetworking(
                          url:
                              "https://yt3.ggpht.com/ytc/AKedOLRnmGhH8h_Le-nLsSZwx7K0pgRA0Zdr8bU9XgXkkw=s900-c-k-c0x00ffffff-no-rj")
                    ],
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 2,
        child: const Text("to Cooking Page"),
        onPressed: () => _toCookingPage(context),
      ),
    );
  }

  _toCookingPage(BuildContext context) {
    PageClase data = PageClase();
    Navigator.pushNamed(context, "/cooking", arguments: data);
  }
}
