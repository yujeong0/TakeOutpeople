package pknu.it;

public class Store {
	private int st_num;
	private String st_name;
	private String st_phone;
	private String st_address;
	private String st_class;
	
	public Store() {
		st_num = 0;
		st_name = null;
		st_phone = null;
		st_address = null;
		st_class = null;
	}
	
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}

	public String getSt_name() {
		return st_name;
	}
	public void setSt_name(String st_name) {
		this.st_name = st_name;
	}

	public String getSt_phone() {
		return st_phone;
	}
	public void setSt_phone(String st_phone) {
		this.st_phone = st_phone;
	}

	public String getSt_address() {
		return st_address;
	}
	public void setSt_address(String st_address) {
		this.st_address = st_address;
	}

	public String getSt_class() {
		return st_class;
	}
	public void setSt_class(String st_class) {
		this.st_class = st_class;
	}

	
}
