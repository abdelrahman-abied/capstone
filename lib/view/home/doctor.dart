import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/home_view_model.dart';

class DoctorWidget extends ConsumerStatefulWidget {
  const DoctorWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DoctorWidgetState();
}

class _DoctorWidgetState extends ConsumerState<DoctorWidget> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () => ref.read(homeVM).getHomeData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ref.watch(homeVM).data.length,
      itemBuilder: (context, index) {
        final item = ref.watch(homeVM).data[index];
        return ListTile(
          trailing: CircleAvatar(
            child: CachedNetworkImage(
              imageUrl: item.image ?? "",
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          title: Text(item.name ?? ""),
          subtitle: Text(item.email ?? ""),
        );
      },
    );
  }
}