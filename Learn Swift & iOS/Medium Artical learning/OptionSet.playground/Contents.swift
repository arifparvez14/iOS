import UIKit

//enum TaskType {
//    case urgent
//    case notUrgent
//    case easy
//    case hard
//}

//struct Task {
//    let title: String
//    let taskType: Set<TaskType>
//}
//
//let task = Task(title: "Not urgent task", taskType: [.notUrgent, .easy])


struct TaskType: OptionSet {
    let rawValue: Int
    
    public static let urgent = TaskType(rawValue: 1 << 0)
    public static let notUrgent = TaskType(rawValue: 1 << 1)
    public static let easy = TaskType(rawValue: 1 << 2)
    public static let hard = TaskType(rawValue: 1 << 3)
}


struct Task {
    let title: String
    let taskType: TaskType
}

let taskTypes: TaskType = [.notUrgent, .easy]
let task = Task(title: "Not urgent task", taskType: taskTypes)

if task.taskType.contains([.notUrgent, .easy]) {
    print("The task is easy and not urgent")
}

let task1 = Task(title: "Urgent but easy task", taskType: [.urgent, .easy])
let task2 = Task(title: "Urgent and hard task", taskType: [.urgent, .hard])

print(task1.taskType.intersection(task2.taskType))
print(task1.taskType.union(task2.taskType))
