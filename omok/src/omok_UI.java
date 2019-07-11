import java.awt.Container;

import javax.swing.JFrame;
import javax.swing.JOptionPane;


public class omok_UI extends JFrame{
	private Container c;
	MapSize size = new MapSize();
	
	public omok_UI(String title){
		c=getContentPane();
		setBounds(200,20,650,700);
		setTitle(title);
		c.setLayout(null);
		Map map = new Map(size);
		DrawBoard d = new DrawBoard(size,map);
		setContentPane(d);
		addMouseListener(new MouseEventHandler(map,size,d,this));
		setVisible(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	public void showPopUp(String message){
		JOptionPane.showMessageDialog(this, message,"",JOptionPane.INFORMATION_MESSAGE);;
		System.exit(0);
	}
	public static void main(String[] args){
		new omok_UI("오목");
	}
}
