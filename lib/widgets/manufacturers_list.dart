import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/configs/api_conf.dart';
import 'package:test_app/entities/manufacturer.dart';
import 'package:test_app/widgets/manufacturer_card.dart';
import '../services/data_service.dart';

class ManufacturersList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ManufacturersListState();
  }
}

class _ManufacturersListState extends State<ManufacturersList>{
  final List<String> entries = <String>['A', 'B', 'C'];
  List<Manufacturer>? _manufacturers;

  @override
  void initState(){
    super.initState();
    _getManufacturers();
  }

  _getManufacturers() async {
    _manufacturers = await DataService().fetchManufacturersByPage(1);
    await Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _manufacturers?.length,
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index){
        return ListTile(
          leading: Text(_manufacturers?[index].id.toString() ?? ''),
          title: Text(_manufacturers?[index].country.toString() ?? ''),
          subtitle: Text(_manufacturers?[index].name.toString() ?? ''),
          onTap: (){
            _onTilePressed(context, _manufacturers?[index].id);
          },
        );
      },
    );
  }

  _onTilePressed(context, id){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ManufacturerCard(id: id)),
    );
  }
}
