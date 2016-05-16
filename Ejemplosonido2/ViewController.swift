//
//  ViewController.swift
//  Ejemplosonido2
//
//  Created by Jorge Andres Moreno Castiblanco on 14/05/16.
//  Copyright © 2016 eworld. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate {
    
     private var reproductor: AVAudioPlayer!

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var portada: UIImageView!
    @IBOutlet weak var tituloCancion: UILabel!
    
    let listaCanciones = ListaCanciones()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.reloadData()
        tableView.dataSource = listaCanciones
        tableView.delegate = self
    }
    
    //MARK: metodos TableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Fila Seleccionada\(indexPath.row)")
        var cancionSelect: String
        var imagenSelect: UIImage
        cancionSelect = self.listaCanciones.getCancion(indexPath.row)
        imagenSelect = self.listaCanciones.getPortadas(indexPath.row)
        portada.image = imagenSelect
        tituloCancion.text = cancionSelect
        reproducion(cancionSelect)
        play()
    }
    
    func reproducion (nombreCancion: String){
        let sonidoURL = NSBundle.mainBundle().URLForResource(nombreCancion, withExtension: "mp3")
        reproductor = try! AVAudioPlayer(contentsOfURL: sonidoURL!)
        let volumen = slider.value
        reproductor.volume = volumen
    }

    @IBAction func play() {
        
        if !reproductor.playing{
            reproductor.play()
        }
    }

    @IBAction func pause() {
        
        if reproductor.playing{
            reproductor.pause()
        }
    }
    
    
    @IBAction func stop() {
        if reproductor.playing{
            reproductor.stop()
            reproductor.currentTime=0
        }
    }
    
    @IBAction func controlVolumen(sender: AnyObject) {
        reproductor.volume = slider.value
    }
    
}

