package attendance



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AttendanceValueController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond AttendanceValue.list(params), model:[attendanceValueInstanceCount: AttendanceValue.count()]
    }

    def show(AttendanceValue attendanceValueInstance) {
        respond attendanceValueInstance
    }

    def create() {
        respond new AttendanceValue(params)
    }

    @Transactional
    def save(AttendanceValue attendanceValueInstance) {
        if (attendanceValueInstance == null) {
            notFound()
            return
        }

        if (attendanceValueInstance.hasErrors()) {
            respond attendanceValueInstance.errors, view:'create'
            return
        }

        attendanceValueInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'attendanceValue.label', default: 'AttendanceValue'), attendanceValueInstance.id])
                redirect attendanceValueInstance
            }
            '*' { respond attendanceValueInstance, [status: CREATED] }
        }
    }

    def edit(AttendanceValue attendanceValueInstance) {
        respond attendanceValueInstance
    }

    @Transactional
    def update(AttendanceValue attendanceValueInstance) {
        if (attendanceValueInstance == null) {
            notFound()
            return
        }

        if (attendanceValueInstance.hasErrors()) {
            respond attendanceValueInstance.errors, view:'edit'
            return
        }

        attendanceValueInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'AttendanceValue.label', default: 'AttendanceValue'), attendanceValueInstance.id])
                redirect attendanceValueInstance
            }
            '*'{ respond attendanceValueInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AttendanceValue attendanceValueInstance) {

        if (attendanceValueInstance == null) {
            notFound()
            return
        }

        attendanceValueInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'AttendanceValue.label', default: 'AttendanceValue'), attendanceValueInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'attendanceValue.label', default: 'AttendanceValue'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
