part of 'navigation_bloc.dart';

enum NavigationStateStatus { initial, tab, zero, pop }

@immutable
class NavigationState {
  const NavigationState({
    this.status = NavigationStateStatus.initial,
    this.currentIndex = 0,
    this.route = HomeScreen.routeName,
  });
  final NavigationStateStatus status;
  final int currentIndex;
  final String route;

  NavigationState copyWith({
    NavigationStateStatus? status,
    int? currentIndex,
    String? route,
  }) {
    return NavigationState(
      status: status ?? this.status,
      currentIndex: currentIndex ?? this.currentIndex,
      route: route ?? this.route,
    );
  }
}