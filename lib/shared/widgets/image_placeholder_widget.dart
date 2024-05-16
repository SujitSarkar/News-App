part of 'widgets_imports.dart';

class ImagePlaceholderWidget extends StatelessWidget {
  const ImagePlaceholderWidget({super.key, this.height, this.width});
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Ink(
          width: width ?? 130,
          height: height ?? 110,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: const Icon(
            FeatherIcons.image,
            color: AppColors.hintColor,
            size: 100,
          ),
        ));
  }
}
