package attendance

import attendance.Attendance
import camp.Grade
import camp.Counselor
import camp.Camper
import demographic.Person
import attendance.Board
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormatter
import org.joda.time.format.DateTimeFormat

import org.jadira.usertype.dateandtime.joda.*



class MainController {
	def springSecurityService
	def statsService

   def index(){
	//   render(view: 'mainBoard',model:[grades: Grade.findAll()])
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
	  
	   def user = springSecurityService.currentUser
	   def grade = Grade.findByGradeName(user.username)
	   
	 
	   render(view: 'statisticsDate',model:[grade: grade])
	   
   }
   def attendanceDate(){
	    println "Date "+params.date
	   DateTimeFormatter formatter = DateTimeFormat.forPattern("MM/dd/yyyy");
	   DateTime dt = formatter.parseDateTime(params.date);
	   
	   def user = springSecurityService.currentUser
	   def grade = Grade.findByGradeName(user.username)
	   
	 
	   def c = Person.createCriteria()
	   def dayAttendance = c.list () {
		   boardAttendance{
			   attendanceRecords{
				   eq('date', dt)
			   }
		   'in'("person",grade.campers)
		   }
	   }
	 
	   render(view: 'attendanceDate')
	   
   }
   def viewStats(){
	   DateTimeFormatter formatter = DateTimeFormat.forPattern("MM/dd/yyyy");
	   DateTime dt = formatter.parseDateTime(params.date);
	   def user = springSecurityService.currentUser
	   def grade = Grade.findByGradeName(user.username)
	   
	
	   def campersAttendance = statsService.campersAttendance(dt)
	   def counselorsAttendance = statsService.counselorsAttendance(dt)
	   
	   List gradeStats =new ArrayList<GradeStats>()
	   Grade.list().each{ grades ->
		   GradeStats gStats = new GradeStats()
		   
		   def campersCheckIn = statsService.campersCheckIn(grades, dt)
		   def campersCheckOut = statsService.campersCheckOut(grades, dt)
		   def counselorsCheckIn = statsService.counselorsCheckIn(grades, dt)
		   def counselorsCheckOut = statsService.counselorsCheckOut(grades, dt)
		   gStats.setCampersCheckIn(campersCheckIn)
		   gStats.setCampersCheckOut(campersCheckOut)
		   gStats.setCounselorsCheckIn(counselorsCheckIn)
		   gStats.setCounselorsCheckOut(counselorsCheckOut)
		   gStats.setTotalCampers(statsService.getTotalCampersByGrade(grades))
		   gStats.setTotalCounselors(statsService.getTotalCounselorsByGrade(grades))
		   gStats.setGradeId(grades.id)
		   gStats.setGradeName(grades.gradeName)
		   gradeStats.add(gStats)
	   }
	   
	   render(view: 'viewStats', model:[campersAttendance: campersAttendance,
		   								counselorsAttendance:counselorsAttendance,
										gradeStats:gradeStats])
	   
   }
	def takeRoll(){
		String attendanceType = params.type //checkOut | checkIn
		String personType = params.personType //campers | counselors
		Grade grade = Grade.get(params.id)
		List persons
		if(personType == "counselor"){
			def c = Counselor.createCriteria()
			persons = c.list () {
				order("name", "asc")
				team {
					eq("grade",grade)
				}			
			}
			
		}else if(personType == "camper"){
			persons = grade.getCampers()
			def c = Camper.createCriteria()
			persons = c.list () {
				order("name", "asc")
				eq("camperGrade",grade)
			}
		
		}else if(personType == "headStaff"){
		
		}else{
		//Error
		render(view: 'index')
		}
		DateTime date = new DateTime().withTimeAtStartOfDay()
	
		
		def attendanceMap = [:]
		persons.each{ person ->
			
			if(person.boardAttendance){
				def c1 = Attendance.createCriteria()
				def att = c1.list {
					eq('board', person.boardAttendance)
					eq('date', date)
				}
				if(att){
					if(attendanceType=="checkIn"){
						attendanceMap[person.id] =  att[0].checkIn.value?:false
					}else if(attendanceType=="checkOut"){
						attendanceMap[person.id] =  att[0].checkOut.value?:false
					}
					
			  }else{
			  println('No att')
				  attendanceMap[person.id] = false
			  }
			  
			}else{
			println('No board')
				attendanceMap[person.id] = false
			}
			
			
		}
		
		
		
		
		render(view: 'takeRoll',
					model:[
					persons: persons,
					date: date.withTimeAtStartOfDay().toDate(),
					personType: personType,
					attendanceType: attendanceType,
					grade: grade,
					attendanceMap: attendanceMap])
		
	}
	
	def saveTakeRoll(){
		DateTime aux = new DateTime()
		AttendanceValue checkIn =null
		AttendanceValue checkOut =null
		Attendance newAttendance = null
		
		def check = params.list('checkbox-attendance')
			check.each{
			 
			Person person = Person.get(it)
			if(!person?.boardAttendance){
				Board board = new Board()
				person.setBoardAttendance(board)
				
				newAttendance = new Attendance()
				
			}else{
				
				def a = Attendance.createCriteria()
					def attendance = a.list () {
						eq('date', aux.withTimeAtStartOfDay())
						eq('board',person.boardAttendance)
					}
				
				if(attendance){
				//Attendance date already exist
					attendance.each{
						
						newAttendance = it
						}
				}else{
				//Attendance date does not exist
					newAttendance = new Attendance()
				}
			}	
				if(params.attendanceType == "checkOut"){
					checkOut = new AttendanceValue()
					checkOut.time = new DateTime()
					checkOut.value = true
					checkOut.setAttendance(newAttendance)
					if(newAttendance?.checkOut){
						newAttendance.checkOut.delete()
					}
					newAttendance.setCheckOut(checkOut)
					
				}else if(params.attendanceType == "checkIn"){
					checkIn = new AttendanceValue()
					checkIn.time = new DateTime()
					checkIn.value = true
					checkIn.setAttendance(newAttendance)
					if(newAttendance?.checkIn){
						newAttendance.checkIn.delete()
					}
					newAttendance.setCheckIn(checkIn)
				
					
					}
				
			
			newAttendance.date = aux.withTimeAtStartOfDay()
			person.boardAttendance.addToAttendanceRecords(newAttendance)
			try{
				if(!person.save()){
					throw new Exception ("Exception taking roll on person")
				}else{
				flash.message = "Attendance {0} sheet saved"
				flash.args = [params.attendanceType]
				flash.default = "Attendance sheet saved"
				}
			}catch(Exception e){
				println "***********---------***********"
				println e.toString()
				person.errors.allErrors.each {error ->
					println error.toString()
				}
				println "***********---------***********"
				flash.error = "Attendance sheet not saved"
			}
		 }
			
			
		redirect(controller: 'main',action:'mainBoard')
	}
}
