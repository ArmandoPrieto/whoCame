package attendance

import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormatter

import org.joda.time.format.DateTimeFormat

class TimeAuxiliar {
	
	
	 def getIntervals(def key, def dateInterval){
		
		 DateTimeFormatter formatter = DateTimeFormat.forPattern("MM/dd/yyyy");
		 DateTime fromDate = formatter.parseDateTime(dateInterval.from.toString());
		 DateTime toDate = formatter.parseDateTime(dateInterval.to.toString());
		 
		 DateTime[] intervals = new DateTime[5]
		 int i =0
		
		  while(fromDate<=toDate){
			
			 intervals[i]=  fromDate
			 fromDate = fromDate.plusDays(1)
			 i++
			 
		 }
		 return intervals
	 }

}
