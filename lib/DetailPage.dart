import 'package:chopper_flutter/src/single_user/bloc/singleuser_bloc.dart';
import 'package:equinox/equinox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  final int id;

  DetailPage({Key key, @required this.id}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  SingleuserBloc bloc;

  @override
  void initState() {
    bloc = SingleuserBloc();
    bloc.dispatch(Fetch(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EqLayout(
      appBar: EqAppBar(
        title: 'Detail',
      ),
      child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is SingleuserLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SingeluserLoaded) {
              return ListView(
                padding: EdgeInsets.all(10),
                children: <Widget>[
                  Text(state.user.body.name),
                  Text(state.user.body.email),
                  Text(state.user.body.address.city),
                  Text(state.user.body.company.name),
                  Text(state.user.body.address.geo.lat),
                  Text(state.user.body.username),
                  Text(state.user.body.website),
                ],
              );
            }
            return Center(
              child: Text(""),
            );
          }),
    );
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
