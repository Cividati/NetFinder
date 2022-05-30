import 'package:app/model/installer.dart';
import 'package:app/model/pedido.dart';
import 'package:app/model/plans.dart';
import 'package:app/model/user.dart';
import 'package:app/view/view_solicitar_instalacao_pg2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongoDart;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ViewSolicitarInstalacaoPg1 extends StatelessWidget {
  late User user;
  late Plans plano;
  final controller_name = TextEditingController();
  final controller_email = TextEditingController();
  final controller_telefone = TextEditingController();

  ViewSolicitarInstalacaoPg1({super.key, required Plans arg_plano}) {
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
        title: Text("Solicitar Instalação",
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
              'Informações Pessoais',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
          ),
          ListTile(
            title: TextField(
              controller: controller_name,
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle_rounded, size: 40),
                labelText: 'Nome Completo',
              ),
            ),
          ),
          ListTile(
            title: TextField(
              controller: controller_email,
              decoration: InputDecoration(
                icon: Icon(Icons.email, size: 40),
                labelText: 'Email',
              ),
            ),
          ),
          ListTile(
            title: TextField(
              controller: controller_telefone,
              decoration: InputDecoration(
                icon: Icon(Icons.whatsapp, size: 40),
                labelText: 'Telefone',
                helperText: 'Celular com WhatsApp',
              ),
            ),
          ),
          ListTile(
              title: Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            width: 500,
            child: ElevatedButton(
              onPressed: () {
                User user = User(
                    id: mongoDart.ObjectId(),
                    name: controller_name.text,
                    age: 1,
                    phone: num.parse(controller_telefone.text),
                    email: controller_email.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewSolicitarInstalacaoPg2(
                            arg_user: user,
                            arg_plano: plano,
                          )),
                );
              },
              child: Text("Próximo"),
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
