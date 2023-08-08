import 'package:apinoteapp/constant.dart';
import 'package:apinoteapp/core/cache.dart';
import 'package:apinoteapp/features/home/data/home_repo/home_repo_imp.dart';
import 'package:apinoteapp/features/home/persentation/manager/home_cubit/home_cubit.dart';
import 'package:apinoteapp/features/login/data/repo/repo_imp.dart';
import 'package:apinoteapp/features/login/peresentation/manager/login_cubit/login_cubit.dart';
import 'package:apinoteapp/features/home/persentation/view/home/home_screen.dart';
import 'package:apinoteapp/features/login/peresentation/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  SignRepoImp s = SignRepoImp();
  HomeRepoImp x = HomeRepoImp();
  WidgetsFlutterBinding.ensureInitialized();
  await CacheLocal.sharedPrefInt();
  token = CacheLocal.getDataFromCache(key: 'id');
  print(token);
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => LoginCubit(s)),
    BlocProvider(create: (context) => HomeCubit(x)),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: token == null ? SignUp() : HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
