//
//  ScrollableStackView.swift
//  MessageKit
//
//  Created by Kyle MacNamara on 1/11/18.

import Foundation
import UIKit

open class HorizontalScrollableStackView: UIScrollView {
    
    public var stackView: UIStackView!
    
    public var arrangedSubviews: [UIView] {
        get {
            return self.stackView.arrangedSubviews
        }
    }
    public var spacing: CGFloat {
        get {
            return self.stackView.spacing
        }
        set {
            self.stackView.spacing = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.showsHorizontalScrollIndicator = false
        self.translatesAutoresizingMaskIntoConstraints = false
        
        stackView = UIStackView()
        self.stackView.alignment = .fill
        self.stackView.distribution = .fill
        self.stackView.axis = .horizontal
        self.stackView.spacing = CGFloat(0)
        self.addSubview(stackView)
        
        // Pin the edges of the stack view to the edges of the scroll view that contains it
        self.topAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: stackView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: stackView.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true

        // Set the width of the stack view to the width of the scroll view for vertical scrolling
        self.heightAnchor.constraint(equalTo: stackView.heightAnchor).isActive = true

        self.contentSize = self.stackView.frame.size
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
                
    }
    
    public func addArrangedSubview(_ view: UIView) {
        self.stackView.addArrangedSubview(view)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

