import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_pages.dart';

abstract class AppRouter {
  static void appUrlStrategy() {
    // usePathUrlStrategy();
  }

  static final _rootNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'root',
  );

  static final _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      // ShellRoute(
      //   builder: (_, state, child) {
      //     // print('object full path ' + state.fullPath!);
      //     return NavigationPage(path: state.fullPath!, child: child);
      //   },
      //   routes: [
      //     GoRoute(
      //       name: AppPages.homePage.name,
      //       path: AppPages.homePage.path,
      //       builder: (_, state) {
      //         var newLogin = false;
      //         if (state.extra is bool) {
      //           newLogin = state.extra as bool;
      //         }
      //         return HomePage(newLogin: newLogin);
      //       },
      //     ),
      //     GoRoute(
      //       name: AppPages.journalsPage.name,
      //       path: AppPages.journalsPage.path,
      //       builder: (_, __) {
      //         return JournalPage(
      //           type: JournalPageType.simple,
      //           key: UniqueKey(),
      //           isNextPage: false,
      //         );
      //       },
      //       routes: [
      //         GoRoute(
      //           parentNavigatorKey: kIsWeb ? null : _rootNavigatorKey,
      //           path: AppPages.journalsViewPage.path,
      //           name: AppPages.journalsViewPage.name,
      //           builder: (_, state) {
      //             final String? id = state.pathParameters['id'];
      //             return JournalPage(
      //               isNextPage: true,
      //               id: id,
      //               type: JournalPageType.info,
      //               key: UniqueKey(),
      //             );
      //           },
      //         ),
      //         GoRoute(
      //           parentNavigatorKey: kIsWeb ? null : _rootNavigatorKey,
      //           path: AppPages.journalsEditPage.path,
      //           name: AppPages.journalsEditPage.name,
      //           builder: (_, state) {
      //             final String? id = state.uri.queryParameters['id'];
      //             return JournalPage(
      //               id: id ?? '',
      //               type: JournalPageType.edit,
      //               isNextPage: true,
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //       name: AppPages.assessmentsPage.name,
      //       path: AppPages.assessmentsPage.path,
      //       builder: (_, __) {
      //         return const AssessmentsPage(start: false);
      //       },
      //       routes: [
      //         GoRoute(
      //           parentNavigatorKey: kIsWeb ? null : _rootNavigatorKey,
      //           path: AppPages.assessmentsStartPage.path,
      //           name: AppPages.assessmentsStartPage.name,
      //           builder: (_, state) {
      //             final String? path = state.pathParameters['type'];
      //             int? type;
      //             if (path?.isNotEmpty ?? false) {
      //               type = int.parse(path!);
      //             }
      //             return AssessmentsPage(
      //               start: true,
      //               type: type,
      //             );
      //           },
      //           routes: [
      //             GoRoute(
      //               parentNavigatorKey: _rootNavigatorKey,
      //               path: AppPages.assessmentsQuestionsPage.path,
      //               name: AppPages.assessmentsQuestionsPage.name,
      //               builder: (_, state) {
      //                 final String? path = state.pathParameters['type'];
      //                 int? type;
      //                 if (path?.isNotEmpty ?? false) {
      //                   type = int.parse(path!);
      //                 }
      //                 return AssessmentQuestionsPage(type: type ?? 1);
      //               },
      //             ),
      //           ],
      //         ),
      //         GoRoute(
      //           path: AppPages.resultPage.path,
      //           name: AppPages.resultPage.name,
      //           parentNavigatorKey: _rootNavigatorKey,
      //           builder: (_, state) {
      //             final formID = state.pathParameters['formID'] ?? '';
      //             // final String? path = state.pathParameters['type'];
      //             // int? type;
      //             // if (path?.isNotEmpty ?? false) {
      //             //   type = int.parse(path!);
      //             // }
      //             return ResultPage(
      //               formID: formID,
      //               // type: type!,
      //             );
      //           },
      //         ),
      //         GoRoute(
      //           parentNavigatorKey: _rootNavigatorKey,
      //           path: AppPages.additionalAssessments.path,
      //           name: AppPages.additionalAssessments.name,
      //           builder: (_, state) {
      //             var url = 'https://mybiq.com/';
      //             if (state.extra != null && state.extra is String) {
      //               url = state.extra! as String;
      //             }
      //             return AdditionalAssessmentPage(
      //               url: url,
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //       name: AppPages.libraryPage.name,
      //       path: AppPages.libraryPage.path,
      //       builder: (_, __) {
      //         return const Library();
      //       },
      //       routes: [
      //         /// library book sub route:
      //         GoRoute(
      //           parentNavigatorKey: _rootNavigatorKey,
      //           path: AppPages.booksLibraryPdfPage.path,
      //           name: AppPages.booksLibraryPdfPage.name,
      //           builder: (_, state) {
      //             final link = state.pathParameters['name'] ?? '';
      //             String? bookName;
      //             if (state.extra is String) {
      //               bookName = state.extra! as String;
      //             }
      //             return BooksPdfPage(
      //               link: link,
      //               bookName: bookName,
      //             );
      //           },
      //         ),
      //         GoRoute(
      //           parentNavigatorKey: kIsWeb ? null : _rootNavigatorKey,
      //           path: AppPages.audioLibraryPage.path,
      //           name: AppPages.audioLibraryPage.name,
      //           builder: (_, state) {
      //             final catID = state.pathParameters['catID'] ?? '';
      //             // final audioID = state.pathParameters['id'] ?? '';
      //             return LibraryAudios(
      //               isPlaying: false,
      //               catID: catID,
      //               audioID: '',
      //             );
      //           },
      //           routes: [
      //             GoRoute(
      //               parentNavigatorKey: kIsWeb ? null : _rootNavigatorKey,
      //               path: AppPages.audioLibraryPlayPage.path,
      //               name: AppPages.audioLibraryPlayPage.name,
      //               builder: (_, state) {
      //                 final catID = state.pathParameters['catID'] ?? '';
      //                 final audioID = state.pathParameters['audioID'] ?? '';
      //                 return LibraryAudios(
      //                   isPlaying: true,
      //                   catID: catID,
      //                   audioID: audioID,
      //                 );
      //               },
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //     GoRoute(
      //       name: AppPages.contactUSPage.name,
      //       path: AppPages.contactUSPage.path,
      //       builder: (_, __) {
      //         return const ContactUs();
      //       },
      //     ),
      //     if (kIsWeb) ..._listOfRoutes,
      //   ],
      // ),
    ],
    initialLocation: AppPages.splash.path,
    // errorPageBuilder: (BuildContext _, GoRouterState state) {
    //   return const MaterialPage(
    //     child: ErrorPage(),
    //   );
    // },
    // redirect: Redirection.redirect,
  );

  static GoRouter get router => _router;
}
