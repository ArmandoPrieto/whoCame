package demographic

class Address {
	
	String address
	String city
	String state
	String zip
	
	
	//Person Person
	static belongsTo = [person: Person]
	static constraints = {
		address(nullable: true, blank:true)
		city(nullable: true, blank:true)
		state(nullable: true, blank:true)
		zip(nullable: true, blank:true)
		
		
    }
	
	static mapping ={ 
		
		
	}
}
