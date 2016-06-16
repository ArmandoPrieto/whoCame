package camp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HeadCounselorController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond HeadCounselor.list(params), model:[headCounselorInstanceCount: HeadCounselor.count()]
    }

    def show(HeadCounselor headCounselorInstance) {
        respond headCounselorInstance
    }

    def create() {
        respond new HeadCounselor(params)
    }

    @Transactional
    def save(HeadCounselor headCounselorInstance) {
        if (headCounselorInstance == null) {
            notFound()
            return
        }

        if (headCounselorInstance.hasErrors()) {
            respond headCounselorInstance.errors, view:'create'
            return
        }

        headCounselorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'headCounselor.label', default: 'HeadCounselor'), headCounselorInstance.id])
                redirect headCounselorInstance
            }
            '*' { respond headCounselorInstance, [status: CREATED] }
        }
    }

    def edit(HeadCounselor headCounselorInstance) {
        respond headCounselorInstance
    }

    @Transactional
    def update(HeadCounselor headCounselorInstance) {
        if (headCounselorInstance == null) {
            notFound()
            return
        }

        if (headCounselorInstance.hasErrors()) {
            respond headCounselorInstance.errors, view:'edit'
            return
        }

        headCounselorInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'HeadCounselor.label', default: 'HeadCounselor'), headCounselorInstance.id])
                redirect headCounselorInstance
            }
            '*'{ respond headCounselorInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(HeadCounselor headCounselorInstance) {

        if (headCounselorInstance == null) {
            notFound()
            return
        }

        headCounselorInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'HeadCounselor.label', default: 'HeadCounselor'), headCounselorInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'headCounselor.label', default: 'HeadCounselor'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
