import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/qrs.dart';
import '../view_models/changes.dart';

class ManageVehicles extends StatefulWidget {
  const ManageVehicles({Key? key, required List vehicles}) : super(key: key);

  @override
  State<ManageVehicles> createState() => _ManageVehiclesState();
}

class _ManageVehiclesState extends State<ManageVehicles> {
  Future<void> method() async {
    await context.read<MyModel>().getdetails();
    setState(() {});
  }

  Future<void> _refresh() async {
    await context.read<MyModel>().getdetails();
    setState(() {});
    return null;
  }

  @override
  void initState() {
    super.initState();
    method();
    setState(() {});
  }

  List<Vehicle> vehicles = [];
  @override
  Widget build(BuildContext context) {
    BuiltList<Qrs>? list = context.read<MyModel>().state.qrs;

    return RefreshIndicator(
      onRefresh: () {
        _refresh();
        return Future(() => null);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Manage your Vehicles',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
        body: ListView.builder(
          itemCount: list!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]!.bike ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(list[index]!.bike ?? ""),
              trailing: IconButton(
                icon: const Icon(Icons.delete,
                    color: Color.fromRGBO(53, 85, 235, 1)),
                onPressed: () {
                  showDeleteConfirmationDialog(context, index);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void addVehicle(String name, String number) {
    setState(() {
      vehicles.add(Vehicle(name: name, number: number));
    });
  }

  void deleteVehicle(int index) {
    setState(() {
      vehicles.removeAt(index);
    });
  }

  Future<void> showDeleteConfirmationDialog(
      BuildContext context, int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Vehicle'),
          content: const Text('Are you sure you want to delete this vehicle?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {
                deleteVehicle(index);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Color.fromRGBO(53, 85, 235, 1)),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Vehicle {
  final String name;
  final String number;

  Vehicle({required this.name, required this.number});
}
