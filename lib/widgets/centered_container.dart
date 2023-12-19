import 'package:flutter/material.dart';

class CenteredContainerImage extends StatelessWidget {
  final double outerContainerSize;
  final String firstImageAsset;
  final double innerContainerSize;
  final String secondImageAsset;
  final double borderRadius;

  CenteredContainerImage({
    required this.outerContainerSize,
    required this.firstImageAsset,
    required this.innerContainerSize,
    required this.secondImageAsset,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: outerContainerSize * 2,
      height: outerContainerSize * 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image.asset(
                firstImageAsset,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Center(
            child: Container(
              width: innerContainerSize,
              height: innerContainerSize,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: innerContainerSize / 4,
                    top: innerContainerSize / 4,
                    child: Container(
                      width: innerContainerSize / 2,
                      height: innerContainerSize / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(borderRadius),
                        child: Image.asset(
                          secondImageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: innerContainerSize / 4,
                    bottom: innerContainerSize / 4,
                    child: Container(
                      width: innerContainerSize / 2,
                      height: innerContainerSize / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(borderRadius),
                        child: Image.asset(
                          secondImageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
