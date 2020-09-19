package pknu.it;

public class Order {
	private Integer order_num;
	private Integer st_num;
	private String order_time;
	private Integer order_amount;
	private String acceptance;
	
	public Order() {
		
	}

	public Integer getOrder_num() {
		return order_num;
	}

	public void setOrder_num(Integer order_num) {
		this.order_num = order_num;
	}

	public Integer getSt_num() {
		return st_num;
	}

	public void setSt_num(Integer st_num) {
		this.st_num = st_num;
	}

	public String getOrder_time() {
		return order_time;
	}

	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}

	public Integer getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(Integer order_amount) {
		this.order_amount = order_amount;
	}

	public String getAcceptance() {
		return acceptance;
	}

	public void setAcceptance(String acceptance) {
		this.acceptance = acceptance;
	}
	
}
