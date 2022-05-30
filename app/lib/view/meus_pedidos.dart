import 'package:app/model/installer.dart';
import 'package:app/model/pedido.dart';
import 'package:app/model/plans.dart';
import 'package:app/view/view_pedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongoDart;
import 'package:intl/intl.dart';

import 'package:app/util/globalVars.dart' as globals;

import '../model/user.dart';

class MeusPedidos extends StatelessWidget {
  late User user;

  var pedido_list = [];

  MeusPedidos({super.key, required User arg_user}) {
    user = arg_user;

    pedido_list = globals.listaPedidos;

    // Pedido p1 = Pedido(1, user, installer, plan, 'aberto');
    // Pedido p2 = Pedido(2, user, installer, plan, 'cancelado');
    // pedido_list.add(p1);
    // pedido_list.add(p2);
  }

  void _loadJSON() async {
    // TODO: JSON NAO CONSEGUE LER O ARQUIVO, porem no teste consegue, vai entender, ne
    // var installers = await InstallersParser().readJson();

    print('loadJSON');
    // print(installers.toString());
  }

  @override
  Widget build(BuildContext context) {
    _loadJSON();
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
        title: Text("Meus Pedidos",
            style: GoogleFonts.firaSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(50, 50, 50, 1.0))),
      ),
      body: ListView.builder(
        itemCount: pedido_list.length,
        itemBuilder: (_, index) {
          return Card(
            margin: const EdgeInsets.all(3),
            color: Color.fromARGB(223, 255, 255, 255),
            child: ListTile(
                leading: Text(pedido_list[index].id.toString(),
                    style: GoogleFonts.firaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(50, 50, 50, 1.0))),
                title: Text(pedido_list[index].plans.isp),
                subtitle: Text(DateFormat("dd/MM/yyyy")
                    .format(pedido_list[index].dataAtendimento)),
                trailing: pedido_list[index].statusIcon,
                onTap: () {
                  print(_);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewPedido(
                                arg_user: user,
                                arg_pedido: pedido_list[index],
                              )));
                }),
          );
        },
      ),
    );
  }
}
