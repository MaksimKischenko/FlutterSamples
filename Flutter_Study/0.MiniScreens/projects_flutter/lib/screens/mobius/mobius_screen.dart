import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class MobiusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(38),
                    child: Image.asset(
                      'assets/avatar.jpg',
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    ))),
            SizedBox(height: 36),
            Text(
              'Gomes',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 36),
            CategoryTitle('У вас подключено'),
            SizedBox(height: 8),
            CategorySubtitle(
                'Подписки, автоплатежи и сервисы на которые вы подписались'),
            // ListView.builder(itemBuilder: itemBuilder)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 16),
                  PaymentItem(
                    icon: Icons.alarm_on,
                    title: 'СберПрайм',
                    subtitle: 'Платёж 9 июля',
                    sum: 199,
                  ),
                  SizedBox(width: 8),
                  PaymentItem(
                    icon: Icons.alarm_on,
                    title: 'СберПрайм',
                    subtitle: 'Платёж 9 июля',
                    sum: 199,
                  ),
                  SizedBox(width: 8),
                  PaymentItem(
                    icon: Icons.alarm_on,
                    title: 'СберПрайм',
                    subtitle: 'Платёж 9 июля',
                    sum: 199,
                  ),
                  SizedBox(width: 8),
                  PaymentItem(
                    icon: Icons.alarm_on,
                    title: 'СберПрайм',
                    subtitle: 'Платёж 9 июля',
                    sum: 199,
                  ),
                  SizedBox(width: 16),
                ],
              ),
            ),
            SizedBox(height: 38),
            CategoryTitle('Тарифы и лимиты'),
            SizedBox(height: 8),
            CategorySubtitle('Для операций в Сбербанк Онлайн'),
            ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 24),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  Map<int, IconData> icons = {
                    0: Icons.phonelink_off,
                    1: Icons.add_moderator,
                    2: Icons.info
                  };
                  Map<int, String> titles = {
                    0: 'Изменить суточный лимит',
                    1: 'Переводы без комиссии',
                    2: 'Информация о тарифах и лимитах'
                  };
                  Map<int, String?> subtitles = {
                    0: 'На платежи и переводы',
                    1: 'Показать остаток в этом месяце',
                    2: null
                  };
                  return InfoItem(
                      icon: icons[index]!,
                      title: titles[index]!,
                      subtitle: subtitles[index]);
                },
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 72),
                      child: Divider(
                        color: Colors.black.withOpacity(0.12),
                      ),
                    ),
                itemCount: 3),
            SizedBox(height: 34),
            CategoryTitle('Интересы'),
            SizedBox(height: 8),
            CategorySubtitle(
                'Мы подбираем истории и предложения по темам, которые вам нравятся'),
            SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Wrap(
                spacing: 5,
                runSpacing: -8,
                children: [
                  InterestsItem('Еда'),
                  InterestsItem('Саморазвитие'),
                  InterestsItem('Технологии'),
                  InterestsItem('Дом'),
                  InterestsItem('Досуг'),
                  InterestsItem('Забота о себе'),
                  InterestsItem('Наука'),
                ],
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
