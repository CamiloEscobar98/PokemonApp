import 'package:flutter/material.dart';
import 'package:pokemon_ipt/constants/exports.dart';
import 'package:pokemon_ipt/pages/profile/widgets/form.dart';
import 'package:pokemon_ipt/view-models/exports.dart';
import 'package:pokemon_ipt/widgets/appbar_custom.dart';
import 'package:pokemon_ipt/widgets/bottom_button/bottom_scaffold.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileVM = Provider.of<ProfileViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.amber[100],
      appBar: AppBarPokemon(appBar: AppBar()),
      body: FutureBuilder(
        future: profileVM.getProfile(),
        builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
              margin: const EdgeInsets.all(8),
              child: FormUserProfile(
                user: snapshot.data,
              ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
      bottomNavigationBar: const BottomScaffoldPokemon(routeIs: PROFILE_ROUTE),
    );
  }
}
