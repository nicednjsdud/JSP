package kr.co.book.dto;

public class BookDTO {
	
	private long bookID;
	private String bookName;
	private String author;
	private String publisher;
	private String price;
	private String publicationDate;
	public BookDTO(long bookID, String bookName, String author, String publisher, String price,
			String publicationDate) {
		super();
		this.bookID = bookID;
		this.bookName = bookName;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.publicationDate = publicationDate;
	}
	public BookDTO() {
		// TODO Auto-generated constructor stub
	}
	public long getBookID() {
		return bookID;
	}
	public void setBookID(long bookID) {
		this.bookID = bookID;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPublicationDate() {
		return publicationDate;
	}
	public void setPublicationDate(String publicationDate) {
		this.publicationDate = publicationDate;
	}
	
	

}
