// Switch/create DB
use newDB;

// Create collection (optional but explicit)
db.createCollection('FVDB');

// Inserts
db.FVDB.insertOne({
  name: "Mango",
  category: "Fruit",
  color: "Yellow",
  taste: "Sweet",
  texture: "Juicy and Fibrous"
});

db.FVDB.insertMany([
  { name: "Apple",  category: "Fruit",     color: "Red",    taste: "Sweet",           texture: "Crisp" },
  { name: "Carrot", category: "Vegetable", color: "Orange", taste: "Sweet",           texture: "Crunchy" },
  { name: "Tomato", category: "Vegetable", color: "Red",    taste: "Sweet and Tangy", texture: "Juicy" },
  { name: "Grape",  category: "Fruit",     color: "Green",  taste: "Sweet",           texture: "Juicy" },
  { name: "Orange", category: "Fruit",     color: "Orange", taste: "Tangy",           texture: "Juicy" }
]);

// Reads
db.FVDB.find();
db.FVDB.find({ category: "Vegetable" });
db.FVDB.find({ category: "Fruit" }, { name: 1, color: 1, _id: 0 });

// Updates
db.FVDB.updateOne(
  { name: "Tomato" },
  { $set: { category: "Fruit" } }
);

db.FVDB.updateMany(
  { taste: "Sweet" },
  { $set: { taste: "Very Sweet" } }
);

// Deletes
db.FVDB.deleteOne({ name: "Carrot" });
db.FVDB.deleteMany({ category: "Vegetable" });


