import 'package:app/model/installer.dart';
import 'package:app/model/pedido.dart';
import 'package:app/view/view_chamado.dart';
import 'package:app/view/view_pedido.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongoDart;
import 'package:app/util/globalVars.dart' as globals;
import 'package:intl/intl.dart';

import '../../model/user.dart';

class MeusChamados extends StatelessWidget {
  var chamados_list = [];

  MeusChamados({super.key}) {
    chamados_list = globals.listaChamados;
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
        title: Text("Meus Chamados",
            style: GoogleFonts.firaSans(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(50, 50, 50, 1.0))),
      ),
      body: ListView.builder(
        itemCount: chamados_list.length,
        itemBuilder: (_, index) {
          return Card(
            margin: const EdgeInsets.all(3),
            color: Color.fromARGB(223, 255, 255, 255),
            child: ListTile(
                leading: Text(chamados_list[index].id.toString(),
                    style: GoogleFonts.firaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(50, 50, 50, 1.0))),
                title: Text(chamados_list[index].user.name.toString()),
                subtitle: Text(DateFormat("dd/MM/yyyy")
                    .format(chamados_list[index].dataAtendimento)),
                // trailing: Icon(Icons.info, color: Colors.black54, size: 40.0),
                trailing: chamados_list[index].statusIcon,
                onTap: () {
                  print(_);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewChamado(
                                arg_pedido: chamados_list[index],
                              )));
                }),
          );
        },
      ),
    );
  }
}
