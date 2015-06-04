package attendance

import camp.Grade
import demographic.Person
import org.joda.time.DateTime

class MainController {
	def springSecurityService

   def index(){
	   render(view: 'mainBoard',model:[grades: Grade.findAll()])
	   }
   def attendanceInOrOut(){
	   def grade = Grade.get(params.id)
	   render(view: 'attendanceInOrOut',model:[grade: grade])
	 
   }
   def mainBoard(){
	   
	   def user = springSecurityService.currentUser
	   def grade = Grade.findByGradeName(user.username)
		
	  
	  render(view: 'mainBoard',model:[grade: grade])
	   }
   def statisticsDate(){
	   render(view: 'statisticsDate')
	   
   }
   def attendanceDate(){
	   render(view: 'statisticsDate')
	   
   }
   def viewStats(){
	   render(view: 'viewStats')
	   
   }
	def takeRoll(){
		String attendanceType = params.type //checkOut | checkIn
		String personType = params.personType //campers | counselors
		Grade grade = Grade.get(params.id)
		List persons
		if(personType == "counselor"){
			persons = grade.team.getCounselors()
			
		}else if(personType == "camper"){
			persons = grade.getCampers()
		
		}else if(personType == "headStaff"){
		
		}else{
		//Error
		render(view: 'index')
		}
		
		DateTime date = new DateTime()
		
		
		render(view: 'takeRoll',
					model:[
					persons: persons,
					date: date.withTimeAtStartOfDay().toDate(),
					personType: personType,
					attendanceType: attendanceType,
					grade: grade])
		
	}
	
	def saveTakeRoll(){
		 
		params['checkbox-attendance'].each{
			 
			Person person = Person.get(it)
			Attendance attendance = new Attendance()
			AttendanceValue checkIn =null
			AttendanceValue checkOut =null
			if(params.attendanceType == "checkOut"){
				checkOut = new AttendanceValue()
				checkOut.time = new DateTime()
				checkOut.value = true
				checkOut.save()
			}else if(params.attendanceType == "checkIn"){
				checkIn = new AttendanceValue()
				checkIn.time = new DateTime()
				checkIn.value = true
				checkIn.save()
				}
			attendance.checkIn = checkIn
			attendance.checkOut = checkOut
			if(!person.boardAttendance){
				person.boardAttendance = new Board()
			}
			DateTime aux = new DateTime()
			attendance.date = aux.withTimeAtStartOfDay()
			person.boardAttendance.addToAttendanceRecords(attendance)
			try{
				if(!person.save()){
					throw new Exception ("Exception taking roll on person")
				}
			}catch(Exception e){
				println "***********---------***********"
				println e.toString()
				person.errors.allErrors.each {error ->
					println error.toString()
				}
				println "***********---------***********"
			}
		 }
		render(view: 'index')
	}
}
