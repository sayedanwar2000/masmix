abstract class StorageStates {}

class StorageInitialState extends StorageStates {}

class StorageChangeCheckBoxState extends StorageStates {}

class StorageChangeCountryState extends StorageStates {}

class StorageChangeCityState extends StorageStates {}

class StorageChangeCharacterState extends StorageStates {}

class StorageLoadingState extends StorageStates {}

class StorageSuccessState extends StorageStates {}

class StorageErrorState extends StorageStates {
  final String error;

  StorageErrorState(this.error);
}
