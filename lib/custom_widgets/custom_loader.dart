import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:oktoast/oktoast.dart';

import '../constants/app_colors.dart';

class CustomLoader extends StatelessWidget {
  final double? size;
  final Color? color;

  const CustomLoader({super.key, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    //return Image.asset(
    //   'assets/gifs/cronysoft_loader.gif',
    //   fit: BoxFit.contain,
    //   color: color,
    //   width: size ?? 150,
    //   height: size ?? 150,
    // )

    // return CircularProgressIndicator(
    //   color: color ?? AppColors.kPrimary,
    // );

    return Center(
      child: SpinKitCubeGrid(
        size: size ?? 70,
        color: color ?? AppColors.kPrimary,
      ),
    );
  }
}

ToastFuture appCommonSnakeBar({String? text, bool? isError = false}) {
  return showToastWidget(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: isError == true
              ? const Color.fromARGB(255, 150, 12, 12)
              : const Color.fromARGB(255, 16, 69, 18),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(left: 20,right: 20,top: 50),
        width: 370,
        height: 55,
        child: Row(
          children: [
            Image.asset(
              isError == true
                  ? 'assets/images/close.png'
                  : 'assets/images/accept.png',
              height: 30,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                text ?? '',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
      duration: const Duration(seconds: 4),
      position: const ToastPosition(align: Alignment.bottomCenter));
}

// SnackBar commonSnakeBar({String? text, bool? isError = false}) {
//   return SnackBar(
//     backgroundColor: isError == true
//         ? const Color.fromARGB(255, 150, 12, 12)
//         : const Color.fromARGB(255, 16, 69, 18),
//     width: 400,
//     padding: const EdgeInsets.all(10),
//     content: Row(
//       children: [
//         Image.asset(
//           isError == true
//               ? 'assets/images/close.png'
//               : 'assets/images/accept.png',
//           height: 30,
//         ),
//         const SpaceW10(),
//         Flexible(
//           child: Text(
//             text ?? '',
//             style: const TextStyle(
//               fontSize: 18,
//               color: Colors.white,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//         ),
//       ],
//     ),
//     behavior: SnackBarBehavior.floating,
//   );
// }