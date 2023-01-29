import 'package:dartz/dartz.dart';

import '../../app/errors/failure.dart';

abstract class BaseUseCase<Outputs, Inputs> {
  Future<Either<Failure, Outputs>> call(Inputs inputs);
}
