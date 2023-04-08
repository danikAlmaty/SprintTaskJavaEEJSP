package bitlab.techorda.kz.classes;

import java.lang.reflect.Array;
import java.util.ArrayList;

public class DBManager {

    private static final ArrayList<Tasks> tasks = new ArrayList<>();

    private static Long id = 6L;

    static {
        tasks.add(
                new Tasks(1L,
                        "Create web application To Do List",
                        """
                                Создайте ВЕБ приложение на используя сервлеты и jsp. Проект связан с управлением задач.
                                Разбейте грамотно все страницы по блокам. (include jsp - очень важно!!!)
                                Использовать базу данных не обязательно.""",
                        "2023-04-01",
                        true));
        tasks.add(
                new Tasks(2L,
                        "Ubratsya in Home and go to the products",
                        "Mother said that you need to ubratsya home, because there are quests form Aul, and " +
                                "if you don't do that, uyat bolady",
                        "2023-04-01",
                        false));
        tasks.add(
                new Tasks(3L,
                        "Do your all home works from University",
                        "April just come, and do okonchanie of semestr not far" +
                                " so be carefull about your grades",
                        "2023-04-01",
                        true));
        tasks.add(
                new Tasks(4L,
                        "You need to go to the gym",
                        "For itshniki it is very important to do sport, becuase they sit everywhere, in home" +
                                " in work, everywhere",
                        "2023-04-01",
                        false));
        tasks.add(
                new Tasks(5L,
                        "Study Italian",
                        "i don't know why i need this, ok, it's just task",
                        "2023-04-01",
                        false));
    }


    public static ArrayList<Tasks> getTasks(){
        return tasks;
    }

    public static void addTasks(Tasks task){
        task.setId(id);
        task.setDone(false);
        tasks.add(task);
        id++;
    }

    public static Tasks getTask(long id){
        return tasks.stream()
                .filter(task ->task.getId()==id)
                .findFirst()
                .orElse(null);
    }

    public static void updateTask(Tasks taskNeed){
        for (int i = 0; i < tasks.size(); i++) {
            if (tasks.get(i).getId()==taskNeed.getId()){
                tasks.set(i, taskNeed);
                break;
            }
        }
    }

    public static void deleteTask(long id){
        for (int i = 0; i < tasks.size(); i++) {
            if (tasks.get(i).getId()==id){
                tasks.remove(i);
                break;
            }
        }
    }

}
