package importer
import attendance.Attendance
import attendance.AttendanceValue
import attendance.Board
import camp.Camper
import camp.Counselor
import camp.CounselorTeam
import camp.Grade
import demographic.Address
import demographic.Person
import grails.transaction.Transactional
import whoCame.GroovyExcelParser
import org.joda.time.DateTime
import org.joda.time.format.DateTimeFormatter
import org.joda.time.format.DateTimeFormat
@Transactional
class ImporterService {
	
	
	
	
	def counselorImporter(def fileData, boolean appendRecords = false, String particularGrade = null){
			boolean importProcess = true
			//String filename = this.getServletConfig().getServletContext().getResourceAsStream("/files/counselor.xlsx");
		//	println("HOLA::::::"+System.getenv('OPENSHIFT_DATA_DIR'))
		//	String filename = servletContext.getRealPath(grailsApplication.config.importer.file.counselor)
			log.info "---------->${fileData['fileName']}"
			if(!appendRecords){
				Counselor.findAll().each {
					it?.team?.removeFromCounselors(it)
					it.delete()
				}
			}
			fileData['rows'].eachWithIndex { row, i ->
				Counselor counselor
				def mapRecords
				try {
					GroovyExcelParser parser = new GroovyExcelParser()
					mapRecords = parser.toMap(fileData['headers'], row)
					if(!particularGrade || (particularGrade && particularGrade == mapRecords['gradeName'])){
						counselor = new Counselor(mapRecords)
						counselor.setPersonAddress(new Address(mapRecords))
						Grade grade = Grade.findByGradeName(mapRecords['gradeName'])
						if(grade){
							CounselorTeam team = CounselorTeam.findByGrade(grade)
							team.addToCounselors(counselor)
						}
						if(!counselor.save()){
							
							throw new Exception ("Counselor save failed at row"+ i+1)
						}
					}
				} catch(Exception e) {
					importProcess = false
					log.error "***********---------***********"
					log.error mapRecords['gradeName']
					log.error e.toString()
					counselor.errors.allErrors.each {error ->
						log.error error.toString()
					}
					log.error "***********---------***********"
				}
			}
			
			if(!importProcess){
				
				log.error "Import Process Failed"
				throw new Exception("Import Process Failed")
			}
	}
		
	def camperImporter(def fileData, boolean appendRecords=false, String particularGrade = null){
			boolean importProcess = true
			log.info "---------->${fileData['fileName']}"
			if(!appendRecords){
			Camper.findAll().each {
					it?.camperGrade?.removeFromCampers(it)
					it.delete()
				}
			}
			fileData['rows'].eachWithIndex { row, i ->
				Camper camper
				def mapRecords
				try {
				GroovyExcelParser parser = new GroovyExcelParser()
				mapRecords = parser.toMap(fileData['headers'], row)
				camper = new Camper(mapRecords)
					Grade grade = Grade.findByGradeName(mapRecords['gradeName'])
					if(grade){
						grade.addToCampers(camper)
					}else{
						throw new Exception ("No grade found at row"+ i+1)
					}
					if(!camper.save()){
						
						throw new Exception ("Camper save failed at row"+ i+1)
					}
				} catch(Exception e) {
					importProcess = false
					log.error "***********---------***********"
					log.error e.toString()
					camper.errors.allErrors.each {error ->
						println error.toString()
					}
					log.error "***********---------***********"
				}
			}
			if(!importProcess){
				log.error "Import Process Failed"
				throw new Exception("Import Process Failed")
			}
		}

	def checkAttendanceImported(def personType, def attendanceType, def gradeName, def personName, def value, def date){
		if(personName!=null){
			Person person
			if(personType == "camper"){
				def grade = Grade.findByGradeName(gradeName)
				person = Camper.findByNameAndCamperGrade(personName, grade)
			}else if(personType=="counselor"){
				def grade = Grade.findByGradeName(gradeName)
				def team = CounselorTeam.findByGrade(grade)
				person = Counselor.findByNameAndTeam(personName, team)
			}
			if(!person){
				person = Person.findByName(personName)
			}
			if(person){
				DateTimeFormatter formatter = DateTimeFormat.forPattern("MM/dd/yyyy");
				DateTime aux = formatter.parseDateTime(date);
				AttendanceValue check =null
				Attendance newAttendance = null
				boolean attendanceValue
				if(value=="true"){
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
					if(newAttendance?."${attendanceType}"){
						check = newAttendance."${attendanceType}"
					}else{
						check = new AttendanceValue()
					}
					if(check.value != attendanceValue){
						if(attendanceValue==false){
							check.time = null
						}else{
							check.time = new DateTime()
						}
						check.value = attendanceValue
					}
				check.setAttendance(newAttendance)
				if(attendanceType =="checkIn"){
					newAttendance.setCheckIn(check)
				}else if(attendanceType =="checkOut"){
					newAttendance.setCheckOut(check)
				}
				
				newAttendance.date = aux.withTimeAtStartOfDay()
				person.boardAttendance.addToAttendanceRecords(newAttendance)
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
			}else{
			println "${personName} :: This person does not exist ${personName}"
			
			}
		}
		
	}
	
	
	
}
