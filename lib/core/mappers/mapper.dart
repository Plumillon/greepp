import 'from_mapper.dart';
import 'to_mapper.dart';

abstract class Mapper<From, To>
    implements FromMapper<From, To>, ToMapper<From, To> {}
