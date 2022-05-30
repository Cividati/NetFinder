import 'package:app/main.dart';
import 'package:app/model/installer.dart';
import 'package:app/model/pedido.dart';
import 'package:app/model/plans.dart';
import 'package:app/model/user.dart';
import 'package:app/view/view_mapa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongoDart;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:app/util/globalVars.dart' as globals;

class ViewSolicitarInstalacaoPg2 extends StatelessWidget {
  late User user;
  late Plans plano;
  final controller_calendar = DateRangePickerController();

  ViewSolicitarInstalacaoPg2(
      {super.key, required User arg_user, required Plans arg_plano}) {
    user = arg_user;
    plano = arg_plano;
  }
  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text('Solicitar Instalação',
            style: GoogleFonts.firaSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(50, 50, 50, 1.0))),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            // leading: Icon(Icons.person, size: 40),
            title: Text(
              'Informações do Plano',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.language, size: 40),
            title: Text(
              plano.isp,
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('ISP'),
          ),
          ListTile(
            leading: Icon(Icons.description, size: 40),
            title: Text(
              plano.description,
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Descrição'),
          ),
          ListTile(
            leading: Icon(Icons.attach_money_outlined, size: 40),
            title: Text(
              plano.price_per_month.toString(),
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Mensalidade'),
          ),
          ListTile(
            leading: plano.icon,
            title: Text(
              plano.type_of_internet,
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Tipo de Internet'),
          ),
          ListTile(
            leading: Icon(Icons.download, size: 40),
            title: Text(
              plano.download_speed.toString() + ' Mbps',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Velocidade de download'),
          ),
          ListTile(
            leading: Icon(Icons.upload, size: 40),
            title: Text(
              plano.upload_speed.toString() + ' Mbps',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Velocidade de upload'),
          ),
          ListTile(
            leading: Icon(Icons.storage, size: 40),
            title: Text(
              plano.data_capacity.toString() + ' Gb',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Capacidade'),
          ),
          ListTile(
            // leading: Icon(Icons.person, size: 40),
            title: Text(
              'Informações Pessoais',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded, size: 40),
            title: Text(
              user.name,
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Nome Completo'),
          ),
          ListTile(
            leading: Icon(Icons.email, size: 40),
            title: Text(
              user.email,
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Email'),
          ),
          ListTile(
            leading: Icon(Icons.whatsapp, size: 40),
            title: Text(
              user.phone.toString(),
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Telefone com WhatsApp'),
          ),
          Container(
            height: 15,
          ),
          ListTile(
            title: Text(
              'Data da Instalação',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Positioned(
                left: 0,
                top: 80,
                right: 0,
                bottom: 0,
                child: SfDateRangePicker(
                  controller: controller_calendar,
                  // onSelectionChanged: _onSelectionChanged,
                  // selectionMode: DateRangePickerSelectionMode.range,
                  // initialSelectedRange: PickerDateRange(
                  //     DateTime.now().subtract(const Duration(days: 4)),
                  //     DateTime.now().add(const Duration(days: 3))),
                )),
          ),
          ListTile(
              title: Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            width: 500,
            child: ElevatedButton(
              onPressed: () {
                Installer installer = Installer(
                    globals.listaChamados.length + 1,
                    'Aristeu do Guarda Chuva',
                    10,
                    3,
                    4,
                    3);

                Pedido pedido = Pedido(
                    globals.listaChamados.length + 1,
                    user,
                    installer,
                    plano,
                    'aberto',
                    controller_calendar.selectedDate);

                // Salvar JSON com os pedidos
                globals.listaChamados.add(pedido);
                globals.listaPedidos.add(pedido);

                final snackBar = SnackBar(
                  content: Row(children: [
                    Text('Instalação Solicitada'),
                    Spacer(),
                    Icon(
                      Icons.check,
                      size: 40,
                      color: Color.fromARGB(137, 21, 255, 0),
                    ),
                  ]),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewMapa()),
                );
              },
              child: Text("Agendar Instalação"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
            ),
          ))
        ],
      ),
    );
  }
}
