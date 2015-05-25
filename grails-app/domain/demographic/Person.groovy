package demographic
import java.util.List;
import file.Document
import com.security.User
class Person {
	
	String name
	
	List documents
	static hasMany = [documents: Document]
	//static hasOne = [user: User]
    static constraints = {
    }
	static mapping = {
		tablePerHierarchy false
	 }
}
