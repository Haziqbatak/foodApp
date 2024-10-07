part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar(
      {super.key, required this.onTap, required this.selectIndex});

  final int selectIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, -2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              if(onTap != null){
                onTap(0);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/ic_home' +
                        ((selectIndex == 0) ? '.png' : '_normal.png'),
                  ),
                  fit: BoxFit.contain
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              if(onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/ic_order' +
                          ((selectIndex == 1) ? '.png' : '_normal.png'),
                    ),
                    fit: BoxFit.contain
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              if(onTap != null){
                onTap(2);
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/ic_profile' +
                          ((selectIndex == 2) ? '.png' : '_normal.png'),
                    ),
                    fit: BoxFit.contain
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
