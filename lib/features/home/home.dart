import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:naira_convertor/core/utils/const.dart';
import 'package:naira_convertor/features/about/about.dart';
import 'package:naira_convertor/features/cubit/app_theme_cubit.dart';
import 'package:naira_convertor/features/home/bloc/home_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        leading: IconButton(
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => const About())),
            icon: const Icon(Icons.info_outline)),
        title: const Text("Convertor"),
        actions: [
          IconButton(
              onPressed: () => context.read<AppThemeCubit>().change(),
              icon: const Icon(Icons.sunny_snowing))
        ],
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.status == HomeStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Color(0xFFFDA099),
                padding: EdgeInsets.all(20),
                content: Text("Une Erreur s'est produite",
                    style: TextStyle(color: Colors.black))));
          }
        },
        builder: (context, state) {
          return const SingleChildScrollView(
            child: Column(
              children: [
                Currency(),
                SizedBox(height: 30),
                Divider(),
                SizedBox(height: 30),
                Convertor(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Currency extends StatelessWidget {
  const Currency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeInitEvent());

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Currency",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))),
          const SizedBox(height: 20),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (e) => context
                          .read<HomeBloc>()
                          .add(HomeNairaCurrencyInputEvent(nairaCurrency: e)),
                      decoration: InputDecoration(
                          hintText: state.nairaCurrency.toString(),
                          helperText: "Naira",
                          border: const OutlineInputBorder()),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text("=",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (e) => context
                          .read<HomeBloc>()
                          .add(HomeFcfaCurrencyInputEvent(fcfaCurrency: e)),
                      decoration: InputDecoration(
                          hintText: state.fcfaCurrency.toString(),
                          helperText: "Franc CFA",
                          border: const OutlineInputBorder()),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

class Convertor extends StatelessWidget {
  const Convertor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<HomeBloc, HomeState>(
        // buildWhen: (previous, current) {
        //   return previous.firstInputConvector != current.firstInputConvector ||
        //       previous.secondInputConvector != current.secondInputConvector;
        // },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Convertor",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold))),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (e) => context.read<HomeBloc>().add(
                          HomeConvertorInputEvent(inputFirstConvertorValue: e)),
                      decoration: const InputDecoration(
                          hintText: "123",
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(.1),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: DropdownButton(
                      value: state.drop,
                      underline: Container(),
                      items: const [
                        DropdownMenuItem(
                            value: ConvertorConst.naira, child: Text("Naira")),
                        DropdownMenuItem(
                            value: ConvertorConst.fcfa,
                            child: Text("Franc CFA")),
                      ],
                      onChanged: (e) => context
                          .read<HomeBloc>()
                          .add(HomeDropChangeEvent(value: e)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.secondary.withOpacity(.1),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            state.value.toStringAsFixed(2),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    Text(
                        state.drop != ConvertorConst.fcfa
                            ? "Franc CFA"
                            : "Naira",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
