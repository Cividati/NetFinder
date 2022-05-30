import 'package:app/model/pedido.dart';
import 'package:app/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ViewPedido extends StatelessWidget {
  late User user;
  late Pedido pedido;
  ViewPedido({super.key, required User arg_user, required Pedido arg_pedido}) {
    user = arg_user;
    pedido = arg_pedido;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: ler todos as requisições de pedidos do usuario

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text('Pedido número #' + pedido.id.toString(),
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
              'Pedido',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_month_outlined, size: 40),
            title: Text(
              DateFormat("dd/MM/yyyy").format(pedido.dataAtendimento!),
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Data da instalação'),
          ),
          ListTile(
            leading: pedido.statusIcon,
            title: Text(
              pedido.status,
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Status'),
          ),
          ListTile(
            // leading: Icon(Icons.person, size: 40),
            title: Text(
              'Plano',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
          ),
          ListTile(
            leading: Icon(Icons.language, size: 40),
            title: Text(
              pedido.plans.isp,
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('ISP'),
          ),
          ListTile(
            leading: Icon(Icons.download, size: 40),
            title: Text(
              pedido.plans.download_speed.toString() + ' Mbps',
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
              pedido.plans.upload_speed.toString() + ' Mbps',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Velocidade de upload'),
          ),
          ListTile(
            leading: Icon(Icons.attach_money_outlined, size: 40),
            title: Text(
              pedido.plans.price_per_month.toString(),
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Mensalidade'),
          ),
          ListTile(
            leading: pedido.plans.icon,
            title: Text(
              pedido.plans.type_of_internet,
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Tipo de Internet'),
          ),
          ListTile(
            // leading: Icon(Icons.person, size: 40),
            title: Text(
              'Cliente',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            // subtitle: Text('Nome'),
          ),
          ListTile(
            leading: Icon(Icons.person, size: 40),
            title: Text(
              pedido.user.name,
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Nome'),
          ),
          ListTile(
            leading: Icon(Icons.email, size: 40),
            title: Text(
              pedido.user.email,
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
              pedido.user.phone.toString(),
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Telefone'),
          ),
          ListTile(
            leading: Icon(Icons.location_on_outlined, size: 40),
            title: Text(
              pedido.user.endereco,
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Endereço'),
          ),
          ListTile(
            // leading: Icon(Icons.person, size: 40),
            title: Text(
              'Instalador',
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            // subtitle: Text('Nome'),
          ),
          ListTile(
            leading: Icon(Icons.person, size: 40),
            title: Text(
              pedido.installer.name,
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Nome'),
          ),
          ListTile(
            leading: Icon(Icons.email, size: 40),
            title: Text(
              pedido.installer.email,
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
              pedido.installer.phone.toString(),
              style: GoogleFonts.firaSans(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(50, 50, 50, 1.0)),
            ),
            subtitle: Text('Telefone'),
          ),
        ],
      ),
    );
  }
}
