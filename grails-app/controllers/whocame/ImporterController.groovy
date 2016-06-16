package whocame

import camp.Camper
import camp.Counselor
import camp.CounselorTeam
import camp.Grade
import demographic.Address;
import whoCame.GroovyExcelParser
import org.codehaus.groovy.grails.web.context.ServletContextHolder

class ImporterController {
	def grailsApplication
	def importerService
	def fileData = [:]
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
			render(view: "fail")
			return false
		}
		if(!transferFile(file, fileData['fileName'])){
			log.info "Wrong Transfer"
			render(view: "fail")
			return false
		}
		if(!validateFileHeader()){
			//Wrong header
			log.info "Wrong header"
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
			e.printStackTrace()
			render(view: "fail")
			return false
		}
		
		render(view: "succes")
		
		log.info "Keep working"
	}
	
	private boolean transferFile(def file, def fileName){
		try{
			def servletContext = ServletContextHolder.getServletContext()
			def storegePath = servletContext.getRealPath(grailsApplication.config.filesImporter.directory)
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
		String fileNameAux= g.resource(dir: 'files', file: fileData['fileName'], absolute: true)
		GroovyExcelParser parser = new GroovyExcelParser()
		def (headers, rows) = parser.parse(fileNameAux)
		fileData['headers'] = headers
		fileData['rows'] = rows
		def values1 = headers as List;
		fileNameAux= g.resource(dir: 'files', file: fileData['templateName'], absolute: true)
		def (headersTemplate, rowsTemplate) = parser.parse(fileNameAux)
		def values2 = headersTemplate as List;
		return values1.equals(values2);
	}

	
}
