import 'package:praxis_flutter/domain/utils/safe_result.dart';

abstract class UseCase<Result, Params> {
  Future<SafeResult<Result>> call(Params params);
}
