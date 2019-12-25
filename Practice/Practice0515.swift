//맨앞에서 프레임워크 추가해줘야함


import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //center
        let center = CLLocationCoordinate2D(latitude: 35.242544, longitude: 128.697153)
        
        //range. Apple has to have this range to show
        let span = MKCoordinateSpan(latitudeDelta: 0.00001, longitudeDelta: 0.00001)
        
        let region = MKCoordinateRegion(center: center, span: span)
    }


}
