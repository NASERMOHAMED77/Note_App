// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:apinoteapp/core/widget/defult_button.dart';
import 'package:apinoteapp/core/widget/defult_form_field.dart';
import 'package:apinoteapp/features/home/persentation/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constant.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getNotes(token);
    super.initState();
  }

  TextEditingController x = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController xx = TextEditingController();
  Color color = Color.fromARGB(255, 7, 255, 226);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    content: Column(children: [
                      DefultField(
                          hint: 'Title', controller: title, validate: (c) {
                            return null;
                          }),
                      DefultField(
                          hint: 'Content',
                          controller: content,
                          validate: (c) {
                            return null;
                          }),
                      DefultButton(
                          color: Colors.white,
                          overlaycolor: kscolor,
                          onpressed: () {
                            BlocProvider.of<HomeCubit>(context)
                                .addNotes(token, title.text, content.text, '');
                          },
                          text: 'Add')
                    ]),
                    title: Text(
                      'Add Note',
                    ));
              });
        },
        child: Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: SafeArea(
          child: Column(
        children: [
          AppBarWidget(),
          Expanded(
            child: ListView.builder(
                itemCount: BlocProvider.of<HomeCubit>(context).x!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  content: Column(children: [
                                    DefultField(
                                        hint: 'Title',
                                        controller: x,
                                        validate: (c) {
                                          return null;
                                        }),
                                    DefultField(
                                        hint: 'Content',
                                        controller: xx,
                                        validate: (c) {
                                          return null;
                                        }),
                                    DefultButton(
                                        color: Colors.white,
                                        overlaycolor: kscolor,
                                        onpressed: () {
                                          BlocProvider.of<HomeCubit>(context)
                                              .updateNotes(
                                                  BlocProvider.of<HomeCubit>(
                                                          context)
                                                      .x![index]['notes_id'],
                                                  x.text,
                                                  xx.text);
                                        },
                                        text: 'EDIT')
                                  ]),
                                  title: Text(
                                    'Update Note',
                                  ));
                            });
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 7, 181, 255),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Text(
                              BlocProvider.of<HomeCubit>(context).x![index]
                                  ['notes_title'],
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    BlocProvider.of<HomeCubit>(context)
                                        .x![index]['notes_content'],
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      BlocProvider.of<HomeCubit>(context)
                                          .deleteNotes(
                                              BlocProvider.of<HomeCubit>(
                                                      context)
                                                  .x![index]['notes_id']);
                                      print(BlocProvider.of<HomeCubit>(context)
                                          .x![index]['notes_id']);
                                    },
                                    icon: Icon(Icons.delete))
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notes',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: kscolor, borderRadius: BorderRadius.circular(5)),
                  child: Icon(Icons.search)),
              SizedBox(
                width: 8,
              ),
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: kscolor, borderRadius: BorderRadius.circular(5)),
                  child: Icon(Icons.info)),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
