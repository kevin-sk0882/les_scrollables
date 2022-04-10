import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mes Scrollables',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Scrolle Me'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Activite> mesActivites = [
    Activite("Vélo", Icons.directions_bike),
    Activite("Peinture", Icons.palette),
    Activite("Golf", Icons.golf_course),
    Activite("Arcade", Icons.gamepad),
    Activite("Bricolage", Icons.build),
    Activite("Vélo", Icons.directions_bike),
    Activite("Peinture", Icons.palette),
    Activite("Golf", Icons.golf_course),
    Activite("Arcade", Icons.gamepad),
    Activite("Bricolage", Icons.build),
    Activite("Vélo", Icons.directions_bike),
    Activite("Peinture", Icons.palette),
    Activite("Golf", Icons.golf_course),
    Activite("Arcade", Icons.gamepad),
    Activite("Bricolage", Icons.build),
    Activite("Vélo", Icons.directions_bike),
    Activite("Peinture", Icons.palette),
    Activite("Golf", Icons.golf_course),
    Activite("Arcade", Icons.gamepad),
    Activite("Bricolage", Icons.build),
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: (orientation == Orientation.portrait) ? liste() : grille(),
      ),
    );
  }

  var back = Colors.red;

  Widget grille() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemCount: mesActivites.length,
      itemBuilder: (context, i) {
        return Container(
          margin: const EdgeInsets.all(7.5),
          child: Card(
            elevation: 10,
            child: InkWell(
              onTap: () => print("Selection de ${mesActivites[i].nom}"),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Activite",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                  Icon(
                    mesActivites[i].icone,
                    color: Colors.blue,
                    size: 30,
                  ),
                  Text(
                    mesActivites[i].nom,
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget liste() {
    return ListView.builder(
      itemBuilder: (context, i) {
        Activite activite = mesActivites[i];
        return Dismissible(
          key: Key(activite.nom),
          child: Container(
            padding: const EdgeInsets.all(5),
            height: 135,
            child: Card(
              elevation: 7.5,
              child: InkWell(
                onTap: () => print(activite.nom),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      activite.icone,
                      color: Colors.blue,
                      size: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          activite.nom,
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                          textScaleFactor: 1.5,
                        ),
                        Text(
                          "Faire du ${activite.nom}",
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                          textScaleFactor: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          background: Container(
            margin: const EdgeInsets.all(20),
            color: back,
            height: 135,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Padding(padding: EdgeInsets.only(right: 20)),
                Text(
                  "Supprimé",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              setState(() {
                back = Colors.blue;
              });
            } else {
              setState(() {
                back = Colors.red;
              });
            }
            setState(() {
              print("Activité ${mesActivites[i].nom} supprimé");
              mesActivites.removeAt(i);
            });
          },
        );
      },
      itemCount: mesActivites.length,
    );
  }
}

class Activite {
  String nom;
  IconData icone;
  Activite(this.nom, this.icone);
}
