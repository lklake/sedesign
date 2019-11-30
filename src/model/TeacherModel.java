package model;

public class TeacherModel {
    private String name;
    private String userId;



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public TeacherModel(String name, String userId){
        this.name=name;
        this.userId=userId;
    }
}
