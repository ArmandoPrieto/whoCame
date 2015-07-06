package whocame

import camp.Camper
import camp.Counselor
import camp.CounselorTeam
import camp.Grade
import demographic.Address;
import whoCame.GroovyExcelParser

class ImporterController {

    def index() { }
	
	
	def counselorImporter(){
		boolean importProcess = true
		
		
		//String filename = this.getServletConfig().getServletContext().getResourceAsStream("/files/counselor.xlsx");
	//	println("HOLA::::::"+System.getenv('OPENSHIFT_DATA_DIR'))
		String filename= g.resource(dir: 'files', file: 'counselor.xlsx', absolute: true)
		println("---------->"+filename)
		boolean append = params.append?:false
		String particularGrade = params.grade?:null
		if(!append){
			Counselor.findAll().each {
				//it?.team?.counselors?.remove(it)
				it?.team?.removeFromCounselors(it)
				it.delete()
			}
			
		}
		GroovyExcelParser parser = new GroovyExcelParser()
		def (headers, rows) = parser.parse(filename)
	
		rows.eachWithIndex { row, i ->
			Counselor counselor
			try {
			def mapRecords = parser.toMap(headers, row)
			if(!particularGrade || (particularGrade && particularGrade == mapRecords['gradeName'])){
				
			counselor = new Counselor(mapRecords)
			counselor.setPersonAddress(new Address(mapRecords))
		
			
			Grade grade = Grade.findByGradeName(mapRecords['gradeName'])
			if(grade){
			
				CounselorTeam team = CounselorTeam.findByGrade(grade)
				team.addToCounselors(counselor)
				
			}
				if(!counselor.save()){
					
					importProcess = false
					throw new Exception ("Counselor save failed at row"+ i+1)
				}
			}
			} catch(Exception e) {
				println "***********---------***********"
				println e.toString()
				counselor.errors.allErrors.each {error ->
					println error.toString()
				}
				println "***********---------***********"
			}
		}
		
		if(importProcess){
			render(contentType: "application/json") {
				result(operation: 'ok')
			}
		}else{
			render(contentType: "application/json") {
				result(operation: 'error', description:'import error')
				}
		}
		
	}
	def camperImporter(){
		boolean importProcess = true
		String filename
		//def filename = 'web-app/files/campers.xlsx'
		boolean append = params.append?:false
		
		if(!append){
			filename= g.resource(dir: 'files', file: 'campers.xlsx', absolute: true)
			Camper.findAll().each {
				it?.camperGrade?.removeFromCampers(it)
				it.delete()
			}
			
		}else{
		filename= g.resource(dir: 'files', file: 'extraCampers.xlsx', absolute: true)
		}
		GroovyExcelParser parser = new GroovyExcelParser()
		def (headers, rows) = parser.parse(filename)
		rows.eachWithIndex { row, i ->
			Camper camper
			try {
			def mapRecords = parser.toMap(headers, row)
			camper = new Camper(mapRecords)
			
				Grade grade = Grade.findByGradeName(mapRecords['gradeName'])
				if(grade){
					grade.addToCampers(camper)
					
				}else{
					throw new Exception ("No grade found at row"+ i+1)
				}
				
				if(!camper.save()){
					importProcess = false
					throw new Exception ("Camper save failed at row"+ i+1)
				}
			} catch(Exception e) {
				println "***********---------***********"
				println e.toString()
				camper.errors.allErrors.each {error ->
					println error.toString()
				}
				println "***********---------***********"
			}
			
		
		}
		
		if(importProcess){
			render(contentType: "application/json") {
				result(operation: 'ok')
			}
		}else{
			render(contentType: "application/json") {
				result(operation: 'error', description:'import error')
				}
		}
	}
	
}
