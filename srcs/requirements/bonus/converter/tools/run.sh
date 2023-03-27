#!/bin/bash

(cd /var/www/ConverterApp/BackEnd; nodemon server.js) & (cd /var/www/ConverterApp/FrontEnd; npm run dev)
