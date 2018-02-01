//
//  CompareTableViewController.swift
//  Kuliza
//
//  Created by Deblina Das on 04/01/18.
//  Copyright © 2018 Deblinas. All rights reserved.
//

import UIKit
import FSLineChart

protocol DataDelegate {
    func setupTabViewController(for index: Int)
}
class CompareTableViewController: UITableViewController, DataDelegate {

    @IBOutlet var graphTabCollectionView: UICollectionView!
    @IBOutlet var graphTitleLabel: UILabel!
    @IBOutlet var cashPlusAmountLabel: UILabel!
    @IBOutlet var cashReliefAmountLabel: UILabel!
    @IBOutlet var dataCollectionView: UICollectionView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var graphView: UIView!
    
    private var selectedRow = 2
    private var graphData: GraphDataViewModel!
    private var graph: Graph!
    private var datasource: DataCollectionViewDataSource!
    private var controllerArray: [UIViewController]!
    
    var portfolioViewController = PortfolioViewController.viewcontroller()
    var vc1 = ViewController.viewController(with: .scheme)
    var vc2 = ViewController.viewController(with: .performance)
    var vc3 = ViewController.viewController(with: .management)
    
    
    class func viewcontroller() -> CompareTableViewController {
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompareTableViewController") as! CompareTableViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // The controller array which holds the controller for each tab in bottom section
        controllerArray = [vc1, vc2, portfolioViewController, vc3]
        
        // The initialization of bottom section tabs data source with scheme, performance, portfolio etc.
        datasource = DataCollectionViewDataSource(collectionView: dataCollectionView, delegate: self)
        
        // setting up tableview datasource and delegate
        dataCollectionView.dataSource = datasource
        dataCollectionView.delegate = datasource
        
        // reloading collection view
        dataCollectionView.reloadData()
        
        // Graph is a structure holding number of months and the principle amount
        graph = Graph(months: 12, principleAmount: principleAmount)
        
        // Graph View Model is the ViewModel Class for this self class. Initializing it with graph structure.
        graphData = GraphDataViewModel(graph: graph) // default is 1 year
        graphTabCollectionView.reloadData()
        
        // Configuring the graph data
        configureGraphData()
        
        // setting up the portfolio tab as the default tab
        setupTab(index: 2) // portfolio is default tab
    }
    
    
    func configureGraphData() {
        graphTitleLabel.text = "Growth of hypothetical investment of ` \(graph.principleAmount!) for the selected period"
        cashPlusAmountLabel.text = "` \(graphData.cashPlusValue)"
        cashReliefAmountLabel.text = "` \(graphData.taxReliefValue)"
        (graphView as! Chart).clearData()
        (graphView as! Chart).load(with:graphData.cashPlusData, taxReliefData: graphData.taxReliefData)
    }
    
    func setupTab(index: Int) {
        switch index {
        case 1:
            remove(controller: controllerArray[0])
            remove(controller: controllerArray[2])
            remove(controller: controllerArray[3])
        case 2:
            remove(controller: controllerArray[0])
            remove(controller: controllerArray[1])
            remove(controller: controllerArray[3])
        case 3:
            remove(controller: controllerArray[0])
            remove(controller: controllerArray[1])
            remove(controller: controllerArray[2])
        default: // 0
            remove(controller: controllerArray[1])
            remove(controller: controllerArray[2])
            remove(controller: controllerArray[3])
        }
        add(controller: controllerArray[index])
    }
    
    fileprivate func remove(controller: UIViewController) {
        controller.willMove(toParentViewController: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }
    
    fileprivate func add(controller: UIViewController) {
        self.addChildViewController(controller)
        controller.view.frame = containerView.bounds
        containerView.addSubview(controller.view)
        controller.didMove(toParentViewController: self)
    }
    
    // MARK: Data Delegate
    func setupTabViewController(for index: Int) {
        setupTab(index: index)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 415 : 600
    }
}

extension CompareTableViewController: UICollectionViewDelegate, UICollectionViewDataSource,  UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.graphTabCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GraphTabCollectionViewCell
        cell.configure(with: indexPath.row, isSelected: indexPath.row == selectedRow ? true : false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        let cell = self.graphTabCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GraphTabCollectionViewCell
        cell.configure(with: indexPath.row, isSelected: true)
        self.graphTabCollectionView.reloadData()
        var months = 12
        switch indexPath.row {
        case 0: months  = 3
        case 1: months  = 6
        case 3: months  = 36 // 3 years
        case 4: months  = 60 // 5 years
        default: months = 12 // 1 year, default
        }
        graph = Graph(months: months, principleAmount: principleAmount)
        graphData = GraphDataViewModel(graph: graph)
        configureGraphData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: graphTabCollectionView.bounds.width / 5, height: graphTabCollectionView.bounds.height * 0.95)
    }
}

class Chart: FSLineChart {

    override func awakeFromNib() {
    }
    
    public func load(with cashPlusData: [Double], taxReliefData: [Double]) {
        verticalGridStep = 5
        horizontalGridStep = 9
        labelForIndex = { "\($0)" }
        labelForValue = { "$\($0)" }
        
        displayDataPoint = false
        setChartData(cashPlusData)
        setChartData(taxReliefData)
    }
    
}


