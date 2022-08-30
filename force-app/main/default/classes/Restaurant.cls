// Let us revisit the Restaurant class that you have seen before.
public class Restaurant {
	private String restaurantName;
	private long restaurantContact;
	private String restaurantAddress;
	private Decimal rating;
	
	public Restaurant(String name, long restaurantContact, String restaurantAddress, Decimal rating) {
        this.restaurantName = name;
        this.restaurantContact = restaurantContact;
        this.restaurantAddress = restaurantAddress;
        this.rating = rating;
        displayRestaurantDetails();
	}
    
     public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public long getRestaurantContact() {
		return restaurantContact;
	}
	public void setRestaurantContact(long restaurantContact) {
		this.restaurantContact = restaurantContact;
	}
	public String getRestaurantAddress() {
		return restaurantAddress;
	}
	public void setRestaurantAddress(String restaurantAddress) {
		this.restaurantAddress = restaurantAddress;
	}
	public Decimal getRating() {
		return rating;
	}
	public void setRating(Decimal rating) {
		this.rating = rating;
	}
    
      public void displayRestaurantDetails() {
        System.debug('Displaying restaurant details \n***************');
        System.debug('Restaurant Name : '+this.restaurantName);
        System.debug('Restaurant Rating : '+this.rating);
        System.debug('Restaurant Contact : '+this.restaurantContact);
        System.debug('Restaurant Address : '+this.restaurantAddress);
        System.debug('');
	}
}