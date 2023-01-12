part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class NavigateTabEvent extends NavigationEvent{
  NavigateTabEvent({
    required this.tabIndex,
    required this.route,

  });
  final int tabIndex;
  final String route;
}
class NavigationPopEvent extends NavigationEvent{}