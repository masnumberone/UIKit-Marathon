# UIKit-Marathon

Это iOS приложение с выполненным [марафоном](https://sparrowcode.io/ru/xcode-shop/marathon) по UIKit. Приложение написано без применения storyboard. Используется архитектура MVVM + Coordinator.

## Основные классы
* `RootCoordinator` реализует логику навигации между экранами.
* `RootViewController` является основным вью контроллером. Содежит карточки заданий, по нажатию на которые происходит переход к реализации соответсвующего задания.
* `HeaderRootView` является вью с заголовками для `RootViewController`.
* `TaskCollectionCell` является ячейкой коллекции для `RootViewController`. 
* `TaskViewControllers` содержит вью контроллеры выполненных на марафоне заданий.

## Демо
<p align="left">
  <img src="https://github.com/masnumberone/UIKit-Marathon/assets/95964517/ee2fcb18-41f3-40f6-babf-7cd5b37c5730" width="30%"/>
  <img src="https://github.com/masnumberone/UIKit-Marathon/assets/95964517/3b36f816-0e9a-40ac-8962-dccf060f5431" width="30%"/>
  <img src="https://github.com/masnumberone/UIKit-Marathon/assets/95964517/a4421365-8a26-494a-a7a2-ee9766ceec1a" width="30%"/>
  <img src="https://github.com/masnumberone/UIKit-Marathon/assets/95964517/42ade567-d1ee-4cec-8281-4c1e24d97150" width="30%"/>
  <img src="https://github.com/masnumberone/UIKit-Marathon/assets/95964517/d27d4055-1e1d-4c7d-9ffd-87113c4ef734" width="30%"/>
  <img src="https://github.com/masnumberone/UIKit-Marathon/assets/95964517/037b4844-d8af-40c6-a2e5-cf0f8a9a411e" width="30%"/>
</p

