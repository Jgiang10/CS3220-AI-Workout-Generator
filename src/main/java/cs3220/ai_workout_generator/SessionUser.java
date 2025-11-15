package cs3220.ai_workout_generator;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

@Component
@SessionScope
public class SessionUser {
    private String email;
    private boolean authenticated;

    public String getEmail(){
        return email;
    }
    public void setEmail(String email){
        this.email = email;
    }
    public boolean isAuthenticated(){
        return authenticated;
    }
    public void setAuthenticated(boolean authenticated) {
        this.authenticated = authenticated;
    }
    public void clear(){
        this.email = null;
        this.authenticated = false;
    }
}