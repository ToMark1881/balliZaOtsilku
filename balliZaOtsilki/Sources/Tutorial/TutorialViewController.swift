//
//  TutorialViewController.swift
//  balliZaOtsilki
//
//  Created by Vladyslav Vdovychenko on 27.12.2020.
//

import UIKit

protocol TutorialViewControllerDelegate: class {
    func tutorialViewControllerDidComplete()
}

class TutorialViewController: BaseViewController {

    weak var tutorialDelegate: TutorialViewControllerDelegate?
    private var pageViewController: UIPageViewController?
    private var currentPage: Int = 0
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.viewControllerAtIndex(1),
                self.viewControllerAtIndex(2),
                self.viewControllerAtIndex(3),
                self.viewControllerAtIndex(4)]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let controller = orderedViewControllers.first!
        self.pageViewController?.setViewControllers([controller], direction: .forward, animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPageViewController" {
            if let controller = segue.destination as? UIPageViewController {
                self.pageViewController = controller
                self.pageViewController?.dataSource = self
                self.pageViewController?.delegate = self
            }
        }
    }
    
    @IBAction func didTapOnCloseButton(_ sender: Any) {
            self.tutorialDelegate?.tutorialViewControllerDidComplete()
    }
    
    @IBAction func didTapOnNextButton(_ sender: Any) {
        if self.currentPage == (orderedViewControllers.count - 1) {
            self.tutorialDelegate?.tutorialViewControllerDidComplete()
        } else {
            turnThePage()
        }
    }
    
    fileprivate func turnThePage() {
        let page = self.currentPage
        if page == (orderedViewControllers.count - 1) { return }
        self.pageViewController?.setViewControllers([orderedViewControllers[page + 1]], direction: .forward, animated: true, completion: nil)
        self.currentPage += 1
        TapticEngineGenerator.shared.generateFeedback(.light)
    }
    
    fileprivate func viewControllerAtIndex(_ index: Int) -> UIViewController {
        let storyboard = UIStoryboard(name: "Tutorial", bundle: nil)

        let controller = storyboard.instantiateViewController(withIdentifier: "quickTourController\(index)")
        
        return controller
    }

}

// MARK: - UIPageViewControllerDelegate

extension TutorialViewController: UIPageViewControllerDelegate {

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if finished {
            guard let current = pageViewController.viewControllers?.first else {
                return
            }

            self.view.backgroundColor = current.view.backgroundColor

            guard let index = self.orderedViewControllers.firstIndex(of: current) else {
                return
            }

            self.currentPage = index
            TapticEngineGenerator.shared.generateFeedback(.light)
        }
    }
    
}

// MARK: - UIPageViewControllerDataSource

extension TutorialViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else {
            return nil
        }

        guard orderedViewControllers.count > previousIndex else {
            return nil
        }

        return orderedViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count

        guard orderedViewControllersCount != nextIndex else {
            return nil
        }

        guard orderedViewControllersCount > nextIndex else {
            return nil
        }

        return orderedViewControllers[nextIndex]
    }
}
