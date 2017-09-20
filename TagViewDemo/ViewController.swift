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
    false ? tagsWithAction() : tagsWithSelectAndEdit()
  }
  
  
  @objc func actionButton(_ sender: UIButton) {
    print(sender.title(for: .normal) ?? "")
  }

  func tagsWithAction() {
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

  
  
  @objc func actionEditButton(_ sender: UIButton) {
    print(tagView.selectedTagTitles)
  }
  
  func tagsWithSelectAndEdit() {
    let tags = [
      ("Java",true),("Swift",false),("JavaScript",true),("Objective-C",true),("Ruby",false),("Pearl",true),("C++",true),("C",false),("22",false),
      ("Java",true),("Swift",false),("JavaScript",true),("Objective-C",true),("Ruby",false),("Pearl",true),("C++",true),("C",false),("22",false),
      ("Java",true),("Swift",false),("JavaScript",true),("Objective-C",true),("Ruby",false),("Pearl",true),("C++",true),("C",false),("22",false),
      ("Java",true),("Swift",false),("JavaScript",true),("Objective-C",true),("Ruby",false),("Pearl",true),("C++",true),("C",false),("22",false),
      ("Java",true),("Swift",false),("JavaScript",true),("Objective-C",true),("Ruby",false),("Pearl",true),("C++",true),("C",false),("22",false),
      ("Java",true),("Swift",false),("JavaScript",true),("Objective-C",true),("Ruby",false),("Pearl",true),("C++",true),("C",false),("22",false),
      ]
    tagView.createCloudTagsWithTitles(tags.sorted { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 && !$1.1 })
    tagView.addEditButton(title: "Print selected tags", target: self, action: #selector(actionEditButton))
  }
  
  
}

