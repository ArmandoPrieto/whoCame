import camp.CounselorTeam
import camp.Grade

class BootStrap {

    def init = { servletContext ->
		environments {
			development{
		
		

				
		println "-----------------------------------------------------------------"
		println "-----------------------------------------------------------------"
		boolean gradeSave = true
		Grade.constraints.gradeName.inList.each{
			
			Grade g = new Grade()
			g.setGradeName(it)
			gradeSave = gradeSave && g.save()
		
			CounselorTeam team = new CounselorTeam()
			team.setGrade(g)
			gradeSave = gradeSave && team.save()
			
			}
		println 'GradeSave: '+gradeSave
		
		
		println "-----------------------------------------------------------------"
		println "-----------------------------------------------------------------"
		
			}
			
		}
		
		}
    def destroy = {
    }
}
