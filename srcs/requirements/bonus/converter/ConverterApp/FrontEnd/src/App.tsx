import './App.css';
import React, { useEffect, useState } from "react";
import axios from "axios";
import DOMAIN from './MyConfigue';

function App() {
  const [selectedFile, setSelectedFile] = React.useState(null);
  let [inProcess, setInProcess] = useState(false);
  let [isDone, setIsDone] = useState(false);
  let [error, setError] = useState(false);
  let [outFileLink, setOutFileLink] = useState("");

  const handleFileSelect = (event : any) => {
      setSelectedFile(event.target.files[0])
  }

  const reset = (event : any) => {
    event.preventDefault()
    setSelectedFile(null)
    setInProcess(false)
    setIsDone(false)
    setError(false)
  }

  const handleSubmit = async(event : any) => {
      event.preventDefault()
      if (selectedFile){
          setInProcess(true);
          const formData = new FormData();
          formData.append("file", selectedFile);
          try {
            console.log(`${DOMAIN}/converter/api/`)
            const response = await axios.post(`${DOMAIN}/converter/api/`, formData, {
              headers: {
                "Content-Type": "multipart/form-data"
              }
            });
            if (response.status < 300){
              setOutFileLink(response.data);
              setIsDone(true);
              console.log(response.data);
            } else {
              setError(true)
              console.log(error);
            }
          } catch(error) {
            setError(true)
            console.log(error);
          }
      }
    }

    if (error) {
      return (
        <div className="conatiner">
            <form action="#" method="post">
                <h2> Mp4 to Mp3</h2>
                <div className="alert alert-danger" role="alert">
                  Error Occured!
                </div>
                <button onClick={reset}>Try Again</button>
            </form>
        </div>
        )
    }

    if (isDone) {
      return (
        <div className="conatiner">
            <form action="#" method="post">
                <h2>Mp4 to Mp3</h2>
                <div className="alert alert-success" role="alert">
                  File Converted Successfully!
                </div>
                
            
                <button ><a href={outFileLink} download="">Download File</a></button><br/>
                <button onClick={reset}>Convert another file</button>
                
            </form>
        </div>
        )
    }


    if (inProcess){
      return (
          <div className="conatiner">
              <form action="#" method="post">
                  <h2>Mp4 to Mp3</h2>
                  <div className="spinner-border" role="status"></div>
              </form>
          </div>
          )
    }

    return (
      <div className="conatiner">
          <form action="#" method="post" onSubmit={handleSubmit} >
              <h2>Mp4 to Mp3</h2>
              <div className="mb-3">
              <input className="form-control" type="file" id="formFile" accept="video/mp4" onChange={handleFileSelect}/>
          </div>
          <button type="submit" name="convert">Convert</button>
          </form>
      </div>
      )
}

export default App
