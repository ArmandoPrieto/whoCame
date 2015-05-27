package whoCame

class CampersImporter {
	
	
	public CampersImporter(String file, boolean append){
		
		GroovyExcelParser parser = new GroovyExcelParser()
		def (headers, rows) = parser.parse(filename)
		def mapRecords = parser.toMap(headers, row)
		
		if(append){
			
			
			
			
		}
		
		
		
		
	}

}
