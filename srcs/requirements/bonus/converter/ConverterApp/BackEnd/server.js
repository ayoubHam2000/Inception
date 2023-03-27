const { exec } = require('child_process');
const express = require('express');
const multer = require('multer');
const path = require('path');
var cors = require('cors');
const fs = require('fs');

const uploadFolder = 'media'
const app = express();

app.use((req, res, next) => {
  console.log(`${req.method} ${req.url}`);
  //console.log(`Query Parameters: ${JSON.stringify(req.query)}`);
  //console.log(`Headers: ${JSON.stringify(req.headers)}`);
  //console.log(`Body: ${JSON.stringify(req.body)}`);
  next();
});

app.use(function(req, res, next) {
  res.setHeader("Content-Disposition", "attachment")
  next();
});



app.use(cors({origin: '*'}));
app.use('/media', express.static(__dirname + '/media'));

// configure multer to handle file uploads
const upload = multer({ dest: `${uploadFolder}/` });




function getFileExtension(filePath) {
  return path.extname(filePath).slice(1);
}

function renameFile(oldPath, newPath) {
  fs.rename(oldPath, newPath, function(err) {
    if (err) {
     // callback(err);
    } else {
      //callback(null);
    }
  });
}

// handle file uploads
app.post('/', upload.single('file'), (req, res) => {
  if (req.file){
    const filename = req.file.originalname;
    if (getFileExtension(filename) == "mp4"){
      const newName = req.file.filename;
      let filePath = path.join(uploadFolder, newName);
      renameFile(filePath, `${filePath}.mp4`)
      filePath = `${filePath}.mp4`
      const outFile = path.join(uploadFolder, `${filename}_${Date.now()}.mp3`);

      //exec(`head -n 5 ${filePath}  > ${outFile}`, (error, stdout, stderr) => {
        console.log(filePath)
        console.log(outFile)
        exec(`ffmpeg -i '${filePath}' '${outFile}'`, (error, stdout, stderr) => {
          const domain = process.env.VITE_DOMAIN || "http://localhost"
          const url = `${domain}/converter/api/${outFile}`
          const encodedUrl = encodeURI(url)
          res.write(encodedUrl);
          res.end();
        });
    } else {
      res.status(400).send("Extension ");
      res.end();
    }
  } else {
    console.log("File is undefined")
    res.status(400).send();
  }
});

app.get('/', (req, res) => {
  res.write("Hi!");
  res.end()
})

// start the server
app.listen(3001, () => {
  console.log('Server started on port 3001');
});
