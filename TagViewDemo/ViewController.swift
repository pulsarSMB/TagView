//
//  ViewController.swift
//  TagViewDemo
//
//  Created by pulsar on 24.08.17.
//  Copyright © 2017 pulsar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var tagView: TagView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initTagView()
  }

  
  func initTagView() {
    let tags = ["Java","Swift","JavaScript","Objective-C","Ruby","Pearl","C++","C","22",
                "Java","Swift","JavaScript","Objective-C","Ruby","Pearl","C++","C","22",
                "Java","Swift","JavaScript","Objective-C","Ruby","Pearl","C++","C","22",
                "Java","Swift","JavaScript","Objective-C","Ruby","Pearl","C++","C","22",
                "Java","Swift","JavaScript","Objective-C","Ruby","Pearl","C++","C","22",
                "Java","Swift","JavaScript","Objective-C","Ruby","Pearl","C++","C","22",
                "Java","Swift","JavaScript","Objective-C","Ruby","Pearl","C++","C","22",
                "Java","Swift","JavaScript","Objective-C","Ruby","Pearl","C++","C","22",
                ]
    tagView.createCloudTagsWithTitles(tags, target: self, action: #selector(actionButton))
  }
  
  
  func actionButton(_ sender: UIButton) {
    print(sender.title(for: .normal) ?? "")
  }
  
  
}

