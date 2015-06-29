package attendance

import attendance.Attendance
import camp.Grade
import camp.Counselor
import camp.Camper
import demographic.Person
import attendance.Board

import java.util.zip.ZipEntry
import java.util.zip.ZipOutputStream

import liquibase.util.csv.opencsv.CSVWriter

import org.apache.poi.hssf.record.Record;
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormatter
import org.joda.time.format.DateTimeFormat
import org.jadira.usertype.dateandtime.joda.*



class MainController {
	def springSecurityService
	def statsService

	def index(){
		//render(view: 'mainBoard',model:[grades: Grade.findAll()])
		redirect(action:"mainBoard")
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

		DateTimeFormatter formatter = DateTimeFormat.forPattern("MM/dd/yyyy");
		DateTime dt = formatter.parseDateTime(params.date);

		def user = springSecurityService.currentUser
		def grade = Grade.findByGradeName(user.username)


		def c = Person.createCriteria()
		def dayAttendance = c.list () {
			boardAttendance{
				attendanceRecords{ eq('date', dt) }
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
			gradeStats:gradeStats,
			date: dt.withTimeAtStartOfDay().toDate()])
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
				team { eq("grade",grade) }
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
						attendanceMap[person.id] =  att[0]?.checkIn?.value?:false
					}else if(attendanceType=="checkOut"){
						attendanceMap[person.id] =  att[0]?.checkOut?.value?:false
					}
				}
			}

			if(!attendanceMap[person.id]){
				attendanceMap[person.id] =false
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
		def user = springSecurityService.currentUser
		def grade = Grade.findByGradeName(user.username)
		def gradePersonsList
		if(params.personType == "camper"){
			gradePersonsList = grade.campers
		}else if(params.personType == "counselor"){
			gradePersonsList = grade.team.counselors
		}
		
		DateTime aux = new DateTime()
		AttendanceValue checkIn =null
		AttendanceValue checkOut =null
		Attendance newAttendance = null
		boolean attendanceValue
		 
		def check = params.list('checkbox-attendance')
		gradePersonsList.each{ person ->
			
			if(check.contains(person.id.toString())){
			
				attendanceValue = true
			}else{
				attendanceValue = false
			}
			
			
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
					attendance.each{ newAttendance = it }
				}else{
					//Attendance date does not exist
					newAttendance = new Attendance()
				}
			}
			if(params.attendanceType == "checkOut"){
				if(newAttendance?.checkOut){
					checkOut = newAttendance.checkOut
				}else{
					checkOut = new AttendanceValue()
				}
				if(checkOut.value != attendanceValue){
					if(attendanceValue==false){
						checkOut.time = null
					}else{
						checkOut.time = new DateTime()
					}
					checkOut.value = attendanceValue
				}
				checkOut.setAttendance(newAttendance)
				newAttendance.setCheckOut(checkOut)

			}else if(params.attendanceType == "checkIn"){
				if(newAttendance?.checkIn){
					checkIn = newAttendance.checkIn
				}else{
					checkIn = new AttendanceValue()
				}
				if(checkIn.value != attendanceValue){
					if(attendanceValue==false){
						checkIn.time = null
					}else{
						checkIn.time = new DateTime()
					}
					checkIn.value = attendanceValue
				}
				checkIn.setAttendance(newAttendance)
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
	def downloadDataDate(){
				render(view: 'downloadDataDate')
	}
	def downloadData(){
		DateTimeFormatter formatter = DateTimeFormat.forPattern("MM/dd/yyyy");
		DateTime date = formatter.parseDateTime(params.date);
		def user = springSecurityService.currentUser
		//def grade = Grade.findByGradeName(user.username)
		
		// Format for output
		
		def dt = formatter.print(date)
		

		//Create record
		//String [] record = "4,David,Miller,Australia,30".split(",");
		//Write the record to file
		ByteArrayOutputStream baos = new ByteArrayOutputStream()
		ZipOutputStream zipFile = new ZipOutputStream(baos)
		String storageDirectory = servletContext.getRealPath(grailsApplication.config.fileTmp.download.directory.tmp)
		String [] record
		String csv
		CSVWriter writer
		File file
		def grades = Grade.list()
		grades.each{ grade ->
			
			csv = grade.gradeName+" counselors.csv"
			writer = new CSVWriter(
				new FileWriter(storageDirectory+csv));
			record = ["Grade",grade.gradeName]
			writer.writeNext(record);
			record = ["Name","Check In", "Check Out"]
			writer.writeNext(record);
			def counselors = grade.team.counselors.sort { it.name }
			counselors.each{ counselor ->
				
				def c1 = Attendance.createCriteria()
				def atteCounselor = c1.list {
					eq('board', counselor.boardAttendance)
					eq('date', date)
				}
				if(atteCounselor){
					record = (counselor.name+","+atteCounselor[0].checkIn?.value.toString()+","+atteCounselor[0].checkOut?.value.toString()).split(",");
				}else{
					record = (counselor.name+",false,false").split(",");
				}
				writer.writeNext(record);

			}
			//close the writer
			writer.close();

			file = new File(storageDirectory+csv)

			zipFile.putNextEntry(new ZipEntry("counselors/"+csv))
			file.withInputStream { i ->

				zipFile << i

			}
			zipFile.closeEntry()
			
			
			csv = grade.gradeName+" campers.csv"
			writer = new CSVWriter(
				new FileWriter(storageDirectory+csv));
			record = ["Grade",grade.gradeName]
			writer.writeNext(record);
			record = ["Name","Check In", "Check Out"]
			writer.writeNext(record);
			def campers = grade.campers.sort { it.name }
			
			campers.each{ camper ->
				
				def c2 = Attendance.createCriteria()
				def atteCamper = c2.list {
					eq('board', camper.boardAttendance)
					eq('date', date)
				}
				if(atteCamper){
					record = (camper.name+","+atteCamper[0].checkIn?.value.toString()+","+atteCamper[0].checkOut?.value.toString()).split(",");
				}else{
					record = (camper.name+",false,false").split(",");
				}
				writer.writeNext(record);
			}
			
			//close the writer
			writer.close();

			file = new File(storageDirectory+csv)

			zipFile.putNextEntry(new ZipEntry("campers/"+csv))
			file.withInputStream { i ->

				zipFile << i

			}
			zipFile.closeEntry()
			
		}

		
		zipFile.finish()
		response.setHeader("Content-disposition", "filename=\"campData ${dt}.zip\"")
		response.contentType = "application/zip"
		response.outputStream << baos.toByteArray()
		response.outputStream.flush()


	}
}
