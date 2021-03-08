package com.taskmanager;


public class Model {

//
//
//    private static Model instance;
//    UserRepository userRepository = jsonLoad();
//    //TODO зачем здесь он
//
//    private Model() {
//    }
//
//    public static Model getInstance() {
//        if (instance == null) {
//            instance = new Model();
//        }
//        return instance;
//    }
//
//
//    public static long createID(Class type) {
//
//        Random random = new Random();
//        LocalDate date = LocalDate.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("ddMMyyyy");
//        while (true) {
//            int randomID = random.nextInt(1000);
//            long ID = Long.parseLong(date.format(formatter) + randomID);
//            if (type == Project.class && !Model.getInstance().userRepository.projectMap.containsKey(ID)) {
//                return ID;
//            } else if (type == Task.class) {
//                if (!Model.getInstance().userRepository.taskMap.containsKey(ID)) {
//                    return ID;
//                }
//            } else if (type == User.class) {
//                if (!Model.getInstance().userRepository.userMap.containsKey(ID)) {
//                    return ID;
//                }
//            } else return 0;
//        }
//    }
//    /**
//     * Operations on objects User
//     */
//    public User createUsers( String firstName, String lastName, String userName, String password) {
//
//
//        User user = new User(firstName, lastName, userName, password);
//        userRepository.addUser(user.getID(), user);
//        return user;
//    }
//
//
//    public User readUser(long ID) {
//        return userRepository.userMap.get(ID);
//    }
//
//    public void updateUser(long ID, User user) {
//        userRepository.userMap.replace(ID, user);
//    }
//
//    public void removeUser(long ID) {
//        userRepository.userMap.remove(ID);
//    }
//    public boolean isUserExist(String userName, String password) {
//         return  userRepository.checkUser(userName,password);
//    }
//
//    /**
//     * Operations on objects Task
//     */
//    public void createTask(String name, Task.Status status, Task.Priority priority, String description,
//                           Date startData, Date duoDate, Date endDate,
//                           long projectId, long reporterId, long assigneeId) {
//        Task task = new Task(name, status, priority, description, startData, duoDate,
//                endDate, projectId, reporterId, assigneeId);
//        userRepository.addTask(task.getID(), task);
//
//    }
//
//    public Task readTask(long ID) {
//        return userRepository.taskMap.get(ID);
//    }
//    public void updateTask(long ID, Task task) {
//        userRepository.taskMap.replace(ID, task);
//    }
//
//    public void deleteTask(long ID) {
//        userRepository.taskMap.remove(ID);
//    }
//
//    public Project createProject(String nameProject, List<Long> usersID, List<Long> tasksID, String description, Long creatorID) {
//        /*System.out.println("Name Project");
//        String projectName = scanner.nextLine();
//
//        System.out.println("describe the project");
//        String description = scanner.nextLine();*/
//
//        Project project = new Project(nameProject, usersID, tasksID, description, creatorID);
//        userRepository.addProject(project.getID(), project);
//        return project;
//    }
//
//    public Project readProject(long ID) {
//        return userRepository.projectMap.get(ID);
//    }
//
//    public void updateProject(long ID, Project project) {
//        userRepository.projectMap.replace(ID, project);
//    }
//
//    public void deleteProject(long ID) {
//        userRepository.projectMap.remove(ID);
//    }
//
//    public static void jsonSave(UserRepository userRepository, OutputStream out) throws IOException {
//        ObjectOutputStream serialize = new ObjectOutputStream(out);
//        serialize.writeObject(userRepository);
//    }
//    public Set<Map.Entry<Long, User>> getUsersEntrySet(){
//        return userRepository.userMap.entrySet();
//
//    }
//
//    public static UserRepository jsonLoad(InputStream in) throws IOException {
//        UserRepository temp = null;
//        try {
//            ObjectInputStream deserialize = new ObjectInputStream(in);
//
//            temp = (UserRepository) deserialize.readObject();
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//        return temp;
//    }
//
//    public void jsonSave() {
//        ObjectMapper mapper = new ObjectMapper();
//
//        try {
//            mapper.writeValue(new File("repository1.json"), userRepository);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//
//    public UserRepository jsonLoad() {
//        UserRepository temp = null;
//        try {
//            ObjectMapper mapper = new ObjectMapper();
//            temp = mapper.readValue(new File("repository1.json"), UserRepository.class);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return temp;
//    }
}
