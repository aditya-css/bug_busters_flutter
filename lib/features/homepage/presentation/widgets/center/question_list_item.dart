import 'package:bug_busters_flutter/core/constants/assets.dart';
import 'package:bug_busters_flutter/core/constants/colors.dart';
import 'package:bug_busters_flutter/features/homepage/presentation/widgets/right/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuestionListItem extends StatelessWidget {
  // final String question;
  // final String description;
  // final String username;
  const QuestionListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.fromLTRB(20, 20, 30, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.kGrey.withOpacity(0.2),
            blurRadius: 14,
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text('30'),
              const SizedBox(height: 10.0),
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(width: 40),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What does the say?",
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 20),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Colors.grey,
                        height: 1.6,
                        fontSize: 14,
                      ),
                ),
                CustomDivider(),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(
                        "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg",
                      ),
                    ),
                    const SizedBox(width: 10),
                    if(size.width > 600)
                      Text(
                        "Questioned By",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    const SizedBox(width: 10),
                    Text(
                      "Happy Makadiya",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.kPrimary.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(width: 30),

                    if(size.width > 900)
                      ...[
                        const Spacer(),
                        Text(
                          "12 hr ago",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                        ),
                        const SizedBox(width: 20),
                        SvgPicture.asset(
                          AppAssets.kAnsIcon,
                          width: 18,
                          height: 18,
                          color: AppColors.kGrey,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "50+",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(),
                        ),
                      ]

                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
