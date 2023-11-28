import 'package:flutter/widgets.dart';
import 'package:portfolio/src/constants/transparent_image.dart';

class FastImageAsset extends StatefulWidget {
  final String path;
  final double? height;
  final double? width;
  const FastImageAsset(
      {super.key, required this.path, this.height, this.width});

  @override
  State<FastImageAsset> createState() => _FastImageAssetState();
}

class _FastImageAssetState extends State<FastImageAsset> {
  @override
  void didChangeDependencies() {
    precacheImage(AssetImage(widget.path), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      placeholder: MemoryImage(transparentImage),
      image: AssetImage(widget.path),
      imageErrorBuilder: (_, __, ___) => const Placeholder(),
      fit: BoxFit.cover,
      placeholderFit: BoxFit.cover,
      width: widget.width,
      height: widget.height,
    );
  }
}
