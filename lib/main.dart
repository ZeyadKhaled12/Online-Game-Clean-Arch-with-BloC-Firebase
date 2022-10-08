
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaito/app.dart';
import 'package:kaito/core/utils/bloc_providers.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MultiBlocProvider(providers: blocProviders, child: const Kaito()));
}

