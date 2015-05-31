package attendance

import java.sql.Date;

import org.joda.time.*

class Attendance {
	
	DateTime date
	//static hasOne = [checkIn: AttendanceValue, checkOut: AttendanceValue]
	
	//static belongsTo = [board: Board]
	
/*	public Attendance(DateTime date){
		this.date = date.withTimeAtStartOfDay()
		checkIn = new AttendanceValue()
		checkOut = new AttendanceValue()
		
	}*/
	
    static constraints = {
	//	date(nullable: true)
	//	checkIn(nullable: true)
	//	checkOut(nullable: true)
    }
}
