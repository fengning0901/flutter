/// 用于有效地沿树传播信息的小部件的基类。
///
/// To obtain the nearest instance of a particular type of inherited widget from
/// a build context, use [BuildContext.dependOnInheritedWidgetOfExactType].
///
/// Inherited widgets, when referenced in this way, will cause the consumer to
/// rebuild when the inherited widget itself changes state.
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=Zbm3hjPjQMk}
///
/// {@tool snippet}
///
/// The following is a skeleton of an inherited widget called `FrogColor`:
///
/// ```dart
/// class FrogColor extends InheritedWidget {
///   const FrogColor({
///     Key key,
///     @required this.color,
///     @required Widget child,
///   }) : assert(color != null),
///        assert(child != null),
///        super(key: key, child: child);
///
///   final Color color;
///
///   static FrogColor of(BuildContext context) {
///     return context.dependOnInheritedWidgetOfExactType<FrogColor>();
///   }
///
///   @override
///   bool updateShouldNotify(FrogColor old) => color != old.color;
/// }
/// ```
/// {@end-tool}
///
/// The convention is to provide a static method `of` on the [InheritedWidget]
/// which does the call to [BuildContext.dependOnInheritedWidgetOfExactType]. This
/// allows the class to define its own fallback logic in case there isn't
/// a widget in scope. In the example above, the value returned will be
/// null in that case, but it could also have defaulted to a value.
///
/// Sometimes, the `of` method returns the data rather than the inherited
/// widget; for example, in this case it could have returned a [Color] instead
/// of the `FrogColor` widget.
///
/// Occasionally, the inherited widget is an implementation detail of another
/// class, and is therefore private. The `of` method in that case is typically
/// put on the public class instead. For example, [Theme] is implemented as a
/// [StatelessWidget] that builds a private inherited widget; [Theme.of] looks
/// for that inherited widget using [BuildContext.dependOnInheritedWidgetOfExactType]
/// and then returns the [ThemeData].
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=1t-8rBCGBYw}
///
/// See also:
///
///  * [StatefulWidget] and [State], for widgets that can build differently
///    several times over their lifetime.
///  * [StatelessWidget], for widgets that always build the same way given a
///    particular configuration and ambient state.
///  * [Widget], for an overview of widgets in general.
///  * [InheritedNotifier], an inherited widget whose value can be a
///    [Listenable], and which will notify dependents whenever the value
///    sends notifications.
///  * [InheritedModel], an inherited widget that allows clients to subscribe
///    to changes for subparts of the value.