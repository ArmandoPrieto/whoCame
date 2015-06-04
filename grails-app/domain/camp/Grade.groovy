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
			"1st",
			"2nd",
			"3th",
			"4th",
			"5th",
			"6th",
			"Boys",
			"Girls",
			"ReCrew",
			"Liturgy",
			"Lifeguard",
			"Assistant",
			"Director",
			"HeadMaster"
		])
    }
}
