package demographic
import java.util.List;
import file.Document
import com.security.User

class Person {
	
	String name
	Date birthDate
	List documents
	Address address
	String gender
	String mobileNumer //Improve it
	String homeNumber  //Improve it should be refereced as a class
	String email
	static hasMany = [documents: Document]
	//static hasOne = [user: User]
    static constraints = {
		gender( inList: ["Male", "Female", "U"])
    }
	static mapping = {
		tablePerHierarchy false
	 }
}
