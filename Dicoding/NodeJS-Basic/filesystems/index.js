const fs = require('fs');
const path = require('path');

const fileReadCallback = (error, data) => {
    if(error){
        console.log('Gagal membaca berkas');
        return;
    }
    console.log(data);
};

const notes = path.resolve(__dirname, 'notes.txt');

fs.readFile(notes, 'UTF-8', fileReadCallback);