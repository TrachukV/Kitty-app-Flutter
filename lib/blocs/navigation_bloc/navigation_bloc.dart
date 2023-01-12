import 'package:bloc/bloc.dart';
import 'package:kitty_app/screens/home_screen/home_screen.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigationState()) {
    List<NavigationState> screens = [];
    on<NavigationPopEvent>((event, emit) {
      if (screens.isEmpty) {
        emit(
          state.copyWith(
            status: NavigationStateStatus.tab,
            currentIndex: 0,
          ),
        );
      }
      if(screens.isNotEmpty){
        screens.removeLast();
      } else {
        emit(state.copyWith(
          status: NavigationStateStatus.tab,
          currentIndex: screens.last.currentIndex,
          route: screens.last.route
        ));
      }
    });
    on<NavigateTabEvent>((event, emit) {
      emit(
        state.copyWith(
          status: NavigationStateStatus.tab,
          currentIndex: event.tabIndex,
          route: event.route,
        ),
      );
    });
  }
}
