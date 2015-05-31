package demographic
import java.util.List;
import file.Document
import com.security.User
import attendance.Board

class Person {
	
	String name
	Date birthDate
	List documents
	String gender
	String mobileNumber //Improve it
	String homeNumber  //Improve it should be refereced as a class
	String email
	static hasOne = [personAddress: Address]
	//, boardAttendance: Board]
	static hasMany = [documents: Document]
	//static hasOne = [user: User]
	
    static constraints = {
		gender( inList: ["Male", "Female", "U"])
		
		birthDate(nullable: true)
		documents(nullable: true)
		personAddress(nullable: true)
		gender(nullable: true, blank: true)
		mobileNumber(nullable: true, blank: true)
		homeNumber(nullable: true, blank: true)
		email(nullable: true, blank: true)
		//boardAttendance(nullable: true)
		
		
	}
	static mapping = {
		//documents cascade:'delete'
		personAddress  cascade: "all-delete-orphan"
		tablePerHierarchy false
	 }
}
