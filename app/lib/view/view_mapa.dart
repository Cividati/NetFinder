import 'package:app/database/database.dart';
import 'package:app/model/plans.dart';
import 'package:app/model/user.dart';
import 'package:app/view/meus_chamados.dart';
import 'package:app/view/meus_pedidos.dart';
import 'package:app/view/readCSV.dart';
import 'package:app/view/switchScreen.dart';
import 'package:app/view/view_solicitar_instalacao_pg1.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongoDart;
import 'package:permission_handler/permission_handler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:floating_pullup_card/floating_pullup_card.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/installer.dart';
import '../util/marker_generator.dart';
import 'package:label_marker/label_marker.dart';

class ViewMapa extends StatefulWidget {
  const ViewMapa({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

void onMarkerClicked(MarkerId marker) {}

class _MyAppState extends State<ViewMapa> {
  FloatingPullUpState pullUpState = FloatingPullUpState.hidden;
  Plans selectedPlan = Plans(-1, "", 0, 0, 0, "", 0, "", LatLng(0, 0));
  final Map<String, Marker> _markers = {};
  Set<Marker> theMarkers = {};
  late GoogleMapController mapController;

  final LatLng _center = LatLng(-22.2524903, -45.7034723);

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    controller.setMapStyle(
        '[{"featureType":"landscape.man_made","elementType":"geometry","stylers":[{"visibility":"off"}]},{"featureType":"poi.business","stylers":[{"visibility":"off"}]},{"featureType":"poi.park","elementType":"labels.text","stylers":[{"visibility":"off"}]}]');

    PlansParser parser = PlansParser();
    List<dynamic> planList = await parser.readJson();

    for (var plan in planList) {
      MarkerId id = MarkerId(plan.id.toString());
      print(plan.id.toString());
      MarkerGenerator markerGen = MarkerGenerator(100);

      BitmapDescriptor icon =
          await markerGen.createBitmapDescriptorFromIconData(
              Icons.settings_ethernet,
              Colors.black87,
              Colors.red,
              Colors.white70);

      switch (plan.type_of_internet) {
        case "sat":
          icon = await markerGen.createBitmapDescriptorFromIconData(
              Icons.satellite_alt,
              Colors.black87,
              Colors.orange,
              Colors.white70);
          break;

        case "fiber":
          icon = await markerGen.createBitmapDescriptorFromIconData(
              Icons.cable, Colors.black87, Colors.blue, Colors.white70);
          break;

        case "radio":
          icon = await markerGen.createBitmapDescriptorFromIconData(
              Icons.radio, Colors.black87, Colors.yellow, Colors.white70);
          break;

        case "adsl":
          icon = await markerGen.createBitmapDescriptorFromIconData(
              Icons.import_export,
              Colors.black87,
              Colors.green,
              Colors.white70);
          break;

        case "dialup":
          icon = await markerGen.createBitmapDescriptorFromIconData(
              Icons.phone, Colors.black87, Colors.red, Colors.white70);
          break;

        default:
          icon = await markerGen.createBitmapDescriptorFromIconData(
              Icons.question_mark, Colors.black87, Colors.red, Colors.white70);
          break;
      }

      final marker = Marker(
          markerId: id,
          position: plan.pos,
          // infoWindow: InfoWindow(title: plan.isp, snippet: plan.description),
          icon: icon,
          onTap: () {
            pullUpState = FloatingPullUpState.uncollapsed;
            selectedPlan = plan;
            setState(() {});
          });
      theMarkers.add(marker);

      /*
      theMarkers
          .addLabelMarker(LabelMarker(
        label: plan.isp,
        markerId: id,
        position: plan.pos,
        icon: icon,
        backgroundColor: Colors.green,
      ))
          .then(
        (value) {
          setState(() {});
        },
      );

      final marker2 = Marker(
          markerId: MarkerId(plan.id.toString() + "_gambis"),
          position: LatLng(plan.pos.latitude - 0.0004, plan.pos.longitude),
          // infoWindow: InfoWindow(title: plan.isp, snippet: plan.description),
          icon: icon,
          onTap: () {
            pullUpState = FloatingPullUpState.uncollapsed;
            selectedPlan = plan;
            setState(() {});
          });
      theMarkers.add(marker2);
      */
    }

    setState(() {});
  }

  bool floatingMenu_isVisible = false;

  void showFloatingMenu() {
    // bugfix
    pullUpState = FloatingPullUpState.hidden;
    floatingMenu_isVisible = !floatingMenu_isVisible;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Objects mockados
    User user = User(
        name: 'Rubens Cividati',
        email: 'rubens.cividati@gmail.com',
        age: 23,
        id: mongoDart.ObjectId(),
        phone: 359990990);

    // TODO: The Rick
    return Scaffold(
      body: FloatingPullUpCardLayout(
        // ignore: sort_child_properties_last
        child: Stack(children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            padding: EdgeInsets.only(bottom: 75.0, top: 110.0),
            initialCameraPosition: const CameraPosition(
              target: LatLng(-22.252821555207184, -45.704606687617975),
              zoom: 17,
            ),
            markers: theMarkers,
          ),
          Container(
              margin: EdgeInsets.only(top: 35.0, left: 5.0, right: 5.0),
              // TODO: altura hardcoded
              height: 70,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      Container(
                          padding: EdgeInsets.only(top: 10.0, left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Você está em",
                                  style: GoogleFonts.firaSansCondensed(
                                      fontSize: 12, color: Colors.black38)),
                              Text("Santa Rita do Sapucaí",
                                  style: GoogleFonts.firaSans(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(50, 50, 50, 1.0))),
                            ],
                          )),
                      // TODO: espaçamento hardcoded
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(right: 10.0),
                        child: IconButton(
                            alignment: Alignment.centerRight,
                            // padding: EdgeInsets.only(left: 10),
                            icon: const Icon(Icons.menu,
                                color: Colors.black54, size: 36.0),
                            onPressed: () async {
                              // User u = User(
                              //     name: "We're no strangers to love",
                              //     id: mongoDart.ObjectId(),
                              //     age: 13,
                              //     phone: 3535);
                              // await MongoDatabase.connect();
                              // await MongoDatabase.insert(u);

                              showFloatingMenu();
                              print('showFloatingMenu: ' +
                                  floatingMenu_isVisible.toString());
                            }),
                      ),
                    ])),
              )),
          Visibility(
              visible: floatingMenu_isVisible,
              child: Container(
                alignment: Alignment.center,
                height: 330,
                // padding: EdgeInsets.only(top: 20.0),
                child: Card(
                  elevation: 10,
                  margin: EdgeInsets.all(70),
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, top: 20),
                    child: Row(mainAxisSize: MainAxisSize.max, children: [
                      Container(
                          padding: EdgeInsets.only(top: 10.0, left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('Menu Principal',
                                      style: GoogleFonts.firaSans(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(50, 50, 50, 1.0))),
                                  IconButton(
                                      padding: EdgeInsets.only(left: 37),
                                      icon: const Icon(Icons.close,
                                          color: Colors.black54, size: 40.0),
                                      onPressed: () async {
                                        showFloatingMenu();
                                      }),
                                ],
                              ),

                              // Text(user.email,
                              //     style: GoogleFonts.firaSansCondensed(
                              //         fontSize: 18, color: Colors.black38)),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MeusPedidos(
                                              arg_user: user,
                                            )),
                                  );
                                },
                                child: Text("Meus Pedidos",
                                    style: GoogleFonts.firaSansCondensed(
                                        fontSize: 20,
                                        color: Color.fromARGB(176, 0, 0, 0))),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MeusChamados()),
                                  );
                                },
                                child: Text("Meus Chamados",
                                    style: GoogleFonts.firaSansCondensed(
                                        fontSize: 20,
                                        color: Color.fromARGB(176, 0, 0, 0))),
                              ),
                            ],
                          )),
                    ]),
                  ),
                ),
              )),
        ]),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // BOTTOM CARD
              Container(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      // HEADER
                      Container(
                          padding: EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // ICON
                                  Column(
                                    children: [selectedPlan.icon],
                                  ),
                                  SizedBox(width: 20),
                                  // TEXT
                                  Text(selectedPlan.isp,
                                      style: GoogleFonts.firaSans(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromRGBO(50, 50, 50, 1.0))),
                                ],
                              ),
                            ],
                          )),
                    ]),

                    // SPACING
                    SizedBox(height: 30),

                    // CONTENT
                    Container(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),

                        // SPEEDS
                        child: Row(children: [
                          // download
                          Column(
                            children: [
                              Text(
                                selectedPlan.download_speed.toString(),
                                style: GoogleFonts.ibmPlexMono(
                                    fontSize: 32, color: Colors.black54),
                              ),
                              Text(
                                "Download",
                                style: GoogleFonts.firaSans(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              )
                            ],
                          ),
                          Spacer(),

                          // upload
                          Column(
                            children: [
                              Text(
                                selectedPlan.upload_speed.toString(),
                                style: GoogleFonts.ibmPlexMono(
                                    fontSize: 32, color: Colors.black54),
                              ),
                              Text(
                                "Upload",
                                style: GoogleFonts.firaSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black54),
                              )
                            ],
                          ),
                          Spacer(),
                          // Jitter
                          Column(
                            children: [
                              Text(
                                "R\$" + selectedPlan.price_per_month.toString(),
                                style: GoogleFonts.ibmPlexMono(
                                    fontSize: 32, color: Colors.black54),
                              ),
                              Text(
                                "Mensalidade",
                                style: GoogleFonts.firaSans(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black54),
                              )
                            ],
                          ),
                        ])),

                    SizedBox(height: 40),

                    // DESCRIPTION
                    Container(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Text(
                          textAlign: TextAlign.justify,
                          selectedPlan.description),
                    ),

                    SizedBox(height: 20),

                    // INSTALL BUTTON
                    Container(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      width: 500,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ViewSolicitarInstalacaoPg1(
                                        arg_plano: selectedPlan)),
                          );
                        },
                        child: Text("INSTALAR"),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        autoPadding: false,
        width: MediaQuery.of(context).size.width - 20.0,
        state: pullUpState,
      ),
    );
  }
}
