import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();
  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_boleto",
            arguments: controller.status.barcode);
      }
    });
    @override
    void dispose() {
      controller.dispose();
      super.dispose();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          //Inserir Camera
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (
                _,
                status,
                __,
              ) {
                if (status.showCamera) {
                  return Container(
                      child: controller.cameraController!.buildPreview());
                } else {
                  return Container();
                }
              }),

          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text(
                    'Escaneie o Codigo de barras do boleto',
                    style: TextStyles.buttonBackground,
                  ),
                  centerTitle: true,
                  leading: BackButton(
                    color: AppColors.background,
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.black.withOpacity(.8),
                    )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.transparent,
                        )),
                    Expanded(
                        child: Container(
                      color: Colors.black.withOpacity(.8),
                    )),
                  ],
                ),
                bottomNavigationBar: SetLabelButtons(
                  primaryLabel: 'Inserir Código do Boleto',
                  enableSecondaryColor: false,
                  primaryOnPressed: () {
                    controller.dispose();
                    Navigator.pushReplacementNamed(context, '/insert_boleto');
                  },
                  secondaryLabel: 'Importar da Galeria',
                  secondaryOnPressed: () {},
                )),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (
                _,
                status,
                __,
              ) {
                if (status.hasError) {
                  return BottomSheetWidget(
                    title: 'Não foi possível identificar um código de barras',
                    subtitle:
                        'Tente escanear novamente ou digite o código do seu boleto.',
                    primaryLabel: 'Escanear Novamente',
                    primaryOnPressed: () {
                      controller.getAvailableCameras();
                    },
                    secondaryLabel: 'Digitar Código de Barras',
                    secondaryOnPressed: () {
                      controller.dispose();
                      Navigator.pushReplacementNamed(context, '/insert_boleto');
                    },
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
