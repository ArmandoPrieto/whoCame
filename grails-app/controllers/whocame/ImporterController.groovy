package whocame

import camp.Counselor
import camp.CounselorTeam
import camp.Grade
import demographic.Address;
import whoCame.GroovyExcelParser

class ImporterController {

    def index() { }
	
	
	def counselorImporter(){
	/*	boolean importProcess = true
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
			counselor.address = new Address(mapRecords)
			
			Grade grade = Grade.findByGradeName(mapRecords['grade'])
			CounselorTeam team = CounselorTeam.findByGrade(grade)
			
			team.addCounselor(counselor)
			team.save()
			
			counselor.team = team
			
			println(counselor.name + " "+counselor?.address?.address)
			importProcess = importProcess && counselor.save()
		
		}
		println 'SaveImportCounselor: 'importProcess
		
		if(!append){
			
			
			
			
		}*/
		
	}
}
