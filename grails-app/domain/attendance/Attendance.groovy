package attendance

import org.joda.time.DateTime

class Attendance {
	
	DateTime date
	AttendanceValue checkIn
	AttendanceValue checkOut
	static belongsTo = [board: Board]
	
	public Attendance(Date date){
		this.date = date.withTimeAtStartOfDay()
		checkIn = new AttendanceValue()
		checkOut = new AttendanceValue()
		
	}
    static constraints = {
		date(nullable: true)
    }
}
