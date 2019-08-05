//
//  ProgressView.swift
//  Cards of clash of clans
//
//  Created by Patricia Zambrano on 8/4/19.
//  Copyright © 2019 Patricia Zambrano. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var lblLoading: UILabel!
    fileprivate let deviceSize = UIScreen.main.bounds.size
    fileprivate var delegate: ComponentViewDelegate!
    
    init(delegate: ComponentViewDelegate) {
        let frame = CGRect(x: 0, y: 0, width: deviceSize.width, height: deviceSize.height)
        super.init(frame: frame)
        Bundle.main.loadNibNamed(TextsApps.progressView.rawValue, owner: self, options: nil)
        self.delegate = delegate
        self.view!.frame = frame
        self.delegate.add(view: self, isProgressView: true)
        self.addSubview(self.view!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func show() {
        self.bringSubviewToFront(self)
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.view.alpha = 1
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    func close() {
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.view.alpha = 0
            self.layoutIfNeeded()
        }, completion: { finished in
            self.removeFromSuperview()
        })
    }
}
