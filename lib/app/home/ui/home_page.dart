import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/global_container.dart';
import '../../../core/helpers/custom_size.dart';
import '../../../core/helpers/string_capitalize.dart';
import '../../../core/theme/ca_colors.dart';
import '../data/models/job_model.dart';
import 'bloc/jobs_bloc.dart';
import 'bloc/jobs_state.dart';
import 'webview_page.dart';
import 'widgets/apresentation.dart';
import 'widgets/company_culture.dart';
import 'widgets/job_information.dart';
import 'widgets/meet_our_team.dart';
import 'widgets/sales_woman.dart';
import 'widgets/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IJobsBloc bloc;
  late TextEditingController searchController;

  @override
  void initState() {
    bloc = sl.get<IJobsBloc>();
    bloc.getJobs();
    searchController = TextEditingController();
    super.initState();
  }

  final List<String> imagesPaths = [
    'assets/images/image_bg_2.jpeg',
    'assets/images/image_bg_2.jpeg',
    'assets/images/image_bg_2.jpeg',
    'assets/images/image_bg_2.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Apresentation(
              title: 'trabalhe no elo7',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et viverra orci. Praesent consequat dolor tellus, eget viverra risus hendrerit non. Sed rutrum condimentum maximus. Donec pellentesque libero eu eros sagittis.',
              pathImage: 'assets/images/image_bg_1.jpeg',
              buttonText: 'vagas em aberto',
              onTap: () {
                goToWebView();
              },
            ),
            52.h,
            const SalesWoman(
              title: 'Palavra da vendedora',
              subtitle: 'Sed rutrum condimentum',
              description:
                  'Donec in vestibulum elit. Aliquam finibus facilisis elit, sit amet malesuada nibh tempor sed. Aliquam consequat ultrices fringilla. Sed id quam sollicitudin mi ultricies feugiat a vel velit. Pellentesque finibus vel tortor sed hendrerit. Vestibulum eu sem sapien. Nullam mollis, leo ut finibus euismod, arcu eros aliquam augue, in congue neque nulla vehicula purus.',
              pathImage: 'assets/images/image_bg_2.jpeg',
            ),
            40.h,
            const MeetOurTeam(
              title: 'Conheça nosso time fora de série',
              imagesPath: [
                'assets/images/image_bg_3.jpeg',
                'assets/images/image_bg_4.jpeg',
                'assets/images/image_bg_5.jpeg',
                'assets/images/image_bg_6.jpeg'
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: const BoxDecoration(
                color: CAColors.lightYellow,
              ),
              child: Column(
                children: [
                  40.h,
                  const CompanyCulture(
                    pathImage: 'assets/images/icon_1.png',
                    title: 'Resultados',
                    description:
                        'Donec in vestibulum elit. Aliquam finibus facilisis elit, sit amet malesuada nibh tempor sed. Aliquam consequat ultrices fringilla. Sed id quam sollicitudin mi ultricies feugiat a vel velit. Pellentesque finibus vel tortor sed hendrerit. Vestibulum eu sem sapien.',
                  ),
                  CompanyCulture(
                    pathImage: 'assets/images/icon_2.png',
                    title: 'Qualidade de vida',
                    description:
                        'Donec in vestibulum elit. Aliquam finibus facilisis elit, sit amet malesuada nibh tempor sed. Aliquam consequat ultrices fringilla.',
                    onPressed: () {
                      goToWebView();
                    },
                    buttonText: 'dignissim quis',
                  ),
                  const CompanyCulture(
                    pathImage: 'assets/images/icon_3.png',
                    title: 'Nossos valores',
                    description:
                        'Donec in vestibulum elit. Aliquam finibus facilisis elit, sit amet malesuada nibh tempor sed. Aliquam consequat ultrices fringilla. Sed id quam sollicitudin mi ultricies feugiat a vel velit. Pellentesque finibus vel tortor sed hendrerit. Vestibulum eu sem sapien.',
                  ),
                ],
              ),
            ),
            Container(
              height: 259,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/image_bg_7.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            40.h,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      'Vagas em aberto',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  24.h,
                  Search(
                    hintText: 'Pesquise por cargo ou área',
                    searchController: searchController,
                    onSearch: (value) {
                      bloc.searchJobs(searchText: value);
                    },
                  ),
                  40.h,
                  BlocBuilder(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is JobsLoading) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: CAColors.blue,
                            ),
                          ),
                        );
                      } else if (state is JobsLoaded) {
                        final List<JobModel> listJobs = state.jobs;

                        return listJobs.isNotEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Desenvolvimento',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  32.h,
                                  ...listJobs.map((job) {
                                    return JobInformation(
                                      title: capitalize(job.title),
                                      location: capitalize(job.location),
                                    );
                                  }),
                                ],
                              )
                            : Container();
                      }
                      return Container();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToWebView() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WebViewPage(
          url: 'https://www.elo7.com.br/',
        ),
      ),
    );
  }
}
