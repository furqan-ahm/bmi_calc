import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {
  const ReusableCard({Key? key,required this.onTap,required this.child,required this.border}) : super(key: key);

  final Function? onTap;
  final Widget child;

  final Border? border;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap!=null?()=>onTap!():null,
          child: Container(
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(20),
                  border: border
              ),
              child: child
          ),
        ),
      ),
    );
  }
}







class GenderData extends StatelessWidget {
  const GenderData({Key? key,required this.isMale,required this.selected}) : super(key: key);

  final selectedColor=Colors.white;
  final color=Colors.grey;

  final bool isMale;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(isMale?Icons.male_outlined:Icons.female_outlined,size: 50,color: selected?selectedColor:color,),
        SizedBox(height: 5,),
        Text(isMale?'Male':'Female',style: TextStyle(color: selected?selectedColor:color),)
      ],
    );
  }
}


class MeasureData extends StatelessWidget {
  const MeasureData({Key? key,required this.name,required this.unit,required this.increment,required this.decrement,required this.measure}) : super(key: key);

  final String name;
  final String unit;
  final double measure;
  final void Function()? increment;
  final void Function()? decrement;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name,style: TextStyle(fontSize: 18),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(measure.toString(),style: TextStyle(fontSize: 50,fontWeight: FontWeight.w600),),Text(unit)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundedButton(
              icon: Icon(Icons.remove,size: 36,),
              onPressed: decrement,
            ),
            RoundedButton(
              icon: Icon(Icons.add,size: 36,),
              onPressed: increment,
            )
          ],
        ),
      ],
    );
  }
}


class RoundedButton extends StatelessWidget {
  const RoundedButton({Key? key,required this.icon,required this.onPressed}) : super(key: key);
  final Icon icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(20)
        ),
        child: icon,
      ),
      onTap: onPressed,
    );
  }
}



