package whocame
import static grails.async.Promises.*
import camp.Camper
import camp.Counselor
import camp.CounselorTeam
import camp.Grade
import demographic.Address;
import whoCame.GroovyExcelParser
import grails.util.Environment

import org.codehaus.groovy.grails.web.context.ServletContextHolder

class ImporterController {
	def grailsApplication
	def importerService
	def fileData = [:]
	
	
	String storageDirectory
	
	
	def beforeInterceptor = {
		
		if (Environment.current == Environment.DEVELOPMENT) {
			// insert Development environment specific code here
			storageDirectory =servletContext.getRealPath(grailsApplication.config.filesImporter.directory)
			
		} else
		if (Environment.current == Environment.TEST) {
			// insert Test environment specific code here
		} else
		if (Environment.current == Environment.PRODUCTION) {
			// insert Production environment specific code here
			storageDirectory = System.getenv('OPENSHIFT_DATA_DIR') + '/uploads'
		
		
		}
	
	
	
	}
	
    def index() { 
		render(view: "load")
	}
	
	
	
	def loadFile(){
		log.info "Processing upload file"
		
		def file = request.getFile("file")
		if(params["radio-choice"] == "choice-1"){
			fileData['fileName'] = grailsApplication.config.importer.file.counselor
			fileData['templateName'] = grailsApplication.config.importer.file.templateCounselor
		}else if(params["radio-choice"] == "choice-2"){
			fileData['fileName'] = grailsApplication.config.importer.file.camper
			fileData['templateName'] = grailsApplication.config.importer.file.templateCamper
		}
		if(!validateFileExtension(file, fileData['fileName'])){
			//Wrong extension
			log.info "Wrong extension"
			flash.error = "Wrong extension"
			render(view: "fail")
			return false
		}
		if(!transferFile(file, fileData['fileName'])){
			log.info "Wrong Transfer"
			flash.error = "Wrong Transfer"
			render(view: "fail")
			return false
		}
		if(!validateFileHeader()){
			//Wrong header
			log.info "Wrong header"
			flash.error = "Wrong header"
			render(view: "fail")
			return false
		}
		try{
			if(params["radio-choice"] == "choice-1"){
				importerService.counselorImporter(fileData)
			}else if(params["radio-choice"] == "choice-2"){
				importerService.camperImporter(fileData)
			}
		}catch(Exception e){
			log.info "Import process failed"
			flash.error = "Import process failed"
			e.printStackTrace()
			render(view: "fail")
			return false
		}
		flash.message = "File loaded successfully "
		render(view: "succes")
		
		
	}
	private boolean transferFile(def file, def fileName){
		try{
			def servletContext = ServletContextHolder.getServletContext()
			//def storegePath = servletContext.getRealPath(grailsApplication.config.filesImporter.directory)
			def storegePath = storageDirectory
			file.transferTo(new File("${storegePath}/${fileName}"))
		}catch(Exception e){
			e.printStackTrace()
			return false
		}
		return true
	}
	private boolean validateFileExtension(def file, def fileName){
		List fileExtensions=[".xlsx"]
		//is Excel xlsl
		int a = file.originalFilename.lastIndexOf(".");
		String extName = file.originalFilename.substring(a);
		if(!fileExtensions.contains(extName)){
			return false
		}
		return true
	}
	private boolean validateFileHeader(){
		def fileNameAux
		/*if (Environment.current == Environment.DEVELOPMENT) {
			//fileNameAux= g.resource(dir: 'files', file: fileData['fileName'], absolute: true)
			fileNameAux = storageDirectory+"/"+fileData['fileName']
		} else	if (Environment.current == Environment.TEST) {
		} else	if (Environment.current == Environment.PRODUCTION) {
			fileNameAux = new File(storageDirectory+"/"+fileData['fileName'])
		}*/
		
		fileNameAux = "${storageDirectory}/${fileData['fileName']}"

		GroovyExcelParser parser = new GroovyExcelParser()
		def (headers, rows) = parser.parseFile(fileNameAux)
		fileData['headers'] = headers
		fileData['rows'] = rows
		def values1 = headers as List;
		fileNameAux= g.resource(dir: 'files', file: fileData['templateName'], absolute: true)
		def (headersTemplate, rowsTemplate) = parser.parse(fileNameAux)
		def values2 = headersTemplate as List;
		return values1.equals(values2);
	}

	
}
