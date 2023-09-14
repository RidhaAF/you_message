import 'dart:async';

import 'package:get/get.dart';
import 'package:you_message/app/data/models/message.dart';
import 'package:you_message/app/data/models/profile.dart';
import 'package:you_message/app/data/models/room.dart';
import 'package:you_message/app/data/services/profile_service.dart';
import 'package:you_message/app/data/services/rooms_service.dart';
import 'package:you_message/app/routes/app_routes.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';

class RoomsController extends GetxController {
  final RoomService _roomService;
  final ProfileService _profileService;

  RoomsController(this._roomService, this._profileService);

  final isRoomsLoading = false.obs;
  final isRoomsLoaded = false.obs;
  final isRoomsEmpty = false.obs;
  final Map<String, StreamSubscription<Message?>> messageSubscriptions = {};
  late final String myUserId = supabase.auth.currentUser!.id;
  late List<Profile> newUsers = [];
  List<Room> rooms = [];
  StreamSubscription<List<Map<String, dynamic>>>? rawRoomsSubscription;
  final haveCalledGetRooms = false.obs;
  final isProfilesLoading = false.obs;
  final isProfilesLoaded = false.obs;
  final Map<String, Profile?> profiles = {};
  final isSigningOut = false.obs;

  Future<void> initializeRooms() async {
    if (haveCalledGetRooms.value) {
      return;
    }
    haveCalledGetRooms.value = true;
    isRoomsLoading.value = true;

    try {
      final response = await _roomService.initializeRooms();

      if (response['status'] == 200) {
        final rows = List<Map<String, dynamic>>.from(response['data']);
        newUsers = rows.map(Profile.fromJson).toList();
        update();

        roomsSubscription();
      } else {
        Get.snackbar('Error', response['message']);
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    } finally {
      isRoomsLoading.value = false;
    }
  }

  Future<void> roomsSubscription() async {
    try {
      final response = await _roomService.roomsSubscription();

      if (response['status'] == 200) {
        rawRoomsSubscription = response['data'].listen(
          (participantMaps) async {
            if (participantMaps.isEmpty) {
              isRoomsEmpty.value = true;
              update();
              return;
            }

            rooms = participantMaps
                .map<Room>(Room.fromRoomParticipants)
                .where((room) => room.otherUserId != myUserId)
                .toList();
            for (final room in rooms) {
              newestMessage(roomId: room.id);
              getProfile(userId: room.otherUserId);
            }
            isRoomsLoaded.value = true;
            update();
          },
        );
      } else {
        Get.snackbar('Error', response['message']);
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  Future<void> newestMessage({required String roomId}) async {
    try {
      final response = await _roomService.newestMessage(roomId: roomId);

      if (response['status'] == 200) {
        messageSubscriptions[roomId] = response['data'].listen((message) {
          final index = rooms.indexWhere((room) => room.id == roomId);
          rooms[index] = rooms[index].copyWith(lastMessage: message);
          rooms.sort((a, b) {
            final aTimeStamp =
                a.lastMessage != null ? a.lastMessage!.createdAt : a.createdAt;
            final bTimeStamp =
                b.lastMessage != null ? b.lastMessage!.createdAt : b.createdAt;
            return bTimeStamp.compareTo(aTimeStamp);
          });
          if (!isClosed) {
            isRoomsLoaded.value = true;
            update();
          }
        });
      } else {
        Get.snackbar('Error', response['message']);
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    }
  }

  Future<String> createRoom({required String otherUserId}) async {
    try {
      final response = await _roomService.createRoom(otherUserId: otherUserId);

      if (response['status'] == 200) {
        isRoomsLoaded.value = true;
        update();
        return response['data'];
      } else {
        Get.snackbar('Error', response['message']);
        throw response['message'];
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
      rethrow;
    }
  }

  Future<void> getProfile({required userId}) async {
    if (profiles[userId] != null) {
      return;
    }
    isProfilesLoading.value = true;

    try {
      final response = await _profileService.getProfile(profileId: userId);

      if (response['status'] == 200) {
        final data = response['data'];

        if (data == null) {
          return;
        }

        profiles[userId] = Profile.fromJson(data);

        isProfilesLoaded.value = true;
        update();
      } else {
        Get.snackbar('Error', response['message']);
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    } finally {
      isProfilesLoading.value = false;
    }
  }

  Future<void> signOut() async {
    isSigningOut.value = true;

    try {
      final response = await _profileService.signOut();

      if (response['status'] == 200) {
        Get.offAllNamed(AppRoutes.signIn);
        Get.snackbar('Success', response['message']);
      } else {
        Get.snackbar('Error', response['message']);
      }
    } catch (error) {
      Get.snackbar('Error', error.toString());
    } finally {
      isSigningOut.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    initializeRooms();
  }

  @override
  void onClose() {
    super.onClose();
    rawRoomsSubscription?.cancel();
  }
}
