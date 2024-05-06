import 'package:advanced_basics/models/quiz_question.dart';

final questions = [
  QuizQuestion(
    '플러터 UI의 주요 구성 요소는 무엇입니까?',
    [
      '위젯',
      '컴포넌트',
      '블록',
      '함수',
    ],
  ),
  QuizQuestion('플러터 UI는 어떻게 구축됩니까?', [
    '코드에서 위젯을 결합함으로써',
    '시각적 편집기에서 위젯을 결합함으로써',
    '설정 파일에서 위젯을 정의함으로써',
    'iOS에는 XCode를 사용하고 Android에는 Android Studio를 사용함으로써',
  ]),
  QuizQuestion(
    'StatefulWidget의 목적은 무엇입니까?',
    [
      '데이터가 변경되면 UI를 업데이트합니다.',
      'UI가 변경되면 데이터를 업데이트합니다.',
      '데이터 변경을 무시합니다.',
      '데이터에 의존하지 않는 UI를 렌더링합니다.',
    ],
  ),
  QuizQuestion(
    'StatelessWidget과 StatefulWidget 중 어떤 위젯을 더 자주 사용해야 합니까?',
    [
      'StatelessWidget',
      'StatefulWidget',
      '둘 다 동일하게 좋습니다.',
      '위의 어느 것도 아닙니다.',
    ],
  ),
  QuizQuestion(
    'StatelessWidget에서 데이터를 변경하면 무엇이 발생합니까?',
    [
      'UI가 업데이트되지 않습니다.',
      'UI가 업데이트됩니다.',
      '가장 가까운 StatefulWidget이 업데이트됩니다.',
      '중첩된 StatefulWidgets가 업데이트됩니다.',
    ],
  ),
  QuizQuestion(
    'StatefulWidget 내에서 데이터를 어떻게 업데이트해야 합니까?',
    [
      'setState()를 호출함으로써',
      'updateData()를 호출함으로써',
      'updateUI()를 호출함으로써',
      'updateState()를 호출함으로써',
    ],
  ),
];
