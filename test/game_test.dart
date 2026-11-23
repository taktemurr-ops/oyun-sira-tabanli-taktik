import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sira_tabanli_taktik/oyun_sira_tabanli_taktik.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(siraTaktikConfig.title.length, 33);
    expect(siraTaktikConfig.tagline.length, 33);
    for (final s in siraTaktikConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(siraTaktikConfig.gameId, siraTaktikId);
    expect(siraTaktikRules.gameId, siraTaktikId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(siraTaktikRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: siraTaktikId, optionalMechanics: siraTaktikRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(siraTaktikRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
