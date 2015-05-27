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
			"1",
			"2",
			"3",
			"4",
			"5",
			"6",
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
