package camp

class Grade {
	
	String gradeName
	List campers
	static hasOne = [team: CounselorTeam]
	static hasMany = [campers: Camper]
	
    static constraints = {
		team(nullable: true)
		campers(nullable: true)
		
		gradeName( inList: [
			"TK",
			"K1",
			"2nd",
			"3rd",
			"4th",
			"5th",
			"6th",
			"Boys",
			"Girls",
			"ReCrew",
			"Ext. Care",
			"Liturgy",
			"Media",
			"Administration",
			"Director",
			"HeadMaster"
		])
    }
	
	public String toString(){
		
		return gradeName
	}
}
