// Use ProgrammingBooks DB and create collection
use ProgrammingBooks
db.createCollection("BookDetails")

// a. Illustration of WHERE, AND, OR operations in MongoDB
db.BookDetails.find({ year: 2008 }).pretty()
db.BookDetails.find({ $and: [ { category: "Software Development" }, { year: 2008 } ] }).pretty()
db.BookDetails.find({ $or: [ { category: "JavaScript" }, { year: 2015 } ] }).pretty()

// Inserts
db.BookDetails.insertMany([
  { _id: 1, title: "Clean Code", author: "Robert C. Martin", category: "Software Development", year: 2008 },
  { _id: 2, title: "JavaScript: The Good Parts", author: "Douglas Crockford", category: "JavaScript", year: 2008 },
  { _id: 3, title: "Design Patterns: Elements of Reusable Object-Oriented Software", author: "Erich Gamma", category: "Software Design", year: 1994 },
  { _id: 4, title: "Introduction to Algorithms", author: "Thomas H. Cormen", category: "Algorithms", year: 1990 },
  { _id: 5, title: "Python Crash Course", author: "Eric Matthes", category: "Python", year: 2015 }
])

// Queries
db.BookDetails.find().pretty()
db.BookDetails.find({ year: { $gt: 2000 } }).pretty()

// Updates
db.BookDetails.updateOne({ title: "Clean Code" }, { $set: { author: "sjucode" } })
db.BookDetails.find({ year: { $eq: 2008 } }).pretty()
db.BookDetails.updateMany({ year: { $lt: 2010 } }, { $set: { category: "sjucode website" } })
db.BookDetails.find({ year: { $lt: 2010 } }).pretty()

// Deletes
db.BookDetails.deleteOne({ _id: 2 })
db.BookDetails.find({ _id: 2 }).pretty()
db.BookDetails.deleteMany({ year: { $lt: 1995 } })
db.BookDetails.find().pretty()
db.BookDetails.deleteMany({})
db.BookDetails.find().pretty()

// Projections
db.BookDetails.find({}, { title: 1, author: 1 }).pretty()
db.BookDetails.find({}, { year: 0 }).pretty()


