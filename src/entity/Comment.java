package entity;

public class Comment {
	public String name;
	public String text;

	public void comment() {

	}

	public Comment(String name, String text) {
		this.name = name;
		this.text = text;
	}

	public Comment() {

	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}


}