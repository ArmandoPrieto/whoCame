package demographic

class Phone {
	
	String phoneType
	String number

    static constraints = {
		phoneType( inList: ["Mobile", "Home"])
	}
}
