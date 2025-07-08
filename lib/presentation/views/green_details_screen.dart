import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greepp/core/di/injector.dart';

import '../blocs/green_details_bloc.dart';
import '../events/green_event.dart';
import '../states/green_state.dart';

class GreenDetailsScreen extends StatefulWidget {
  final String id;

  const GreenDetailsScreen({super.key, required this.id});

  @override
  State<GreenDetailsScreen> createState() => _GreenDetailsScreenState();
}

class _GreenDetailsScreenState extends State<GreenDetailsScreen> {
  late GreenDetailsBloc _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = getIt<GreenDetailsBloc>();
    _bloc.add(LoadDetailsGreenEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GreenDetailsBloc, GreenState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state is LoadingGreenState) {
          return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator());
        } else if (state is LoadedDetailsGreenState) {
          return Scaffold(
            appBar: AppBar(
                title: Text(_bloc.green!.name),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context, false),
                )),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8,
                children: [
                  SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: _bloc.green!.image != null
                          ? Image.network(_bloc.green!.image!,
                              fit: BoxFit.cover)
                          : const Placeholder()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      spacing: 8,
                      children: [
                        Text(
                            "Colors: ${_bloc.green!.colors.isNotEmpty ? _bloc.green!.colors.join(', ') : 'None'}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w700)),
                        if (_bloc.green!.description != null)
                          Text(
                            _bloc.green!.description!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
