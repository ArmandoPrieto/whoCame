package attendance



import static org.springframework.http.HttpStatus.*
import camp.Grade
import demographic.Person
import grails.transaction.Transactional
import org.joda.time.*

@Transactional(readOnly = false)
class AttendanceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	def takeRoll(){
		String attendanceType = "checkOut" //checkOut | checkIn
		String personType = "counselor" //campers | counselors
		Grade grade = Grade.findByGradeName('K1')
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
					attendanceType: attendanceType])
		
	}
	
	def saveTakeRoll(){
		 
		params['checkbox-attendance'].each{
			 
			Person person = Person.get(it)
			Attendance attendance = new Attendance(new DateTime())
			if(params.attendanceType == "checkOut"){
				
				attendance.checkOut.time = new DateTime()
				attendance.checkOut.value = true
				
			}else if(params.attendanceType == "checkIn"){
				attendance.checkIn.time = new DateTime()
				attendance.checkIn.value = true
			}
			
		/*	
		//	if(!person.boardAttendance){
				
				Board board = new Board()
				board.attendanceRecords.add(attendance)
			//	attendance.save()
				
				person.boardAttendance = board
			//	board.save(flush: true)
				
		*/		
			//}
			/*attendance.board = person.boardAttendance
			attendance.save(failOnError : true)*/
			//person.boardAttendance.getAttendanceRecords().add(attendance)
			
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
	def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Attendance.list(params), model:[attendanceInstanceCount: Attendance.count()]
    }

    def show(Attendance attendanceInstance) {
        respond attendanceInstance
    }

    def create() {
        respond new Attendance(params)
    }

    @Transactional
    def save(Attendance attendanceInstance) {
        if (attendanceInstance == null) {
            notFound()
            return
        }

        if (attendanceInstance.hasErrors()) {
            respond attendanceInstance.errors, view:'create'
            return
        }

        attendanceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'attendance.label', default: 'Attendance'), attendanceInstance.id])
                redirect attendanceInstance
            }
            '*' { respond attendanceInstance, [status: CREATED] }
        }
    }

    def edit(Attendance attendanceInstance) {
        respond attendanceInstance
    }

    @Transactional
    def update(Attendance attendanceInstance) {
        if (attendanceInstance == null) {
            notFound()
            return
        }

        if (attendanceInstance.hasErrors()) {
            respond attendanceInstance.errors, view:'edit'
            return
        }

        attendanceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Attendance.label', default: 'Attendance'), attendanceInstance.id])
                redirect attendanceInstance
            }
            '*'{ respond attendanceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Attendance attendanceInstance) {

        if (attendanceInstance == null) {
            notFound()
            return
        }

        attendanceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Attendance.label', default: 'Attendance'), attendanceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'attendance.label', default: 'Attendance'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}