import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';
import 'package:pokemon_teste/layers/presenters/ui/utils/size_device_util.dart';


class LoaderHomeWeb extends StatelessWidget {
  final double widthDevice;
  const LoaderHomeWeb({Key? key, required this.widthDevice}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isMobile() => widthDevice < 768;
    bool isTablet() => widthDevice >= 768 && widthDevice <= 992;

    return SizedBox(
      width: context.sizedDevice.width,
      height: isMobile() ? 1000 : context.sizedDevice.height / (isTablet() ? 0.5 : 1.3),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 25),
        shrinkWrap: true,
        crossAxisCount: isMobile() ? 1 : isTablet() ? 3 : 5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
        childAspectRatio: isMobile() ? 1 : context.sizedDevice.width / (isTablet() ? 1000 : 1500),
        children: List.generate(
          10,
          (index) => Container(
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(color: Colors.white),
            child: SkeletonItem(
              child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 16,
                        width: 70,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 16,
                        width: 34,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Expanded(
                  child: SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: double.infinity,
                      //height: 100
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 16,
                        width: 64,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 16,
                        width: 64,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    )
                  ],
                ),

                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 16,
                        width: 64,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    SkeletonLine(
                      style: SkeletonLineStyle(
                        height: 16,
                        width: 64,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    )
                  ],
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
