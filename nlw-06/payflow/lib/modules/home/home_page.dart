import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                width: size.width,
                height: size.height * .36,
                color: AppColors.primary,
                child: Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24,top:65),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                       Text.rich(
                         
                          TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'Olá, ',
                                style: TextStyles.captionShape),
                            TextSpan(
                                text: 'Marcos',
                                style: TextStyles.titleBoldBackground),
                            TextSpan(
                                text: '\nMantenha suas Contas em Dia',
                                style: TextStyles.captionShape),
                          ]),
                        ),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage('https://pbs.twimg.com/profile_images/1405138613998821378/xkZRU-mY_400x400.jpg')
                              ,),
                          ),
                          
                        )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.3,
                right: 27,
                left: 27,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(AppImages.logomini2),
                      Container(
                        width: 1,
                        height: 32,
                        color: Colors.white,
                      ),
                      Text.rich(
                        TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'Você tem ',
                              style: TextStyles.captionShape),
                          TextSpan(
                              text: '14 boletos',
                              style: TextStyles.captionBoldShape),
                          TextSpan(
                              text: '\ncadastrados para pagar.',
                              style: TextStyles.captionShape),
                        ]),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.gray,
                  ),
                  width: 327,
                  height: 80,
                ),
              ),
            ],
          ),
        ));
  }
}
