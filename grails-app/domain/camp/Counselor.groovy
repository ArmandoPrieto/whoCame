package camp
import demographic.Person
import file.Document

class Counselor extends Person{
	
	static belongsTo = [team: CounselorTeam]
	
    static constraints = {
    }
	static mapping = {
		tablePerHierarchy false
	 }
}
