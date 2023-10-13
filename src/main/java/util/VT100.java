package util;
// enum과 int 함께 적용되도록 ... 
public class VT100 {
	
	/** 
	 * 속성은 없고 동작만 있다. >>VT100은 오로지 util목적으로만 쓰기 위해 만들었다. 
	 * main클래스에서 new연산자로 객체를 생성해도 문제는 없지만, 큰 의미는 없다. 
	 * util 목적에 충실하기 위해 설정을 한다. (유틸 클래스에서 생성자를 프라이빗으로 설정)   
	 * */
	
	private VT100() {
		
	} // 생성자를 프라이빗으로 두면 외부에서 객체를 생성할 수 없다. 
	// 이렇게 하는 이유는 유틸목적으로 만든 클래스가 제대로 작동하기 위해서이다. 
	
		
	 public static void clearScreen() {
		 System.out.print("\033[2J");
	 }
	 
	 public static void cursorMove(int line, int column) {
		 
		 if(line<=0)
			 throw new InvalidCursorException("line ="+line+"은 허용되지 않습니다.");
		 
		 if(line<=0)
			 throw new InvalidCursorException("column="+column+"은 허용되지 않습니다.");
		 System.out.printf("\033[%d;%dH",line,column);
	 }
     //30-37
	 public static void setForeground(int fg) {
		 System.out.printf("\033[%dm",fg);
	 }
	 
	 //Color는 enum 클래스이므로 정수타입이 아니다. 
	 // ordinal() 메소드를 써서 정수타입으로 바꿔야 한다. 
	 public static void setForeground(Color fg) {
		 System.out.printf("\033[%dm",fg.ordinal()+30);
	 }
	 
	 
	 //40-47
	 public static void setBackground(int bg) {
		 System.out.printf("\033[%dm",bg);
	 }
	 
	 public static void setBackground(Color bg) {
		 System.out.printf("\033[%dm",bg.ordinal()+40);
	 }
	 
	 public static void reset() {
		 System.out.print("\033[0m");
     }
	 
	 public static void print(char ch) {
		 System.out.print(ch);
		
	}
}
