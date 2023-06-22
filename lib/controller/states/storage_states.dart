abstract class StorageStates {}

class StorageInitialState extends StorageStates {}

class StorageChangeCheckBoxState extends StorageStates {}

class StorageChangeCountryState extends StorageStates {}

class StorageChangeCityState extends StorageStates {}

class StorageChangeCharacterState extends StorageStates {}

class StorageChangeSizeState extends StorageStates {}

class StorageLoadingState extends StorageStates {}

class StorageSuccessState extends StorageStates {}

class StorageErrorState extends StorageStates {
  final String error;

  StorageErrorState(this.error);
}

class StorageRadioButtonLoadingState extends StorageStates {}

class StorageRadioButtonSuccessState extends StorageStates {}

class StorageRadioButtonErrorState extends StorageStates {
  final String error;

  StorageRadioButtonErrorState(this.error);
}

class StorageSizeLoadingState extends StorageStates {}

class StorageSizeSuccessState extends StorageStates {}

class StorageSizeErrorState extends StorageStates {
  final String error;

  StorageSizeErrorState(this.error);
}
