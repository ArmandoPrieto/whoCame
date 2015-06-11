package stats

import camp.Grade
import camp.Camper
import camp.Counselor
import attendance.Board
import grails.transaction.Transactional
import org.joda.time.DateTime

@Transactional
class StatsService {

	def serviceMethod() {
	}
	def campersAttendance(DateTime dt){
		def c = Board.createCriteria()
		def campersAttendance = c.count () {

			attendanceRecords{
				eq('date', dt)
				checkIn{ eq('value',true) }
			}
			person{
				eq('class',camp.Camper)
			}
		}
		return campersAttendance
	}
	def counselorsAttendance(DateTime dt){
		def c1 = Board.createCriteria()
		def counselorsAttendance = c1.count () {

			attendanceRecords{
				eq('date', dt)
				checkIn{ eq('value',true) }
			}
			person{
				eq('class',camp.Counselor)
			}
		}
		return counselorsAttendance
	}

	def campersCheckIn(Grade grades,DateTime dt){
		def c2 = Camper.createCriteria()
		def campersCheckIn = c2.count () {
			boardAttendance{
				attendanceRecords{
					eq('date', dt)
					checkIn{ eq('value',true) }
				}
			}
			eq('camperGrade',grades)
		}
		return campersCheckIn
	}
	def campersCheckOut(Grade grades,DateTime dt){
		def c3 = Camper.createCriteria()
		def campersCheckOut = c3.count () {
			boardAttendance{
				attendanceRecords{
					eq('date', dt)
					checkOut{ eq('value',true) }
				}
			}
			eq('camperGrade',grades)
		}
		return campersCheckOut
	}

	def counselorsCheckIn(Grade grades,DateTime dt){
		def c4 = Counselor.createCriteria()
		def counselorsCheckIn = c4.count () {
			boardAttendance{
				attendanceRecords{
					eq('date', dt)
					checkIn{ eq('value',true) }
				}
			}
			team{ eq('grade',grades) }
		}
		return counselorsCheckIn
	}

	def counselorsCheckOut(Grade grades,DateTime dt){
		def c5 = Counselor.createCriteria()
		def counselorsCheckOut = c5.count () {
			boardAttendance{
				attendanceRecords{
					eq('date', dt)
					checkOut{ eq('value',true) }
				}
			}
			team{ eq('grade',grades) }
		}
		return counselorsCheckOut
	}
	
	def getTotalCampersByGrade(Grade grade){
		
		return Camper.countByCamperGrade(grade)
	}
	def getTotalCounselorsByGrade(Grade grade){
		
		return Counselor.countByTeam(grade.team)
	
	
	}
}
