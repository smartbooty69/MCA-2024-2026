const book = {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    year: 1925,
    genre: "Novel",
    
    
    displayDetails: function() {
        console.log(`Title: ${this.title}`);
        console.log(`Author: ${this.author}`);
        console.log(`Year: ${this.year}`);
        console.log(`Genre: ${this.genre}`);
    }
};

function readBook(book) {
    console.log(`Reading "${book.title}" by ${book.author}...`);
}

book.displayDetails();
readBook(book);
