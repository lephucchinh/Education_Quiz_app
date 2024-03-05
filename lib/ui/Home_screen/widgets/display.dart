import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quizgames/blocs/Update_User_Info_Bloc/update_user_info_bloc.dart';
import 'package:quizgames/blocs/my_user_bloc/my_user_bloc.dart';

class Display extends StatefulWidget {
  final String name;

  const Display({super.key, required this.name});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserInfoBloc, UpdateUserInfoState>(
  listener: (context, state) {
    if(state is UploadPictureSuccess) {
      setState(() {
         context.read<MyUserBloc>().state.user!.picture = state.userImage;
      });
    }
  },
  builder: (context, state) {
    return BlocBuilder<MyUserBloc, MyUserState>(
      builder: (context, state) {
        if (state.status == MyUserStatus.success) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, ${state.user!.name}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                  Text(
                    "Let's make this day productive",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              state.user!.picture == ""
                  ? GestureDetector(
                      onTap: () async {
                        // sử dụng ImagePicker để truy cập vào file ảnh
                        final ImagePicker picker = ImagePicker();
                        final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                            maxHeight: 500,
                            maxWidth: 500,
                            imageQuality: 40);
                        if (image == null) {
                          return;
                        } else {
                          CroppedFile? croppedFile = await ImageCropper()
                              .cropImage(
                                  sourcePath: image.path,
                                  aspectRatio: const CropAspectRatio(
                                      ratioX: 1, ratioY: 1),
                                  aspectRatioPresets: [
                                CropAspectRatioPreset.square,
                              ],
                                  uiSettings: [
                                AndroidUiSettings(
                                  toolbarTitle: 'Cropper',
                                  toolbarColor:
                                      Theme.of(context).colorScheme.primary,
                                  toolbarWidgetColor: Colors.white,
                                  initAspectRatio:
                                      CropAspectRatioPreset.original,
                                  lockAspectRatio: false,
                                ),
                                IOSUiSettings(
                                  title: 'Cropper',
                                ),
                              ]);
                          if (croppedFile != null) {
                            setState(() {
                              context.read<UpdateUserInfoBloc>().add(
                                  UpdatePicture(
                                      file: croppedFile.path,
                                      userId: context
                                          .read<MyUserBloc>()
                                          .state
                                          .user!
                                          .id));
                            });
                          }
                        }
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            shape: BoxShape.circle),
                        child: Icon(CupertinoIcons.person,
                            color: Colors.grey.shade400),
                      ),
                    )
                  : Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                state.user!.picture!,
                              ),
                              fit: BoxFit.cover)),
                    ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  },
);
  }
}
