package camp

import java.util.List;

import demographic.Person
import file.Document;

class Camper extends Person{

	static belongsTo = [camperGrade: Grade]
	
	
    static constraints = {
		camperGrade(nullable: true)
    }
	static mapping = {
		tablePerHierarchy false
	 }
}
