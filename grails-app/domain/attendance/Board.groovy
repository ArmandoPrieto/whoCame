package attendance

import demographic.Person


class Board {
	List attendanceRecords 
	static hasMany = [attendanceRecords: Attendance]
	Person person
    static constraints = {
    
		attendanceRecords(nullable: true)
	}
}
