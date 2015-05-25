package camp

import java.util.List;

import demographic.Person
import file.Document;

class Camper extends Person{

	static belongsTo = [grade: Grade]
	
	
    static constraints = {
		
    }
	static mapping = {
		tablePerHierarchy false
	 }
}
