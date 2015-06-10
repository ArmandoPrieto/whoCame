package attendance


import org.jadira.usertype.dateandtime.joda.*
import org.joda.time.DateTime


class Attendance {
	
	DateTime date
	AttendanceValue checkIn
	AttendanceValue checkOut
	
	static belongsTo = [board: Board]
	
	
    static constraints = {
		date(nullable: true)
		checkIn(unique: true, nullable: true)
		checkOut(unique: true, nullable: true)
		
    }
	
	static mapping = {
		
		date type: PersistentDateTime,  defaultValue: null
	}
}
