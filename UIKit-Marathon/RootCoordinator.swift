//
//  RootCoordinator.swift
//  UIKit-Marathon
//
//  Created by work on 13.08.2023.
//

import UIKit

final class RootCoordinator {
    private let navigationController: UINavigationController
    private weak var rootViewController: UIViewController?
    let window: UIWindow?

    init(scene: UIWindowScene) {
        navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true

        let window = UIWindow(windowScene: scene)
        window.rootViewController = navigationController
        window.overrideUserInterfaceStyle = .light
        window.makeKeyAndVisible()

        self.window = window
    }

    func start() {
        showRootViewController()
    }

    private func showRootViewController() {
        let rootViewModel = RootViewModel(items: [TaskItem(title: "градиент и тень", imageName: "numberOne", backgroundColor: 0x7F986F),
                                                  TaskItem(title: "три кнопки", imageName: "numberTwo", backgroundColor: 0xB999BE),
                                                  TaskItem(title: "связанная анимация", imageName: "numberThree", backgroundColor: 0xDFB062),
                                                  TaskItem(title: "миксер-таблица", imageName: "numberFour", backgroundColor: 0xA6D3E7),
                                                  TaskItem(title: "компактный контроллер", imageName: "numberFive", backgroundColor: 0x6D2330),
                                                  TaskItem(title: "инерционный квадрат", imageName: "numberSix", backgroundColor: 0x6F666B),
                                                  TaskItem(title: "растягивающаяся картинка", imageName: "numberSeven", backgroundColor: 0xEFA2C2),
                                                  TaskItem(title: "нативный аватар", imageName: "numberEight", backgroundColor: 0xBEB9B3),
                                                  TaskItem(title: "заботливая коллекция", imageName: "numberNine", backgroundColor: 0xB69D81)],
                                          title: "MasN1 project",
                                          description: "задания с марафона 5’2023")
        let rootViewController = RootViewController(viewModel: rootViewModel)
        rootViewModel.onItemSelected = { [weak self] itemNumber in
            switch itemNumber {
            case 0: self?.showGradientAndShadowViewController()
            case 1: self?.showThreeButtonsViewController()
            case 2: self?.showRelatedAnimationViewController()
            case 3: self?.showMixerTableViewController()
            case 4: self?.showCompactControllerViewController()
            case 5: self?.showInertialSquareViewController()
            case 6: self?.showStretchingPictureViewController()
            case 7: self?.showNativeAvatarViewController()
            case 8: self?.showCaringCollectionViewController()
            default:
                break
            }
        }

        navigationController.setViewControllers([rootViewController], animated: false)
        self.rootViewController = rootViewController
    }

    private func showGradientAndShadowViewController() {
        let gradientAndShadowVC = GradientAndShadowViewController(nibName: nil, bundle: nil)
        navigationController.pushViewController(gradientAndShadowVC, animated: true)
    }

    private func showThreeButtonsViewController() {
        let threeButtonsVC = ThreeButtonsViewController(nibName: nil, bundle: nil)
        navigationController.pushViewController(threeButtonsVC, animated: true)
    }

    private func showRelatedAnimationViewController() {
        let relatedAnimationVC = RelatedAnimationViewController(nibName: nil, bundle: nil)
        navigationController.pushViewController(relatedAnimationVC, animated: true)
    }

    private func showMixerTableViewController() {
        let mixerTableVC = MixerTableViewController(nibName: nil, bundle: nil)
        navigationController.pushViewController(mixerTableVC, animated: true)
    }

    private func showCompactControllerViewController() {
        let compactControllerVC = CompactControllerViewController(nibName: nil, bundle: nil)
        navigationController.pushViewController(compactControllerVC, animated: true)
    }

    private func showInertialSquareViewController() {
        let inertialSquareVC = InertialSquareViewController(nibName: nil, bundle: nil)
        navigationController.pushViewController(inertialSquareVC, animated: true)
    }

    private func showStretchingPictureViewController() {
        let stretchingPictureVC = StretchingPictureViewController(nibName: nil, bundle: nil)
        navigationController.pushViewController(stretchingPictureVC, animated: true)
    }

    private func showNativeAvatarViewController() {
        let nativeAvatarVC = NativeAvatarViewController(nibName: nil, bundle: nil)
        navigationController.pushViewController(nativeAvatarVC, animated: true)
    }

    private func showCaringCollectionViewController() {
        let caringCollectionVC = CaringCollectionViewController(nibName: nil, bundle: nil)
        navigationController.pushViewController(caringCollectionVC, animated: true)
    }
}
