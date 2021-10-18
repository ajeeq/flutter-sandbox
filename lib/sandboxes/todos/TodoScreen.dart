// Resources - https://www.youtube.com/playlist?list=PLjr4ufdmNA4IjEQ6xIv_sQdyBhm2kn1Qv

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox_riverpod/sandboxes/todos/repos/FakeTodoRepository.dart';
import 'package:sandbox_riverpod/sandboxes/todos/states.dart';
import 'models/models.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      todoExceptionProvider,
      (StateController<TodoException?> exceptionState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              exceptionState.state!.error.toString(),
            ),
          ),
        );
      },
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'TODOS',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.white),
          ),
          actions: const [
            _Menu(),
          ],
          bottom: const TabBar(
            tabs: [
              Text(
                'All',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Completed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              Column(
                children: const [
                  AddTodoPanel(),
                  SizedBox(
                    height: 20,
                  ),
                  _TodoList(),
                ],
              ),
              const _CompletedTodos(),
            ],
          ),
        ),
      ),
    );
  }
}

class _TodoList extends StatefulWidget {
  const _TodoList({Key? key}) : super(key: key);

  @override
  __TodoListState createState() => __TodoListState();
}

class __TodoListState extends State<_TodoList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      // child: Consumer(
      //   builder: (context, ref, child) {
      //     final todosState = ref.watch(todosNotifierProvider);
      //     return todosState.when(
      //       data: (todos) {
      //         return RefreshIndicator(
      //           onRefresh: () {
      //             return ref.read(todosNotifierProvider.notifier).refresh();
      //           },
      //           child: ListView(
      //             children: [
      //               ...todos
      //                   .map(
      //                     (todo) => ProviderScope(
      //                       overrides: [_currentTodo.overrideWithValue(todo)],
      //                       child: const TodoItem(),
      //                     ),
      //                   )
      //                   .toList()
      //             ],
      //           ),
      //         );
      //       },
      //       loading: () => Center(
      //         child: CircularProgressIndicator(),
      //       ),
      //       error: (e, stackTrace: st) => Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Text('Todos could not be loaded'),
      //             ElevatedButton(
      //               onPressed: () {
      //                 ref
      //                     .read(todosNotifierProvider.notifier)
      //                     .retryLoadingTodo();
      //               },
      //               child: Text('Retry'),
      //             )
      //           ],
      //         ),
      //       ),
      //     );
      //   },
      // ),
      child: Text("Text")
    );
  }
}

class _CompletedTodos extends ConsumerWidget {
  const _CompletedTodos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosState = ref.watch(completedTodosProvider);
    // return todosState.when(
    //   data: (todos) {
    //     return ListView(
    //       children: [
    //         ...todos
    //             .map(
    //               (todo) => ProviderScope(
    //                 overrides: [_currentTodo.overrideWithValue(todo)],
    //                 child: const TodoItem(),
    //               ),
    //             )
    //             .toList()
    //       ],
    //     );
    //   },
    //   loading: () => Center(
    //     child: CircularProgressIndicator(),
    //   ),
    //   error: (e, stackTrace: st) => Center(
    //     child: Text('Something went wrong'),
    //   ),
    // );
    return Expanded(child: Text("Text"));
  }
}

final _currentTodo = Provider<Todo>((ref) {
  throw UnimplementedError();
});

class TodoItem extends ConsumerStatefulWidget {
  const TodoItem({
    Key? key,
  }) : super(key: key);

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends ConsumerState<TodoItem> {
  late TextEditingController _textEditingController;
  late FocusNode _textFocusNode;

  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _textFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todo = ref.watch(_currentTodo);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red),
        onDismissed: (_) {
          ref.read(todosNotifierProvider.notifier).remove(todo.id);
        },
        child: FocusScope(
          child: Focus(
            onFocusChange: (isFocused) {
              if (!isFocused) {
                setState(() {
                  hasFocus = false;
                });
                ref.read(todosNotifierProvider.notifier).edit(
                    id: todo.id, description: _textEditingController.text);
              } else {
                _textEditingController
                  ..text = todo.description
                  ..selection = TextSelection.fromPosition(
                      TextPosition(offset: _textEditingController.text.length));
              }
            },
            child: ListTile(
              onTap: () {
                setState(() {
                  hasFocus = true;
                });
                _textFocusNode.requestFocus();
              },
              title: hasFocus
                  ? TextField(
                      focusNode: _textFocusNode,
                      controller: _textEditingController,
                    )
                  : Text(todo.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: todo.completed,
                    onChanged: (_) {
                      ref.read(todosNotifierProvider.notifier).toggle(todo.id);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref.read(todosNotifierProvider.notifier).remove(todo.id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum _MenuOptions { deleteOnComplete }

class _Menu extends ConsumerWidget {
  const _Menu({Key? key}) : super(key: key);

  Future<void> onSelected(WidgetRef ref, _MenuOptions result) async {
    if (result == _MenuOptions.deleteOnComplete) {
      final currentSetting = ref.read(settingsProvider).state.deleteOnComplete;
      ref.read(settingsProvider).state =
          Settings(deleteOnComplete: !currentSetting);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(settingsProvider).state.deleteOnComplete;
    return PopupMenuButton<_MenuOptions>(
      onSelected: (result) {
        onSelected(ref, result);
      },
      icon: const Icon(
        Icons.menu,
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<_MenuOptions>>[
        PopupMenuItem<_MenuOptions>(
          value: _MenuOptions.deleteOnComplete,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Delete on complete'),
              Checkbox(
                value: isChecked,
                onChanged: null,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class AddTodoPanel extends ConsumerStatefulWidget {
  const AddTodoPanel({Key? key}) : super(key: key);

  @override
  _AddTodoPanelState createState() => _AddTodoPanelState();
}

class _AddTodoPanelState extends ConsumerState<AddTodoPanel> {
  final _textEditingController = TextEditingController();

  void _submit([String? value]) {
    ref
        .read(todosNotifierProvider.notifier)
        .add(_textEditingController.value.text);
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(hintText: 'New todo'),
              onSubmitted: _submit,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _submit,
          ),
        ],
      ),
    );
  }
}
