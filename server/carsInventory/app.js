const mongoose = require('mongoose');
const mongodb = require('mongodb');
const fs = require('fs');

async function main() {
    await mongoose.connect('mongodb://127.0.0.1:27017/test');
};

const get_car_records = await fs.readFile('data/car_records.json', (data, err) => {
    return JSON.parse(data);
});

mongoose.connect("mongodb://mongo_db:27017/",{'dbName':'dealershipsDB'});