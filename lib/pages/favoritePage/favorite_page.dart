import 'package:aun/widgets/grid_view_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridViewWidget(
      collection: "favorite",
      subCollection: "userFavorite",
      id: FirebaseAuth.instance.currentUser!.uid,
    );
  }
}
