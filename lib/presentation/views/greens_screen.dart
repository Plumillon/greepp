import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greepp/core/di/injector.dart';
import 'package:greepp/domain/entities/green_entity.dart';

import '../blocs/greens_bloc.dart';
import '../events/green_event.dart';
import '../states/green_state.dart';
import '../views/green_details_screen.dart';

class GreensScreen extends StatefulWidget {
  const GreensScreen({super.key});

  @override
  State<StatefulWidget> createState() => _GreensScreenState();
}

class _GreensScreenState extends State<GreensScreen> {
  late GreensBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = getIt<GreensBloc>();
    _bloc.add(LoadGreenEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Greens")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<GreensBloc, GreenState>(
            bloc: _bloc,
            builder: (context, state) {
              if (state is LoadingGreenState) {
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              } else if (state is LoadedGreenState) {
                return _buildItems(state.greens);
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildItems(List<GreenEntity> greens) {
    return ListView.builder(
      itemCount: greens.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        child: _buildItem(greens[index]),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GreenDetailsScreen(id: greens[index].id)),
        ),
      ),
    );
  }

  Widget _buildItem(GreenEntity green) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(spacing: 8, children: [
        SizedBox(
            width: 100,
            height: 100,
            child: green.image != null
                ? Image.network(green.image!, fit: BoxFit.cover)
                : const Placeholder()),
        Expanded(
          child: Column(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                green.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              if (green.description != null)
                Text(green.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ]),
    );
  }
}
