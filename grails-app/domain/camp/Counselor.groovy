package camp
import demographic.Address;
import demographic.Person
import file.Document

class Counselor extends Person{
	
	static belongsTo = [team: CounselorTeam]
	
	//Counselor Data
	
	//Change for person
	String picture
	String school
	String schoolSystem
	String month
	String Day
	String Year
	String fatherName
	String fatherPhone
	String motherName
	String motherPhone
	String tshirt
	String yearsWorked
	String workTime
	String notes
	boolean contract
	boolean virtus
	boolean fingerPrinting
	String allergies
	boolean permissionSlip
	boolean headStaff
	boolean hmAward
	boolean check
	boolean reflection
	
	
	static constraints = {
	
	/*	tshirt( inList: ["Small", "Medium","Large","X-Large","XXL", "XXXL"])
		workTime( inList: ["PartTime", "FullTime"])
		schoolSystem( inList: ["Private", "Public"])
		*/}
	
	
	static mapping = {
		tablePerHierarchy false
		allergies type: 'text'
		notes type: 'text'
	 }
}
