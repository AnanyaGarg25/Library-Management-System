package com.example.libraryapi;

public class Book {
    private int id;
    private String title;
    private String author;
    private int publishedYear;

    public Book(int id, String title, String author, int publishedYear) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.publishedYear = publishedYear;
    }

    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getAuthor() { return author; }
    public int getPublishedYear() { return publishedYear; }
}

