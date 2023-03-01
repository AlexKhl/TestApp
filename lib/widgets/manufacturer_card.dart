import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/entities/manufacturer_details.dart';
import '../services/data_service.dart';

class ManufacturerCard extends StatefulWidget{

  final int id;

  ManufacturerCard({Key? key, required this.id}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ManufacturerCardState();
  }
}

class _ManufacturerCardState extends State<ManufacturerCard>{
  ManufacturerDetails? _details;

  _ManufacturerCardState();

  @override
  void initState(){
    super.initState();
    _getManufacturerDetails();
  }

  _getManufacturerDetails() async {
    _details = await DataService().fetchManufacturerById(widget.id);
    print(_details?.Address);
    await Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Manufacturer detail screen'),
      ),
      body: Center(
        child: Column(
            children:
            [
              ListTile(leading: Text('Address'), title: Text(_details?.Address ?? ''),),
              ListTile(leading: Text('Address2'), title: Text(_details?.Address2 ?? ''),),
              ListTile(leading: Text('City'), title: Text(_details?.City ?? ''),),
              ListTile(leading: Text('ContactEmail'), title: Text(_details?.ContactEmail ?? ''),),
              ListTile(leading: Text('ContactPhone'), title: Text(_details?.ContactPhone ?? ''),),
              ListTile(leading: Text('ContactFax'), title: Text(_details?.ContactFax ?? ''),),
              ListTile(leading: Text('Country'), title: Text(_details?.Country ?? ''),),
            ]
        ),
      ),
    );
  }

}
