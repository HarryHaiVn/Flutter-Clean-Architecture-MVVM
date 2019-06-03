abstract class BaseUseCase<T>{
  Future<T> perform();
}