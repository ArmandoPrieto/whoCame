package camp



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CamperController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Camper.list(params), model:[camperInstanceCount: Camper.count()]
    }

    def show(Camper camperInstance) {
        respond camperInstance
    }

    def create() {
        respond new Camper(params)
    }

    @Transactional
    def save(Camper camperInstance) {
        if (camperInstance == null) {
            notFound()
            return
        }

        if (camperInstance.hasErrors()) {
            respond camperInstance.errors, view:'create'
            return
        }

        camperInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'camper.label', default: 'Camper'), camperInstance.id])
                redirect camperInstance
            }
            '*' { respond camperInstance, [status: CREATED] }
        }
    }

    def edit(Camper camperInstance) {
        respond camperInstance
    }

    @Transactional
    def update(Camper camperInstance) {
        if (camperInstance == null) {
            notFound()
            return
        }

        if (camperInstance.hasErrors()) {
            respond camperInstance.errors, view:'edit'
            return
        }

        camperInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Camper.label', default: 'Camper'), camperInstance.id])
                redirect camperInstance
            }
            '*'{ respond camperInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Camper camperInstance) {

        if (camperInstance == null) {
            notFound()
            return
        }

        camperInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Camper.label', default: 'Camper'), camperInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'camper.label', default: 'Camper'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
