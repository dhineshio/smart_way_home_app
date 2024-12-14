import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smart_way_home/features/home_screen/widgets/rooms_add_bs.dart';
import 'package:smart_way_home/features/home_screen/controllers/rooms_controller.dart';
import 'package:smart_way_home/features/home_screen/bloc/rooms_bloc.dart';
import 'package:smart_way_home/utils/constants/colors.dart';
import 'package:smart_way_home/utils/image_convert/FUI.dart';

class RoomsCategory extends StatelessWidget {
  RoomsCategory({super.key});
  final RoomsController _controller = Get.put(RoomsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: SizedBox(
                height: 80,
                child: BlocConsumer<RoomsBloc, RoomsState>(
                  listener: (context, state) {
                    if (state is GetRoomsSuccessState) {
                      _controller.iconsId.clear();
                      for (var item in state.response) {
                        _controller.iconsId.add(item['iconId']);
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is RoomsLoadingState ||
                        state is GetRoomsFailureState) {
                      return _buildDataLoading();
                    } else {
                      return _controller.iconsId.isEmpty
                          ? _buildRoomDataNotFount()
                          : _buildLoadRoomData();
                    }
                  },
                ),
              ),
            ),
            _buildAddRoom(context),
          ],
        ),
      ],
    );
  }

  Expanded _buildAddRoom(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () => showModalBottomSheet(
          context: context,
          showDragHandle: true,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => RoomsAddBs(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 4),
            Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: SColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: SColors.white),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 60,
              child: Text(
                "Addroom",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontSize: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ! Loading
  SizedBox _buildDataLoading() {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: SColors.grey,
            highlightColor: SColors.darkGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  decoration: const BoxDecoration(
                    color: SColors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 40,
                  height: 10,
                  margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ! If a No Data found
  SizedBox _buildRoomDataNotFount() {
    return const SizedBox(
      height: 70,
      child: Center(
        child: Text("No Room Found", style: TextStyle(color: SColors.darkGrey)),
      ),
    );
  }

  // ! Data loaded
  ListView _buildLoadRoomData() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _controller.iconsId.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: SColors.grey,
                    shape: BoxShape.circle,
                  ),
                  child:
                      FUI(_controller.roomList[_controller.iconsId[index]]![0]),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 60,
                  child: Text(
                    _controller.roomList[_controller.iconsId[index]]![1],
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 8),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 10),
          ],
        );
      },
    );
  }
}
