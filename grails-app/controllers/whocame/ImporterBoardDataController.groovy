package whocame
import grails.util.Environment
import whoCame.UnZip
import groovy.io.FileType
import org.codehaus.groovy.grails.web.context.ServletContextHolder
class ImporterBoardDataController {

	String storageDirectory
	def importerService
	
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
	def index(){
		
	}
    def process() { 
		log.info "Processing upload file"
		
		def zipFile = request.getFile("zipFile")
		def inputFileName = zipFile.originalFilename
		this.validateFileExtension(zipFile, inputFileName)
		this.transferFile(zipFile, inputFileName)
		def outputFolderName = "unZipFile"
		def date = params.date
		UnZip.unZipIt("${storageDirectory}/${inputFileName}","${storageDirectory}/${outputFolderName}")
		//def list = []
		def dir = new File("${storageDirectory}/${outputFolderName}/campers")
		dir.eachFileRecurse (FileType.FILES) { file ->
		  readFileAndSaveData("camper", date,"${outputFolderName}/campers/${file.name}")
		}
		log.info "Campers data imported"
		dir = new File("${storageDirectory}/${outputFolderName}/counselors")
		dir.eachFileRecurse (FileType.FILES) { file ->
		  readFileAndSaveData("counselor", date,"${outputFolderName}/counselors/${file.name}")
		}
		log.info "Counselors data imported"
		//Delete files
		
	render(view: "result")	
	}
	
	protected void readFileAndSaveData(def personType, def date, def fileName){
		 File file = new File("${storageDirectory}/${fileName}")
		 def firstLine =file.toCsvReader(['charset':'UTF-8']).readNext()
		 def grade = firstLine[1]
		 file.toCsvReader(['charset':'UTF-8', 'skipLines':'2' ]).eachLine { tokens ->
			 importerService.checkAttendanceImported(personType,"checkIn",grade,tokens[0], tokens[1],date )
			 //System.out.println("${tokens[0]} ${tokens[1]}"  )
		 }
	 
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
		List fileExtensions=[".zip"]
		//is Excel xlsl
		int a = file.originalFilename.lastIndexOf(".");
		String extName = file.originalFilename.substring(a);
		if(!fileExtensions.contains(extName)){
			return false
		}
		return true
	}
}
