package control;

import model.StudentModel;
import model.TeacherModel;
import model.UserModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.SessionScope;
import service.ChangePasswordService;
import service.LoginService;

import javax.servlet.http.HttpSession;
import java.net.http.HttpResponse;

@Controller
@SessionScope
@Qualifier("/userCenter")
public class UserInfoControl {
    @Autowired
    @Qualifier("loginService")
    private LoginService loginService;

    @Autowired
    @Qualifier("changePasswordService")
    private ChangePasswordService changePasswordService;

    private UserModel userModel;
    @RequestMapping(params = "action=login")
    public String onLogin(String userId, String password, HttpSession session,String identity) {
        this.userModel=loginService.userLogin(userId, password,identity);
        System.out.println(session);
        if(userModel==null )
            return "../login";
        else {
            if("student".equals(identity)){
                StudentModel student = new StudentModel(userModel.getUserId(),userModel.getName());
                this.userModel=student;
                session.setAttribute("currentUser", student);
                session.setAttribute("currentUserIdentity","student");
                return "main";
            }
            else{
                TeacherModel teacher = new TeacherModel(userModel.getUserId(),userModel.getName());
                this.userModel=teacher;
                session.setAttribute("currentUser", teacher);
                session.setAttribute("currentUserIdentity","teacher");
                return "main";
            }
        }
    }
    @RequestMapping(params = "action=logout")
    public String logout(HttpSession session){
        System.out.println(session);
        this.userModel=null;
        this.loginService=null;
        session.invalidate();
        return "../login";
    }
    @RequestMapping(params = "action=changePassword")
    public String onChangePassword(String rawPassword,String newPassword){
        int ret=changePasswordService.changePassword(userModel.getUserId(),rawPassword,newPassword);
        if(ret==0){
            return "updateSuccess";
        }
        else{
            return "updatePassword";
        }
    }
}
