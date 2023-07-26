import 'package:flutter/material.dart';

import '../viewmodel/config_type_viewmodel.dart';
import 'single_config_interactor.dart';

class ConfigInteractor extends StatelessWidget {
  const ConfigInteractor({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        _ConfigTupleCard(
          "Name",
          SingleConfigInteractor(ConfigType.name),
          SingleConfigInteractor(ConfigType.nameLimit),
        ),
        _ConfigTupleCard(
          "Quantity",
          SingleConfigInteractor(ConfigType.quantity),
          SingleConfigInteractor(ConfigType.quantityLimit),
        ),
        _ConfigTupleCard(
          "Height",
          SingleConfigInteractor(ConfigType.height),
          SingleConfigInteractor(ConfigType.heightLimit),
        ),
        _ConfigTupleCard(
          "Width",
          SingleConfigInteractor(ConfigType.width),
          SingleConfigInteractor(ConfigType.widthLimit),
        ),
      ],
    );
  }
}


//TODO: Move to another file
class _ConfigTupleCard extends StatelessWidget {
  final String name;
  final SingleConfigInteractor config1;
  final SingleConfigInteractor config2;
  const _ConfigTupleCard(this.name, this.config1, this.config2);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name),
            Row(
              children: [
                config1,
                const SizedBox(width: 5),
                config2,
              ],
            )
          ],
        ),
      ),
    );
  }
}
