//
//  ViewController.swift
//  Take, Save and retreive a photo in iOS
//
//  Created by SOL iOS Mac Mini on 5/28/19.
//  Copyright © 2019 com.arif. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageListCollectionView: UICollectionView!
    
    var imagePickerController: UIImagePickerController!
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageListCollectionView.delegate = self
        self.imageListCollectionView.dataSource = self
        self.imageListCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }

    
    @IBAction func onPhotoButton(_ sender: Any) {
        
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        images.append((info[.originalImage] as? UIImage)!)
        imageListCollectionView.reloadData()
    }
    
    @IBAction func onSaveButton(_ sender: Any) {
        saveImage(imageName: "test.png")
    }
    
    
    @IBAction func onGalleryButton(_ sender: Any) {
        performSegue(withIdentifier: "gallerySegue", sender: self)
    }
    
    func saveImage (imageName: String){
        let fileManager = FileManager.default
        
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        let image = imageView.image!
        
        let data = image.pngData()
        
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.imageListCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bound = self.imageListCollectionView.bounds;
        
        let height = bound.size.height/3.0 - 10
        let width = bound.size.width/3.0 - 10
        return CGSize(width: width, height: height)
    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
    
}

