package attendance



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class BoardController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Board.list(params), model:[boardInstanceCount: Board.count()]
    }

    def show(Board boardInstance) {
        respond boardInstance
    }

    def create() {
        respond new Board(params)
    }

    @Transactional
    def save(Board boardInstance) {
        if (boardInstance == null) {
            notFound()
            return
        }

        if (boardInstance.hasErrors()) {
            respond boardInstance.errors, view:'create'
            return
        }

        boardInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'board.label', default: 'Board'), boardInstance.id])
                redirect boardInstance
            }
            '*' { respond boardInstance, [status: CREATED] }
        }
    }

    def edit(Board boardInstance) {
        respond boardInstance
    }

    @Transactional
    def update(Board boardInstance) {
        if (boardInstance == null) {
            notFound()
            return
        }

        if (boardInstance.hasErrors()) {
            respond boardInstance.errors, view:'edit'
            return
        }

        boardInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Board.label', default: 'Board'), boardInstance.id])
                redirect boardInstance
            }
            '*'{ respond boardInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Board boardInstance) {

        if (boardInstance == null) {
            notFound()
            return
        }

        boardInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Board.label', default: 'Board'), boardInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'board.label', default: 'Board'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
