import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../themes/custom_colors.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../bottom_tabbar/custom_tabbart_view.dart';
import 'package:todo/screens/add_todo_page/add_todo_page_bloc.dart';
import 'package:todo/screens/add_todo_page/add_todo_page_event.dart';

class AddTodoPageView extends StatefulWidget {
  const AddTodoPageView({Key? key}) : super(key: key);

  @override
  _AddTodoPageViewState createState() => _AddTodoPageViewState();
}

class _AddTodoPageViewState extends State<AddTodoPageView> {
  List<String> items = [
    "Select Task Category",
    'Office taks',
    'Personal task',
    'Others'
  ];
  String selectedItem = 'Select Task Category';

  DateTime? selectedDate;
  final TextEditingController _startDateateController = TextEditingController();
  final TextEditingController _endDateateController = TextEditingController();
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();

  Future<void> _selectDate(
      BuildContext context, TextEditingController dateController) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: CustomColors.PRIMARY),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AddTodoPageBloc addTodoBloc = BlocProvider.of<AddTodoPageBloc>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/add_task_bg.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CutomAppBar(),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomColors.BACKGROUND,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            hintText: 'Select an option',
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 6),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            prefixIcon: Image.asset('assets/icons/work.png'),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selectedItem,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedItem = newValue!;
                                });
                              },
                              items: items.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              hintText: 'Task Name',
                              controller: _taskNameController,
                              validator: RequiredValidator(
                                  errorText: "Task Name is required"),
                              tap: () {},
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            CustomTextFormField(
                              hintText: 'Description',
                              controller: _taskDescriptionController,
                              validator: RequiredValidator(
                                  errorText: "Task description is required"),
                              height: 100.0,
                              tap: () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      CustomTextFormField(
                        hintText: 'Start date',
                        controller: _startDateateController,
                        validator: RequiredValidator(
                            errorText: "Username is required"),
                        tap: () =>
                            _selectDate(context, _startDateateController),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      CustomTextFormField(
                        hintText: 'End date',
                        controller: _endDateateController,
                        validator: RequiredValidator(
                            errorText: "Username is required"),
                        tap: () => _selectDate(context, _endDateateController),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100.0,
                ),
              ],
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
              child: CustomButton(
                title: 'Add Task',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    addTodoBloc.add(
                      AddTodoEvent(
                          category: selectedItem,
                          title: _taskNameController.text.trim(),
                          description: _taskDescriptionController.text.trim(),
                          startDate: _startDateateController.text.trim(),
                          endDate: _endDateateController.text.trim()),
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: addTodoBloc,
                          child: const CustomTabBarVIEW(),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
