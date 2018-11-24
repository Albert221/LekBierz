import 'package:flutter/material.dart';
import 'package:lek_bierz/main.dart';
import 'package:lek_bierz/redux/state.dart';
import 'package:lek_bierz/ui/medicine_icons_icons.dart';

class MedicineItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;
  final Function onTap;

  const MedicineItem(
      {Key key, this.color, this.icon, this.title, this.subtitle, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: color?.withAlpha(64) ?? Colors.transparent),
                child: Icon(
                  icon,
                  size: 18.0,
                  color: color,
                )),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16.0),
                ),
                subtitle != null
                    ? Text(
                        subtitle,
                        style:
                            TextStyle(fontSize: 14.0, color: MyApp.grayColor),
                      )
                    : SizedBox()
              ],
            )
          ],
        ),
      ),
      onTap: () => onTap != null ? onTap() : null,
    );
  }

  static IconData mapMedicineFormToIcon(MedicineForm form) {
    switch (form) {
      case MedicineForm.pill:
        return MedicineIcons.pill;
      case MedicineForm.tablet:
        return MedicineIcons.tablet;
      case MedicineForm.syrup:
        return MedicineIcons.syrup;
      default:
        return Icons.help;
    }
  }
}
