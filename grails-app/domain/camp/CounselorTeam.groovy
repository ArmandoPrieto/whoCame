package camp

class CounselorTeam {
	
	
	List counselors
	Grade grade
	static hasOne = [headCounselor: HeadCounselor]
	static hasMany = [counselors: Counselor]
	
    static constraints = {
    }
}
