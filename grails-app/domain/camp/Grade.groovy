package camp

class Grade {
	
	
	List campers
	static hasOne = [team: CounselorTeam]
	static hasMany = [campers: Camper]
	
    static constraints = {
    }
}
