package file



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PDFPageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PDFPage.list(params), model:[PDFPageInstanceCount: PDFPage.count()]
    }

    def show(PDFPage PDFPageInstance) {
        respond PDFPageInstance
    }

    def create() {
        respond new PDFPage(params)
    }

    @Transactional
    def save(PDFPage PDFPageInstance) {
        if (PDFPageInstance == null) {
            notFound()
            return
        }

        if (PDFPageInstance.hasErrors()) {
            respond PDFPageInstance.errors, view:'create'
            return
        }

        PDFPageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'PDFPage.label', default: 'PDFPage'), PDFPageInstance.id])
                redirect PDFPageInstance
            }
            '*' { respond PDFPageInstance, [status: CREATED] }
        }
    }

    def edit(PDFPage PDFPageInstance) {
        respond PDFPageInstance
    }

    @Transactional
    def update(PDFPage PDFPageInstance) {
        if (PDFPageInstance == null) {
            notFound()
            return
        }

        if (PDFPageInstance.hasErrors()) {
            respond PDFPageInstance.errors, view:'edit'
            return
        }

        PDFPageInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PDFPage.label', default: 'PDFPage'), PDFPageInstance.id])
                redirect PDFPageInstance
            }
            '*'{ respond PDFPageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PDFPage PDFPageInstance) {

        if (PDFPageInstance == null) {
            notFound()
            return
        }

        PDFPageInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PDFPage.label', default: 'PDFPage'), PDFPageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'PDFPage.label', default: 'PDFPage'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
