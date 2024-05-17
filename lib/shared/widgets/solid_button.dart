part of 'widget_imports.dart';

class SolidButton extends StatelessWidget {
  const SolidButton(
      {super.key,
      required this.onTap,
      required this.child,
      this.isLoading = false,
      this.width,
      this.height,
      this.backgroundColor,
      this.borderRadius,
      this.splashColor});
  final Function() onTap;
  final Widget child;
  final bool isLoading;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final MaterialStateProperty<Color?>? splashColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: backgroundColor ?? AppColors.primaryColor,
                elevation: 0.0,
                minimumSize: Size(
                    width ?? MediaQuery.of(context).size.width, height ?? 44),
                shape: RoundedRectangleBorder(
                    borderRadius: borderRadius ??
                        const BorderRadius.all(Radius.circular(50))))
            .copyWith(
                overlayColor: splashColor ??
                    MaterialStateProperty.all(Colors.white.withOpacity(0.5))),
        onPressed: onTap,
        child: isLoading ? const LoadingWidget(color: Colors.white) : child);
  }
}
