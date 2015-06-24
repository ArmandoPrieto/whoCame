import camp.CounselorTeam
import camp.Grade
import com.security.Role
import com.security.User
import com.security.UserRole

class BootStrap {

    def init = { servletContext ->
		environments {
			development{
		
		

				
		println "-----------------------------------------------------------------"
		println "-----------------------------------------------------------------"
		Role r1 = new Role(authority: "ROLE_CAMPER")
		r1.save()
		Role r2 = new Role(authority: "ROLE_COUNSELOR")
		r2.save()
		Role r3 = new Role(authority: "ROLE_HEAD_COUNSELOR")
		r3.save()
		Role r4 = new Role(authority: "ROLE_HEAD_MASTER")
		r4.save()
		Role r5 = new Role(authority: "ROLE_SUPER_USER")
		r5.save()
		
		User user1 = new User()
		user1.setUsername("superuser")
		user1.password="0000"
		user1.save()
				
		boolean gradeSave = true
		int i = 0
		Grade.constraints.gradeName.inList.each{
			i++
			Grade g = new Grade()
			g.setGradeName(it)
			gradeSave = gradeSave && g.save()
		
			CounselorTeam team = new CounselorTeam()
			team.setGrade(g)
			gradeSave = gradeSave && team.save()
			
			User user = new User()
			user.setUsername(it)
			user.password="0000"
			user.save()
			if(it=="HeadMaster"){
			
			UserRole.create(user, r4)
			}else if(it=="Director"){
			UserRole.create(user, r5)
			}else{
				UserRole.create(user, r3)
			}
	
		
			}
		println 'GradeSave: '+gradeSave
		
		
		println "-----------------------------------------------------------------"
		println "-----------------------------------------------------------------"
		}
		production{
			if(!(Role.list() && Grade.list())){
				println "-----------------------------------------------------------------"
				println "-----------------------------------------------------------------"
				Role r1 = new Role(authority: "ROLE_CAMPER")
				r1.save()
				Role r2 = new Role(authority: "ROLE_COUNSELOR")
				r2.save()
				Role r3 = new Role(authority: "ROLE_HEAD_COUNSELOR")
				r3.save()
				Role r4 = new Role(authority: "ROLE_HEAD_MASTER")
				r4.save()
				Role r5 = new Role(authority: "ROLE_SUPER_USER")
				r5.save()
				
				User user1 = new User()
				user1.setUsername("superuser")
				user1.password="0000"
				user1.save()
						
				boolean gradeSave = true
				int i = 0
				Grade.constraints.gradeName.inList.each{
					i++
					Grade g = new Grade()
					g.setGradeName(it)
					gradeSave = gradeSave && g.save()
				
					CounselorTeam team = new CounselorTeam()
					team.setGrade(g)
					gradeSave = gradeSave && team.save()
					
					User user = new User()
					user.setUsername(it)
					user.password="0000"
					user.save()
					if(it=="HeadMaster"){
					
					UserRole.create(user, r4)
					}else if(it=="Director"){
					UserRole.create(user, r5)
					}else{
						UserRole.create(user, r3)
					}
			
				
					}
				println 'GradeSave: '+gradeSave
				
				
				println "-----------------------------------------------------------------"
				println "-----------------------------------------------------------------"
				
			}
			
		}
		
		}
    }
    def destroy = {
    }
}
