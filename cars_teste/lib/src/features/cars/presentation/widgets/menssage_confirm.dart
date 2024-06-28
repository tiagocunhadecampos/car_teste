import 'package:flutter/material.dart';

void messageConfirm(
  BuildContext context,
  String text,
  Function()? deleteReserved,
) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actionsOverflowAlignment: deleteReserved != null ? OverflowBarAlignment.center : OverflowBarAlignment.end,
        actionsAlignment: deleteReserved != null ? MainAxisAlignment.spaceAround : MainAxisAlignment.end,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
                child: Text(
              'Atenção!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
        actions: [
          if (deleteReserved != null)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "CANCELAR",
              ),
            ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              if (deleteReserved != null) {
                deleteReserved;
              }
            },
            child: Text(
              deleteReserved != null ? "CONFIRMAR" : "OK",
            ),
          ),
        ],
      );
    },
  );
}
