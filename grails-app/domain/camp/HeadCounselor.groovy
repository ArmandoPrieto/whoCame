package camp

class HeadCounselor extends Counselor{

	CounselorTeam counselorTeam
	
    static constraints = {
    }
	static mapping = {
		tablePerHierarchy false
	 }
}
