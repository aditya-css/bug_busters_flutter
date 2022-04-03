import 'package:bug_busters_flutter/core/constants/assets.dart';
import 'package:bug_busters_flutter/core/constants/colors.dart';
import 'package:bug_busters_flutter/models/answer_model.dart';
import 'package:bug_busters_flutter/models/question_model.dart';
import 'package:bug_busters_flutter/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../question_detail/pages/question_page.dart';
import '../right/custom_divider.dart';

class QuestionListItem extends StatelessWidget {
  final QuestionModel queModel;
  const QuestionListItem({Key? key, required this.queModel}) : super(key: key);

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
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=> QuestionPage(qId: queModel.id,)));
        },
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
                 Text(queModel.vote.toString()),
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
                    queModel.question,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    queModel.description,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.grey,
                          height: 1.6,
                          fontSize: 14,
                        ),
                  ),
                  const CustomDivider(),
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
                        queModel.user.name,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.kPrimary.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(width: 30),
                      if(size.width > 900)
                        ...[
                          const Spacer(),
                          Text(
                            timeago.format(DateTime.parse(queModel.createdAt)),
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
                            queModel.vote.toString(),
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
      ),
    );
  }
}
