package file



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DocumentType.list(params), model:[documentTypeInstanceCount: DocumentType.count()]
    }

    def show(DocumentType documentTypeInstance) {
        respond documentTypeInstance
    }

    def create() {
        respond new DocumentType(params)
    }

    @Transactional
    def save(DocumentType documentTypeInstance) {
        if (documentTypeInstance == null) {
            notFound()
            return
        }

        if (documentTypeInstance.hasErrors()) {
            respond documentTypeInstance.errors, view:'create'
            return
        }

        documentTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'documentType.label', default: 'DocumentType'), documentTypeInstance.id])
                redirect documentTypeInstance
            }
            '*' { respond documentTypeInstance, [status: CREATED] }
        }
    }

    def edit(DocumentType documentTypeInstance) {
        respond documentTypeInstance
    }

    @Transactional
    def update(DocumentType documentTypeInstance) {
        if (documentTypeInstance == null) {
            notFound()
            return
        }

        if (documentTypeInstance.hasErrors()) {
            respond documentTypeInstance.errors, view:'edit'
            return
        }

        documentTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DocumentType.label', default: 'DocumentType'), documentTypeInstance.id])
                redirect documentTypeInstance
            }
            '*'{ respond documentTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DocumentType documentTypeInstance) {

        if (documentTypeInstance == null) {
            notFound()
            return
        }

        documentTypeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DocumentType.label', default: 'DocumentType'), documentTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentType.label', default: 'DocumentType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
