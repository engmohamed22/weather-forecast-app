import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:forecast_app/src/core/services/shared_preferences.dart';
import 'package:forecast_app/src/core/utils/app_colors.dart';
import 'package:forecast_app/src/core/utils/helper_extenstions.dart';
import 'package:forecast_app/src/core/widgets/text_widget.dart';
import 'package:forecast_app/src/modules/home/presentation/components/forecast_widget.dart';
import 'package:forecast_app/src/modules/home/presentation/components/home_drawer_widget.dart';
import 'package:forecast_app/src/modules/home/presentation/components/weather_widget.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/favourite_locations/favourite_cubit.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/forecast/forecast_cubit.dart';
import 'package:forecast_app/src/modules/home/presentation/controllers/weather/weather_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cityNameController = TextEditingController();
  double lat = 0.0;
  double lon = 0.0;
  bool showSearch = false;
  List<String> favouriteLocations = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherCubit>(context).getCurrentWeather();
    BlocProvider.of<ForecastCubit>(context).getCurrentForecast();
    BlocProvider.of<FavouriteCubit>(context).loadFavouriteLocations();
  }

  savePosition() async {
    await SharedPreferencesService.getInstance().then((value) {
      value.saveValue('lat', lat);
      value.saveValue('lon', lon);
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
    cityNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColor.yellow,
      drawer: buildDrawer(context),
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return HomeDrawerWidget(scaffoldKey: _scaffoldKey, lat: lat, lon: lon);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.yellow,
      elevation: 0,
      title: showSearch ? buildSearchTextField(context) : null,
      actions: [
        showSearch
            ? IconButton(
                onPressed: () {
                  cityNameController.clear();
                  setState(() {
                    showSearch = false;
                  });
                },
                icon: const Icon(CupertinoIcons.clear))
            : IconButton(
                onPressed: () {
                  setState(() {
                    showSearch = true;
                  });
                  BlocProvider.of<FavouriteCubit>(context)
                      .loadFavouriteLocations();
                },
                icon: const Icon(CupertinoIcons.search)),
      ],
    );
  }

  FadeInRight buildSearchTextField(BuildContext context) {
    return FadeInRight(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TypeAheadField(
        key: const Key('searchTextField'),
        errorBuilder: (
          context,
          error,
        ) {
          return const Icon(Icons.error);
        },
        loadingBuilder: (context) {
          return const CircularProgressIndicator();
        },
        animationDuration: const Duration(milliseconds: 500),
        textFieldConfiguration: TextFieldConfiguration(
          onSubmitted: (value) {
            BlocProvider.of<WeatherCubit>(context).getWeatherByCityName(
              cityName: value,
            );
            BlocProvider.of<ForecastCubit>(context).getForecastByCityName(
              cityName: value,
            );
          },
          controller: cityNameController,
          decoration: InputDecoration(
            fillColor: AppColor.white2,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            hintText: 'Enter City name',
          ),
        ),
        suggestionsCallback: (pattern) {
          return BlocProvider.of<FavouriteCubit>(context)
              .cachedFavoriteLocations;
        },
        onSuggestionsBoxToggle: (isOpen) {
          if (!isOpen) {
            BlocProvider.of<FavouriteCubit>(context).loadFavouriteLocations();
          }
        },
        itemBuilder: (context, itemData) {
          return ListTile(
            title: TextWidget(txt: itemData.toString()),
          );
        },
        onSuggestionSelected: (itemData) {
          cityNameController.text = itemData.toString();
          BlocProvider.of<WeatherCubit>(context).getWeatherByCityName(
            cityName: itemData.toString(),
          );
          BlocProvider.of<ForecastCubit>(context).getForecastByCityName(
            cityName: itemData.toString(),
          );
        },
      ),
    ));
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          buildCurrentWeather(),
          20.ph,
          const TextWidget(
              txt: 'Forecast 3H/5D',
              textAlign: TextAlign.start,
              fontSize: 22,
              fontWeight: FontWeight.bold),
          20.ph,
          buildForecast5Days()
        ],
      ),
    );
  }

  Widget buildForecast5Days() {
    return const ForecastWidget();
  }

  Widget buildCurrentWeather() {
    return const WeatherWidget();
  }
}
