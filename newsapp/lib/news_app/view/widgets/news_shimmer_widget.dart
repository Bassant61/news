import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsShimmerListLoading extends StatelessWidget{
  const NewsShimmerListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (contest,index){
        return const NewsShimmerWidget();
      }, 
      separatorBuilder: (contest,index){
        return const SizedBox(
          height: 15,
        );
      }, 
      itemCount: 5);
  }

}
class NewsShimmerWidget extends StatelessWidget {
  const NewsShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              offset: const Offset(0, 4),
              blurRadius: 8,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 110,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[200]!,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(0.8)
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
              height: 16,
              ),
            SizedBox(
              height: 16,
            ), 
                SizedBox(
                  height: 16,
                  width: 60,
                  child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[200]!,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0.8)
                ),
              ),
            ),
          ),
          SizedBox(
                  height: 16,
                  width: 100,
                  child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[200]!,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0.8)
                ),
              ),
            ),
          ),
          SizedBox(
                  height: 16,
                  width: 120,
                  child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[200]!,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0.8)
                ),
              ),
            ),
          ),
          SizedBox(
                  height: 16,
                  width: 90,
                  child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[200]!,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0.8)
                    ),
              ),
            ),
          ),
          SizedBox(
                  height: 16,
                  width: 60,
                  child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[200]!,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(0.8)
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
      width: 8,
            ),
          ],
        ),
      ),
    );
  }
}