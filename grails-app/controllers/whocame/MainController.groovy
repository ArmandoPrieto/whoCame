package whocame

import whoCame.GroovyExcelParser

class MainController {

    def index() { 
		
		def filename ='web-app/files/Untitled2.xlsx'
		GroovyExcelParser parser = new GroovyExcelParser()
		def (headers, rows) = parser.parse(filename)
		println 'Headers'
		println '------------------'
		headers.each { header ->  println header }
		println "\n"
		println 'Rows'
		println '------------------'
		rows.each { row ->
			println parser.toMap(headers, row)
		}
		
	}
}
