// 4. Query Selectors

// Comparison and Logical Selectors
use companyDB

// To insert employee documents
db.Employees.insertMany([
    { name: "Alice", age: 30, department: "HR", salary: 50000, joinDate: new Date("2015-01-15") },
    { name: "Bob", age: 24, department: "Engineering", salary: 70000, joinDate: new Date("2019-03-10") },
    { name: "Charlie", age: 29, department: "Engineering", salary: 75000, joinDate: new Date("2017-06-25") },
    { name: "David", age: 35, department: "Marketing", salary: 60000, joinDate: new Date("2014-11-01") },
    { name: "Eve", age: 28, department: "Finance", salary: 80000, joinDate: new Date("2018-08-19") }
])

// Queries using Comparison Selectors:
db.Employees.find({ department: { $eq: "Engineering" } }).pretty() // Equal
db.Employees.find({ department: { $ne: "HR" } }).pretty()       // Not Equal
db.Employees.find({ age: { $gt: 30 } }).pretty()                // Greater Than
db.Employees.find({ salary: { $lt: 70000 } }).pretty()          // Less Than
db.Employees.find({ joinDate: { $gte: new Date("2018-01-01") } }).pretty() // Greater Than or Equal
db.Employees.find({ age: { $lte: 28 } }).pretty()               // Less Than or Equal

// Queries using Logical Selectors:
db.Employees.find({ $and: [ { department: "Engineering" }, { salary: { $gt: 70000 } } ] }).pretty() // Logical AND

db.Employees.find({ $or: [ { department: "HR" }, { salary: { $lt: 60000 } } ] }).pretty() // Logical OR

db.Employees.find({ department: { $not: { $eq: "Engineering" } } }).pretty() // Logical NOT

db.Employees.find({ $nor: [ { department: "HR" }, { salary: { $gt: 75000 } } ] }).pretty() // Logical NOR

// Geospatial Selectors
use geodatabase

// To insert geospatial documents
db.Places.insertMany([
    { name: "Central Park", location: { type: "Point", coordinates: [-73.9654, 40.7829] } },
    { name: "Times Square", location: { type: "Point", coordinates: [-73.9851, 40.7580] } },
    { name: "Brooklyn Bridge", location: { type: "Point", coordinates: [-73.9969, 40.7061] } },
    { name: "Empire State Building", location: { type: "Point", coordinates: [-73.9857, 40.7488] } },
    { name: "Statue of Liberty", location: { type: "Point", coordinates: [-74.0445, 40.6892] } }
])

// Create a geospatial index
db.Places.createIndex({ location: "2dsphere" })

// Geospatial query using $near
db.Places.find({ location: { $near: { $geometry: { type: "Point", coordinates: [-73.9851, 40.7580] }, $maxDistance: 5000 } } }).pretty()

// Geospatial query using $geoWithin
db.Places.find({ location: { $geoWithin: { $geometry: { type: "Polygon", coordinates: [ [ [-70.016, 35.715], [-74.014, 40.717], [-73.990, 40.730], [-73.990, 40.715], [-70.016, 35.715] ] ] } } } }).pretty()

// Bitwise Selectors
use techDB

// To insert documents with bitwise status fields
db.Devices.insertMany([
    { name: "Device A", status: 5 }, // Binary: 0101
    { name: "Device B", status: 3 }, // Binary: 0011
    { name: "Device C", status: 12 }, // Binary: 1100
    { name: "Device D", status: 10 }, // Binary: 1010
    { name: "Device E", status: 7 }  // Binary: 0111
])

// Query using $bitsAllSet
db.Devices.find({ status: { $bitsAllSet: [0, 2] } }).pretty()

// Query using $bitsAnySet
db.Devices.find({ status: { $bitsAnySet: [1] } }).pretty()

// Query using $bitsAllClear
db.Devices.find({ status: { $bitsAllClear: [1, 3] } }).pretty()

// Query using $bitsAnyClear
db.Devices.find({ status: { $bitsAnyClear: [0] } }).pretty()


