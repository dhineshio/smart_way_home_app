import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_way_home/features/home_screen/models/DeviceData.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/constants/icons.dart';
import 'package:smart_way_home/utils/image_convert/FUI.dart';

class Devices extends StatelessWidget {
  const Devices({super.key});

  @override
  Widget build(BuildContext context) {
    List<DeviceData> devices = [
      DeviceData(
          deviceId: 101,
          deviceName: "Air Conditioner",
          homeCategory: "BedRoom",
          isActive: true),
      DeviceData(
          deviceId: 102,
          deviceName: "Smart Light",
          homeCategory: "BedRoom",
          isActive: false),
      DeviceData(
          deviceId: 103,
          deviceName: "Refrigerator",
          homeCategory: "Kitchen",
          isActive: true),
      DeviceData(
          deviceId: 104,
          deviceName: "Thermostat",
          homeCategory: "Hall",
          isActive: false),
      DeviceData(
          deviceId: 105,
          deviceName: "Smart TV",
          homeCategory: "LivingRoom",
          isActive: true),
      DeviceData(
          deviceId: 106,
          deviceName: "Washing Machine",
          homeCategory: "KidsRoom",
          isActive: false),
      DeviceData(
          deviceId: 107,
          deviceName: "Dishwasher",
          homeCategory: "Kitchen",
          isActive: true),
      DeviceData(
          deviceId: 108,
          deviceName: "Ceiling Fan",
          homeCategory: "BedRoom",
          isActive: true),
      DeviceData(
          deviceId: 109,
          deviceName: "Heater",
          homeCategory: "BathRoom",
          isActive: false),
      DeviceData(
          deviceId: 110,
          deviceName: "Sound System",
          homeCategory: "LivingRoom",
          isActive: true),
      DeviceData(
          deviceId: 111,
          deviceName: "Air Conditioner",
          homeCategory: "BedRoom",
          isActive: false),
      DeviceData(
          deviceId: 112,
          deviceName: "Smart Light",
          homeCategory: "BedRoom",
          isActive: true),
      DeviceData(
          deviceId: 113,
          deviceName: "Refrigerator",
          homeCategory: "Kitchen",
          isActive: false),
      DeviceData(
          deviceId: 114,
          deviceName: "Thermostat",
          homeCategory: "Hall",
          isActive: true),
      DeviceData(
          deviceId: 115,
          deviceName: "Smart TV",
          homeCategory: "LivingRoom",
          isActive: false),
      DeviceData(
          deviceId: 116,
          deviceName: "Washing Machine",
          homeCategory: "KidsRoom",
          isActive: true),
      DeviceData(
          deviceId: 117,
          deviceName: "Dishwasher",
          homeCategory: "Kitchen",
          isActive: false),
      DeviceData(
          deviceId: 118,
          deviceName: "Ceiling Fan",
          homeCategory: "BedRoom",
          isActive: true),
      DeviceData(
          deviceId: 119,
          deviceName: "Heater",
          homeCategory: "BathRoom",
          isActive: true),
      DeviceData(
        deviceId: 120,
        deviceName: "Sound System",
        homeCategory: "LivingRoom",
        isActive: false,
      ),
      DeviceData(
          deviceId: 121,
          deviceName: "Air Conditioner",
          homeCategory: "BedRoom",
          isActive: true),
      DeviceData(
          deviceId: 122,
          deviceName: "Smart Light",
          homeCategory: "BedRoom",
          isActive: false),
      DeviceData(
          deviceId: 123,
          deviceName: "Refrigerator",
          homeCategory: "Kitchen",
          isActive: true),
      DeviceData(
          deviceId: 124,
          deviceName: "Thermostat",
          homeCategory: "Hall",
          isActive: false),
      DeviceData(
          deviceId: 125,
          deviceName: "Smart TV",
          homeCategory: "LivingRoom",
          isActive: true),
      DeviceData(
          deviceId: 126,
          deviceName: "Washing Machine",
          homeCategory: "KidsRoom",
          isActive: false),
      DeviceData(
          deviceId: 127,
          deviceName: "Dishwasher",
          homeCategory: "Kitchen",
          isActive: true),
      DeviceData(
          deviceId: 128,
          deviceName: "Ceiling Fan",
          homeCategory: "BedRoom",
          isActive: false),
      DeviceData(
          deviceId: 129,
          deviceName: "Heater",
          homeCategory: "BathRoom",
          isActive: true),
      DeviceData(
          deviceId: 130,
          deviceName: "Sound System",
          homeCategory: "LivingRoom",
          isActive: false),
      DeviceData(
          deviceId: 131,
          deviceName: "Air Conditioner",
          homeCategory: "BedRoom",
          isActive: true),
      DeviceData(
          deviceId: 132,
          deviceName: "Smart Light",
          homeCategory: "BedRoom",
          isActive: false),
      DeviceData(
          deviceId: 133,
          deviceName: "Refrigerator",
          homeCategory: "Kitchen",
          isActive: true),
      DeviceData(
          deviceId: 134,
          deviceName: "Thermostat",
          homeCategory: "Hall",
          isActive: false),
      DeviceData(
          deviceId: 135,
          deviceName: "Smart TV",
          homeCategory: "LivingRoom",
          isActive: true),
      DeviceData(
          deviceId: 136,
          deviceName: "Washing Machine",
          homeCategory: "KidsRoom",
          isActive: true),
      DeviceData(
          deviceId: 137,
          deviceName: "Dishwasher",
          homeCategory: "Kitchen",
          isActive: false),
      DeviceData(
          deviceId: 138,
          deviceName: "Ceiling Fan",
          homeCategory: "BedRoom",
          isActive: true),
      DeviceData(
          deviceId: 139,
          deviceName: "Heater",
          homeCategory: "BathRoom",
          isActive: false),
      DeviceData(
          deviceId: 140,
          deviceName: "Sound System",
          homeCategory: "LivingRoom",
          isActive: true),
    ];

    final colors = [
      Color(0xff9789C8),
      Color(0xff7FB9C1),
      Color(0xffC99D6C),
      Color(0xffD9917C),
    ];

    return Expanded(
      child: GridView.builder(
          itemCount: devices.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: colors[index % colors.length].withOpacity(.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const FUI(
                    SIcons.passwordIcon,
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    devices[index].deviceName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Switch(
                    value: devices[index].isActive,
                    onChanged: (value) {},
                    activeColor: colors[index % colors.length],
                    activeTrackColor: SColors.white,
                    inactiveTrackColor:
                        colors[index % colors.length].withOpacity(.03),
                    inactiveThumbColor: colors[index % colors.length],
                    trackOutlineColor: WidgetStateProperty.all(
                      devices[index].isActive
                          ? SColors.white
                          : colors[index % colors.length],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
