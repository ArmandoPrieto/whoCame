package camp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CounselorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Counselor.list(params), model:[counselorInstanceCount: Counselor.count()]
    }

    def show(Counselor counselorInstance) {
        respond counselorInstance
    }

    def create() {
        respond new Counselor(params)
    }

    @Transactional
    def save(Counselor counselorInstance) {
        if (counselorInstance == null) {
            notFound()
            return
        }

        if (counselorInstance.hasErrors()) {
            respond counselorInstance.errors, view:'create'
            return
        }
		
        counselorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'counselor.label', default: 'Counselor'), counselorInstance.id])
                redirect counselorInstance
            }
            '*' { respond counselorInstance, [status: CREATED] }
        }
    }

    def edit(Counselor counselorInstance) {
        respond counselorInstance
    }

    @Transactional
    def update(Counselor counselorInstance) {
        if (counselorInstance == null) {
            notFound()
            return
        }

        if (counselorInstance.hasErrors()) {
            respond counselorInstance.errors, view:'edit'
            return
        }

        counselorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Counselor.label', default: 'Counselor'), counselorInstance.id])
                redirect counselorInstance
            }
            '*'{ respond counselorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Counselor counselorInstance) {

        if (counselorInstance == null) {
            notFound()
            return
        }
	
        counselorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Counselor.label', default: 'Counselor'), counselorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'counselor.label', default: 'Counselor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
