import 'package:chopper_flutter/DetailPage.dart';
import 'package:chopper_flutter/src/bloc/bloc.dart';
import 'package:chopper_flutter/src/model/User.dart';
import 'package:flutter/material.dart';
import 'package:equinox/equinox.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flare_flutter/flare_actor.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserBloc userBloc;

  @override
  void initState() {
    userBloc = UserBloc();
    userBloc.dispatch(Fetch());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EqLayout(
      appBar: EqAppBar(title: "Chopper"),
      child: BlocBuilder(
        bloc: userBloc,
        builder: (_, UserState state) {
          if (state is LoadingUserState) {
            return Center(
              child: FlareActor(
                "assets/loading2.flr",
                alignment: Alignment.center,
              ),
            );
          }
          if (state is LoadedUserState) {
            return ListView(
                children: state.user.body.map((_builtList)).toList());
          }
          if (state is ErrorUserSate) {
            return Center(
              child: Text("Error"),
            );
          } else {
            return Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }

  Widget _builtList(User user) {
    return EqListItem(
      title: user.name,
      subtitle: user.company.name,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(id: user.id),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    userBloc.dispose();
    super.dispose();
  }
}
