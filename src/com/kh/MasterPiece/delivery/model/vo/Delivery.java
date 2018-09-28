package com.kh.MasterPiece.delivery.model.vo;

public class Delivery {
	
	private int delivery_no;
	private String invoice_no;
	private int order_no;
	private String shipping_address;
	private String shipping_phone;
	private String etc;
	private String delivery_option;
	
	public Delivery(){}

	public Delivery(int delivery_no, String invoice_no, int order_no, String shipping_address, String shipping_phone,
			String etc, String delivery_option) {
		super();
		this.delivery_no = delivery_no;
		this.invoice_no = invoice_no;
		this.order_no = order_no;
		this.shipping_address = shipping_address;
		this.shipping_phone = shipping_phone;
		this.etc = etc;
		this.delivery_option = delivery_option;
	}

	public int getDelivery_no() {
		return delivery_no;
	}

	public void setDelivery_no(int delivery_no) {
		this.delivery_no = delivery_no;
	}

	public String getInvoice_no() {
		return invoice_no;
	}

	public void setInvoice_no(String invoice_no) {
		this.invoice_no = invoice_no;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public String getShipping_address() {
		return shipping_address;
	}

	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}

	public String getShipping_phone() {
		return shipping_phone;
	}

	public void setShipping_phone(String shipping_phone) {
		this.shipping_phone = shipping_phone;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getDelivery_option() {
		return delivery_option;
	}

	public void setDelivery_option(String delivery_option) {
		this.delivery_option = delivery_option;
	}

	@Override
	public String toString() {
		return "Delivery [delivery_no=" + delivery_no + ", invoice_no=" + invoice_no + ", order_no=" + order_no
				+ ", shipping_address=" + shipping_address + ", shipping_phone=" + shipping_phone + ", etc=" + etc
				+ ", delivery_option=" + delivery_option + "]";
	}
	
	
}
