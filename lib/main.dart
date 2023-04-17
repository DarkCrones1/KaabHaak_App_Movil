import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kaabhaak/color_schemes.g.dart';
import 'package:kaabhaak/pages/UserProfile/user_address.dart';
import 'package:kaabhaak/pages/UserProfile/user_data.dart';
import 'package:kaabhaak/pages/category/beauty_page.dart';
import 'package:kaabhaak/pages/category/candy_page.dart';
import 'package:kaabhaak/pages/category/nature_page.dart';
import 'package:kaabhaak/pages/principal_page/pay_page.dart';
import 'package:kaabhaak/pages/theme_page/theme_page.dart';
import 'package:kaabhaak/pages/user_page/menu_user.dart';
import 'package:kaabhaak/pages/login/login_page.dart';
import 'package:kaabhaak/pages/login/recover_pass_page.dart';
import 'package:kaabhaak/pages/login/sign_up.dart';
import 'package:kaabhaak/pages/principal_page/menu_page.dart';
import 'package:kaabhaak/providers/category_filtername_providers/product_category_provider.dart';
import 'package:kaabhaak/providers/category_filtername_providers/product_nature_provider.dart';
import 'package:kaabhaak/providers/category_providers/category_providers.dart';
import 'package:kaabhaak/providers/product_providers/product_providers.dart';
import 'package:kaabhaak/providers/search_providers/search_provider.dart';
import 'package:kaabhaak/providers/theme_providers/change_theme_provider.dart';
import 'package:kaabhaak/providers/user_providers/user_address_provider.dart';
import 'package:kaabhaak/providers/user_providers/user_data_provider.dart';
import 'package:kaabhaak/providers/user_providers/user_login_provider.dart';
import 'package:kaabhaak/providers/user_providers/user_provider.dart';
import 'package:kaabhaak/widget/navbar/navegation_bar.dart';
import 'package:kaabhaak/widget/navbar/navegation_bar_user.dart';
import 'package:kaabhaak/widget/shopping_cart/cartprovider.dart';
import 'package:provider/provider.dart';
import 'providers/category_filtername_providers/product_beauty_provider.dart';
import 'providers/category_filtername_providers/product_candy_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider()..fetchProduct(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductNatureProvider()..fetchProductNature()
        ),
        ChangeNotifierProvider(
          create: (context) => ProductCandyProvider()..fetchProductCandy(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductBeautyProvider()..fetchProductBeauty(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider()..fetchCategory(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeTheme(ThemeData(colorScheme: darkColorScheme)),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider()..fetchUser(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserLoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductCategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserDataProvider()..fetchUserData(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserAddressProvider()..fetchUserAddress(),
        ),
      ],
      child: const MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ChangeTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kaab Haak',
      theme: theme.getTheme(),
      home: const NavegationBar(),
      routes: {
        '/home_navbar':(context) => const NavegationBar(),
        '/home_navbar_user':(context) => const NavegationBarUser(),
        // '/search_page':(context) => const SearchPage(),
        '/menu_page':(context) => const MenuPage(),
        '/menu_user':(context) => const MenuUser(),
        '/login_page':(context) => const LoginPage(),
        '/sign_up':(context) => const SignUp(),
        '/recover_pass':(context) => const RecoverPassPage(),
        '/userData_page':(context) => const UserData(),
        '/userAddress_page':(context) => const UserAddress(),
        '/page_category_Natural':(context) => const PageNature(),
        '/page_category_Dulces':(context) => const PageCandy(),
        '/page_category_Belleza':(context) => const PageBeauty(),
        '/page_pay':(context) => const PaySelect(),
        '/theme_page':(context) => const ThemePage(),

      },
    );
  }
}

