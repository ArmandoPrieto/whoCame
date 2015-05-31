package attendance

import org.joda.time.DateTime
import org.jadira.usertype.dateandtime.joda.*

class AttendanceValue {
	
	DateTime time
	boolean value
	



	static constraints = {
		
		time(nullable: true)
		
	}
	static mapping = {
		
		
		value defaultValue: false
		time type: PersistentDateTime,  defaultValue: null
	}
	
}
