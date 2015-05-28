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
		def filename = 'web-app/files/counselor.xlsx'
		boolean append = false
		if(!append){
			Counselor.executeUpdate("delete Counselor")
		}
		GroovyExcelParser parser = new GroovyExcelParser()
		def (headers, rows) = parser.parse(filename)
	
		rows.eachWithIndex { row, i ->
			Counselor counselor
			try {
			def mapRecords = parser.toMap(headers, row)
			counselor = new Counselor(mapRecords)
			counselor.personAddress = new Address(mapRecords)
			
			Grade grade = Grade.findByGradeName(mapRecords['gradeName'])
			if(grade){
			
				CounselorTeam team = CounselorTeam.findByGrade(grade)
				team.getCounselors().add(counselor)
				team.save()
				counselor.team = team
			}
			
				if(!counselor.save()){
					importProcess = false
					throw new Exception ("Counselor save failed at row"+ i+1)
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
		def filename = 'web-app/files/campers.xlsx'
		boolean append = false
		
		if(!append){
			Camper.executeUpdate("delete Camper")
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
					grade.getCampers().add(camper)
					grade.save()
					camper.setCamperGrade(grade)
				
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
