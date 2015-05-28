package camp

import demographic.Person

class Counselor extends Person{
	static belongsTo = [team: CounselorTeam]
	
	//Counselor Data
	
	//Change for person
	String picture
	String school
	String schoolSystem
	String month
	int day
	String year
	String fatherName
	String fatherPhone
	String motherName
	String motherPhone
	String tshirt
	String yearsWorked
	String workTime
	String notes
	String contract
	String virtus
	String fingerPrinting
	String allergies
	String permissionSlip
	String headStaff
	String hmAward
	String checked
	String reflection
	
	
	static constraints = {
	
		tshirt( inList: ["Small", "Medium","Large","X-Large","XXL", "XXXL"])
		workTime( inList: ["Part Time", "Full Time"])
		schoolSystem( inList: ["Private", "Public"])
		team(nullable: true)
		picture(nullable: true, blank:true)
		school(nullable: true, blank:true)
		schoolSystem(nullable: true, blank:true)
		month(nullable: true, blank:true)
		day(nullable: true, blank:true)
		year(nullable: true, blank:true)
		fatherName(nullable: true, blank:true)
		fatherPhone(nullable: true, blank:true)
		motherName(nullable: true, blank:true)
		motherPhone(nullable: true, blank:true)
		tshirt(nullable: true, blank:true)
		yearsWorked(nullable: true, blank:true)
		workTime(nullable: true, blank:true)
		notes(nullable: true, blank:true)
		allergies(nullable: true, blank:true)
		
		contract(nullable: true, blank:true)
		virtus(nullable: true, blank:true)
		fingerPrinting(nullable: true, blank:true)
		permissionSlip(nullable: true, blank:true)
		headStaff(nullable: true, blank:true)
		hmAward(nullable: true, blank:true)
		checked(nullable: true, blank:true)
		reflection(nullable: true, blank:true)
	
		}
	
	
	static mapping = {
	
		tablePerHierarchy false
		allergies type: 'text'
		notes type: 'text'
		
		
		 }
   
}

