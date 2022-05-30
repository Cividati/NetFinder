import 'package:app/model/pedido.dart';
import 'package:app/model/user.dart';
import 'package:app/view/view_mapa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app/util/globalVars.dart' as globals;
import 'package:intl/intl.dart';

class ViewChamado extends StatelessWidget {
  late User user;
  late Pedido pedido;
  ViewChamado({super.key, required Pedido arg_pedido}) {
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
        title: Text('Chamado #' + pedido.id.toString(),
            style: GoogleFonts.firaSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(50, 50, 50, 1.0))),
      ),
      body: ListView(children: <Widget>[
        ListTile(
          // leading: Icon(Icons.person, size: 40),
          title: Text(
            'Chamado',
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
        ListTile(
            title: Row(
          children: [
            ElevatedButton(
              onPressed: () {
                pedido.status = 'recusado';
                pedido.statusIcon =
                    Icon(Icons.cancel, color: Colors.black54, size: 40.0);

                // remover pedio do listaChamados e listaPedidos
                globals.listaChamados
                    .removeAt(int.parse(pedido.id.toString()) - 1);
                globals.listaPedidos
                    .removeAt(int.parse(pedido.id.toString()) - 1);

                // adicioanr pedido na lista de pedidos
                globals.listaPedidos.add(pedido);

                final snackBar = SnackBar(
                  content: Row(children: [
                    Text('Instalação Recusada'),
                    Spacer(),
                    Icon(
                      Icons.close,
                      size: 40,
                      color: Color.fromARGB(136, 255, 0, 0),
                    ),
                  ]),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewMapa()),
                );
              },
              child: Text("Recusar Pedido"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 175, 76, 76))),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Salvar JSON com os pedidos
                pedido.status = 'aceito';
                pedido.statusIcon =
                    Icon(Icons.check, color: Colors.black54, size: 40.0);

                // remover pedio do listaChamados e listaPedidos
                globals.listaChamados
                    .removeAt(int.parse(pedido.id.toString()) - 1);
                globals.listaPedidos
                    .removeAt(int.parse(pedido.id.toString()) - 1);

                // adicioanr pedido na lista de pedidos
                globals.listaPedidos.add(pedido);

                // editar pedido ao listaPedidos
                final snackBar = SnackBar(
                  content: Row(children: [
                    Text('Pedido Aceito'),
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
              child: Text("Aceitar Pedido"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green)),
            )
          ],
        ))
      ]),
    );
  }
}
