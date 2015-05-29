package camp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CounselorTeamController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CounselorTeam.list(params), model:[counselorTeamInstanceCount: CounselorTeam.count()]
    }

    def show(CounselorTeam counselorTeamInstance) {
        respond counselorTeamInstance
    }

    def create() {
        respond new CounselorTeam(params)
    }

    @Transactional
    def save(CounselorTeam counselorTeamInstance) {
        if (counselorTeamInstance == null) {
            notFound()
            return
        }

        if (counselorTeamInstance.hasErrors()) {
            respond counselorTeamInstance.errors, view:'create'
            return
        }

        counselorTeamInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'counselorTeam.label', default: 'CounselorTeam'), counselorTeamInstance.id])
                redirect counselorTeamInstance
            }
            '*' { respond counselorTeamInstance, [status: CREATED] }
        }
    }

    def edit(CounselorTeam counselorTeamInstance) {
        respond counselorTeamInstance
    }

    @Transactional
    def update(CounselorTeam counselorTeamInstance) {
        if (counselorTeamInstance == null) {
            notFound()
            return
        }

        if (counselorTeamInstance.hasErrors()) {
            respond counselorTeamInstance.errors, view:'edit'
            return
        }

        counselorTeamInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CounselorTeam.label', default: 'CounselorTeam'), counselorTeamInstance.id])
                redirect counselorTeamInstance
            }
            '*'{ respond counselorTeamInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CounselorTeam counselorTeamInstance) {

        if (counselorTeamInstance == null) {
            notFound()
            return
        }

        counselorTeamInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CounselorTeam.label', default: 'CounselorTeam'), counselorTeamInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'counselorTeam.label', default: 'CounselorTeam'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
