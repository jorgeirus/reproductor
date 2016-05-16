//
//  ListaCanciones.swift
//  Ejemplosonido2
//
//  Created by Jorge Andres Moreno Castiblanco on 15/05/16.
//  Copyright © 2016 eworld. All rights reserved.
//

import UIKit

class ListaCanciones: NSObject {
    
    var Canciones: [String] = ["Charly_black-Party_Animal","Florida-myHouse","major_lazer_ligth_it_up","steve_Angello-Laidback_Luke","Taylor_Swift-trouble"]
    var portadas = [UIImage(named: "animal"), UIImage(named: "florida"), UIImage(named: "majorlazer"), UIImage(named: "steveangello"), UIImage(named: "taylorSiwft")]
    
    
    func getCancion(index: Int) -> String {
        return Canciones[index]
    }
    
    func getPortadas(index: Int)->UIImage{
        return portadas[index]!
    }
    
}

extension ListaCanciones: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Canciones.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let cancion = Canciones[indexPath.row]
        cell.textLabel!.text = cancion
        cell.imageView?.image = portadas[indexPath.row]
        return cell
    }
    
}

