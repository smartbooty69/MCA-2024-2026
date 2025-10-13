// To create the new database and switch to it
use Movies

// To create the collection
db.createCollection("MovieDetails")

// To insert the initial set of documents
db.MovieDetails.insertMany([
    { _id: 1, title: "Inception", director: "Christopher Nolan", genre: "Science Fiction", year: 2010, ratings: { imdb: 8.8, rottenTomatoes: 87 } },
    { _id: 2, title: "The Matrix", director: "Wachowskis", genre: "Science Fiction", year: 1999, ratings: { imdb: 8.7, rottenTomatoes: 87 } },
    { _id: 3, title: "The Godfather", director: "Francis Ford Coppola", genre: "Crime", year: 1972, ratings: { imdb: 9.2, rottenTomatoes: 97 } }
])

// Using projection to include specific fields
db.MovieDetails.find({}, { title: 1, director: 1 })

// Using projection to exclude specific fields
db.MovieDetails.find({}, { ratings: 0 })

// Combining a filter with a projection
db.MovieDetails.find({ director: "Christopher Nolan" }, { title: 1, year: 1, _id: 0 })

// Inserting more documents for the limit query
db.MovieDetails.insertMany([
    { _id: 4, title: "Pulp Fiction", director: "Quentin Tarantino", genre: "Crime", year: 1994, ratings: { imdb: 8.9, rottenTomatoes: 92 } },
    { _id: 5, title: "The Shawshank Redemption", director: "Frank Darabont", genre: "Drama", year: 1994, ratings: { imdb: 9.3, rottenTomatoes: 91 } },
    { _id: 6, title: "The Dark Knight", director: "Christopher Nolan", genre: "Action", year: 2008, ratings: { imdb: 9.0, rottenTomatoes: 94 } },
    { _id: 7, title: "Fight Club", director: "David Fincher", genre: "Drama", year: 1999, ratings: { imdb: 8.8, rottenTomatoes: 79 } }
])

// Query with projection and limit
db.MovieDetails.find({}, { title: 1, director: 1, year: 1, _id: 0 }).limit(5)


