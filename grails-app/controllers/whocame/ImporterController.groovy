package whocame

import camp.Counselor
import camp.CounselorTeam
import camp.Grade
import demographic.Address;
import whoCame.GroovyExcelParser

class ImporterController {

    def index() { }
	
	
	def counselorImporter(){
		boolean importProcess = true
		def filename = 'web-app/files/Untitled2.xlsx'
		boolean append = false
		GroovyExcelParser parser = new GroovyExcelParser()
		def (headers, rows) = parser.parse(filename)
		headers.each{
			
			println it
		}
		rows.each { row ->
			def mapRecords = parser.toMap(headers, row)
			Counselor counselor = new Counselor(mapRecords)
			counselor.personAddress = new Address(mapRecords)
			
			if(mapRecords['grade'] && mapRecords['grade']!=''){
				
			println('GRADE: ' +mapRecords['grade'])
			Grade grade = Grade.findByGradeName(mapRecords['grade'])
			println('GRADE GRADE: ' +grade)
			CounselorTeam team = CounselorTeam.findByGrade(grade)
			
			team.getCounselors().add(counselor)
			team.save()
			
			counselor.team = team
			}
			println(counselor.name + " "+counselor?.personAddress?.address)
			try {
				if(!counselor.save()){
					throw new Exception ("Counselor save failed")
				}
			} catch(Exception e) {
				println "***********---------***********"
				println e.toString()
				// This will at least tell you what is wrong with
				// the instance you are trying to save
				counselor.errors.allErrors.each {error ->
					println error.toString()
				}
				println "***********---------***********"
			}
			
		
		}
		println 'SaveImportCounselor: '+importProcess
		
		if(!append){
			
			
			
			
		}
		
	}
}
