package importer
import camp.Camper
import camp.Counselor
import camp.CounselorTeam
import camp.Grade
import demographic.Address
import grails.transaction.Transactional
import whoCame.GroovyExcelParser

@Transactional
class ImporterService {
	
	
	
	
	def counselorImporter(def fileData, boolean appendRecords = false, String particularGrade = null){
			boolean importProcess = true
			//String filename = this.getServletConfig().getServletContext().getResourceAsStream("/files/counselor.xlsx");
		//	println("HOLA::::::"+System.getenv('OPENSHIFT_DATA_DIR'))
		//	String filename = servletContext.getRealPath(grailsApplication.config.importer.file.counselor)
			log.info "---------->${fileData['fileName']}"
			if(!appendRecords){
				Counselor.findAll().each {
					it?.team?.removeFromCounselors(it)
					it.delete()
				}
			}
			fileData['rows'].eachWithIndex { row, i ->
				Counselor counselor
				def mapRecords
				try {
					GroovyExcelParser parser = new GroovyExcelParser()
					mapRecords = parser.toMap(fileData['headers'], row)
					if(!particularGrade || (particularGrade && particularGrade == mapRecords['gradeName'])){
						counselor = new Counselor(mapRecords)
						counselor.setPersonAddress(new Address(mapRecords))
						Grade grade = Grade.findByGradeName(mapRecords['gradeName'])
						if(grade){
							CounselorTeam team = CounselorTeam.findByGrade(grade)
							team.addToCounselors(counselor)
						}
						if(!counselor.save()){
							
							throw new Exception ("Counselor save failed at row"+ i+1)
						}
					}
				} catch(Exception e) {
					importProcess = false
					log.error "***********---------***********"
					log.error mapRecords['gradeName']
					log.error e.toString()
					counselor.errors.allErrors.each {error ->
						log.error error.toString()
					}
					log.error "***********---------***********"
				}
			}
			
			if(!importProcess){
				
				log.error "Import Process Failed"
				throw new Exception("Import Process Failed")
			}
	}
		
	def camperImporter(def fileData, boolean appendRecords=false, String particularGrade = null){
			boolean importProcess = true
			log.info "---------->${fileData['fileName']}"
			if(!appendRecords){
			Camper.findAll().each {
					it?.camperGrade?.removeFromCampers(it)
					it.delete()
				}
			}
			fileData['rows'].eachWithIndex { row, i ->
				Camper camper
				def mapRecords
				try {
				GroovyExcelParser parser = new GroovyExcelParser()
				mapRecords = parser.toMap(fileData['headers'], row)
				camper = new Camper(mapRecords)
					Grade grade = Grade.findByGradeName(mapRecords['gradeName'])
					if(grade){
						grade.addToCampers(camper)
					}else{
						throw new Exception ("No grade found at row"+ i+1)
					}
					if(!camper.save()){
						
						throw new Exception ("Camper save failed at row"+ i+1)
					}
				} catch(Exception e) {
					importProcess = false
					log.error "***********---------***********"
					log.error e.toString()
					camper.errors.allErrors.each {error ->
						println error.toString()
					}
					log.error "***********---------***********"
				}
			}
			if(!importProcess){
				log.error "Import Process Failed"
				throw new Exception("Import Process Failed")
			}
		}
}
