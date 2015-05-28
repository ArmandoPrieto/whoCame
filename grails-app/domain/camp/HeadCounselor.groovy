package camp
import demographic.Person

class HeadCounselor extends Counselor{

	
	CounselorTeam headCounselorTeam
	
    static constraints = {
    }
	static mapping = {
		tablePerHierarchy false
	
	 }
}
