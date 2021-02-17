import React, { useState } from 'react';
import { GoogleMap, withScriptjs, withGoogleMap, Marker, InfoWindow } from 'react-google-maps';
import mapStyles from '../mapStyles';
import './App.css';
//import * as data from './data/markers.json';

function Map() {
    
    //-----------------
    let data = {};
    // https://www.w3schools.com/js/js_json_parse.asp
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var myObj = JSON.parse(this.responseText);
            console.log(myObj);
            data = myObj;
        }
    };
    let markersSource = "markers.php";
    //let markersSource = "markers.json";
    xmlhttp.open("GET", markersSource, false);
    xmlhttp.send(); 
    //-----------------   

    let [selectedMarker, setSelectedMarker] = useState(null);
    let getFilename = (id) => data.actions[id].filename;
    let getAction = (id) => data.actions[id].action;

    return (<GoogleMap
        defaultZoom={12}
        defaultCenter={{ lat:52.076918, lng:5.106366 }}
        defaultOptions={{ styles: mapStyles }}>
        {data.markers.map(marker =>
            <Marker
                key={marker.id}
                position={{ lat: parseFloat(marker.lat), lng: parseFloat(marker.lng) }}
                onClick={() => {
                    setSelectedMarker(marker);
                }}
                icon={{
                    url: `svg/${getFilename(marker.action)}`,
                    scaledSize: new window.google.maps.Size(30, 30)
                }}
            />)
        }
        {selectedMarker && (
            <InfoWindow
                position={{ lat: parseFloat(selectedMarker.lat), lng: parseFloat(selectedMarker.lng) }}
                onCloseClick={() => {
                    setSelectedMarker(null);
                }}
            >
                <div style={{ width: '180px', overflow: 'hidden' }}>
                    <h2>{getAction(selectedMarker.action)}</h2>
                    <p>{selectedMarker.sender}</p>
                    <p>{selectedMarker.desc}</p>
                </div>
            </InfoWindow>
        )}
    </GoogleMap>
    )
}

const WrappedMap = withScriptjs(withGoogleMap(Map));

export default function App() {

    return (
        <div style={{ width: "100vw", height: "100vh" }}>
            <div style={{ width: "100vw", height: "10vh" }}>
				<a href={"voerin.php"}>Vul marker in</a>
				<br/>
				Header
			</div>
            <WrappedMap
                googleMapURL={`https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=geometry,drawing,places&key=${process.env.REACT_APP_GOOGLE_KEY}`}
                loadingElement={<div style={{ height: "100%" }} />}
                containerElement={<div style={{ height: "80%" }} />}
                mapElement={<div style={{ height: "100%" }} />}
            />
            <div style={{ width: "100vw", height: "10vh" }}>Footer</div>
        </div>
    )

}