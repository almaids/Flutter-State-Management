import 'package:flutter/material.dart';
import '../models/plan.dart';
import '../models/task.dart';
import '../provider/plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan plan;
  const PlanScreen({super.key, required this.plan});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  late ScrollController scrollController;
  Plan get plan => widget.plan; // Getter untuk Plan

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Plan>> plansNotifier = PlanProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(plan.name)), // Nama Plan di AppBar
      body: ValueListenableBuilder<List<Plan>>(
        valueListenable: plansNotifier,
        builder: (context, plans, child) {
          // Cari Plan yang sesuai dengan yang sedang digunakan
          Plan currentPlan = plans.firstWhere(
            (p) => p.name == plan.name,
            orElse: () => plan,
          );

          return Column(
            children: [
              Expanded(child: _buildList(currentPlan)),
              SafeArea(child: Text(currentPlan.completenessMessage)),
            ],
          );
        },
      ),
      floatingActionButton: _buildAddTaskButton(context),
    );
  }

  Widget _buildList(Plan currentPlan) {
    return ListView.builder(
      controller: scrollController,
      itemCount: currentPlan.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(currentPlan.tasks[index], index, context),
    );
  }

  Widget _buildTaskTile(Task task, int index, BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          Plan currentPlan = planNotifier.value.firstWhere(
            (p) => p.name == plan.name,
            orElse: () => plan,
          );
          
          int planIndex = planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
          
          if (planIndex != -1) {
            List<Task> updatedTasks = List<Task>.from(currentPlan.tasks);
            updatedTasks[index] = Task(
              description: task.description,
              complete: selected ?? false,
            );
            
            List<Plan> updatedPlans = List<Plan>.from(planNotifier.value);
            updatedPlans[planIndex] = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );
            
            planNotifier.value = updatedPlans;
          }
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          Plan currentPlan = planNotifier.value.firstWhere(
            (p) => p.name == plan.name,
            orElse: () => plan,
          );
          
          int planIndex = planNotifier.value.indexWhere((p) => p.name == currentPlan.name);
          
          if (planIndex != -1) {
            List<Task> updatedTasks = List<Task>.from(currentPlan.tasks);
            updatedTasks[index] = Task(
              description: text,
              complete: task.complete,
            );
            
            List<Plan> updatedPlans = List<Plan>.from(planNotifier.value);
            updatedPlans[planIndex] = Plan(
              name: currentPlan.name,
              tasks: updatedTasks,
            );
            
            planNotifier.value = updatedPlans;
          }
        },
      ),
    );
  }

  Widget _buildAddTaskButton(BuildContext context) {
    ValueNotifier<List<Plan>> planNotifier = PlanProvider.of(context);

    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        Plan currentPlan = planNotifier.value.firstWhere(
          (p) => p.name == plan.name,
          orElse: () => plan,
        );
        
        int planIndex = planNotifier.value.indexWhere((p) => p.name == currentPlan.name);

        if (planIndex != -1) {
          List<Task> updatedTasks = List<Task>.from(currentPlan.tasks)
            ..add(const Task());

          List<Plan> updatedPlans = List<Plan>.from(planNotifier.value);
          updatedPlans[planIndex] = Plan(
            name: currentPlan.name,
            tasks: updatedTasks,
          );
          
          planNotifier.value = updatedPlans;
        }
      },
    );
  }
}
