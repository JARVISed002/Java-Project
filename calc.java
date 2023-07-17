import java.awt.*;
import java.awt.event.*;
import java.applet.*;
import javax.swing.*;

class Calculator extends JFrame {
	Container c;
	JTextField T1;
	JButton b1, b2, b3, b4, b5, b6, b7, b8, b9, b0, ba, bm, bd, bmu, bc, be,bdot,bp,bb,b;
	JPanel nPanel, cPanel;
	double first;
	double second;
	double result;
	String operation;
	String answer;

	Calculator() {

		setTitle("Calc");
		setBounds(600, 300, 645, 470);
		setLayout(null);
		

		c = getContentPane();

		JPanel nPanel = new JPanel();
		T1 = new JTextField(30);

		Font fo = new Font("Serif", Font.BOLD, 20);
        	T1.setFont(fo);
 

		nPanel.setLayout(new FlowLayout());
		nPanel.add(T1);
		//nPanel.setBackground(Color.white);
		nPanel.setBounds(70, 30, 500, 40);
		c.add(nPanel);

		JPanel cPanel = new JPanel();

		b1 = new JButton("1");
		b2 = new JButton("2");
		b3 = new JButton("3");
		b4 = new JButton("4");
		ba = new JButton("+");
		b5 = new JButton("5");
		b6 = new JButton("6");
		b7 = new JButton("7");
		bm = new JButton("−");
		b8 = new JButton("8");
		b9 = new JButton("9");
		b0 = new JButton("0");
		bmu = new JButton("×");
		bd = new JButton("÷");
		bc = new JButton("AC");
		be = new JButton("=");
		bdot = new JButton(".");
		bp = new JButton("%");
		bb = new JButton("<-");
		b = new JButton(""); 
		b.setBackground(Color.lightGray);

		cPanel.setLayout(new GridLayout(5, 4));
		cPanel.add(b1);
		cPanel.add(b2);
		cPanel.add(b3);
		cPanel.add(ba);
		cPanel.add(b4);
		cPanel.add(b5);
		cPanel.add(b6);
		cPanel.add(bm);
		cPanel.add(b7);
		cPanel.add(b8);
		cPanel.add(b9);
		cPanel.add(bmu);
		cPanel.add(bdot);
		cPanel.add(b0);
		cPanel.add(bd);
		cPanel.add(bb);
		cPanel.add(b);
		cPanel.add(bp);
		cPanel.add(bc);
		cPanel.add(be);
		

		cPanel.setBounds(70, 100, 500, 300);

		c.add(cPanel);

	
		  b1.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                T1.setText(T1.getText() + "1");
     
            }
        });

        b2.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                T1.setText(T1.getText() + "2");
            }
        });

        b3.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
               T1.setText(T1.getText() + "3");
            }
        });

        b4.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
               T1.setText(T1.getText() + "4");
            }
        });

        b5.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                T1.setText(T1.getText() + "5");
            }
        });

        b6.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
               T1.setText(T1.getText() + "6");
            }
        });

        b7.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
               T1.setText(T1.getText() + "7");
            }
        });

        b8.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                T1.setText(T1.getText() + "8");
            }
        });

        b9.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                T1.setText(T1.getText() + "9");
            }
        });

        b0.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                T1.setText(T1.getText() + "0");
            }
        });

	 bc.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                T1.setText("");
            }
        });
	
	 ba.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
		try{
		first = Double.parseDouble(T1.getText());
		T1.setText("");
		operation = "+";
		}catch(Exception e){
			JOptionPane.showMessageDialog(c,"Invalid Input");
		}
            }
        });
	
	 bm.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                try{
		first = Double.parseDouble(T1.getText());
		T1.setText("");
		operation = "-";
		}catch(Exception e){
			JOptionPane.showMessageDialog(c,"Invalid Input");
		}
            }
        });

	 bmu.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                try{
		first = Double.parseDouble(T1.getText());
		T1.setText("");
		operation = "*";
		}catch(Exception e){
			JOptionPane.showMessageDialog(c,"Invalid Input");
		}
            }
        });

	 bd.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
		try{
		first = Double.parseDouble(T1.getText());
		T1.setText("");
		operation = "÷";
		}catch(Exception e){
			JOptionPane.showMessageDialog(c,"Invalid Input");
		}
            }
        });

	 bdot.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
                T1.setText(T1.getText() + ".");
            }
        });

	 bp.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
               try{
		first = Double.parseDouble(T1.getText());
		T1.setText("");
		operation = "%";
		}catch(Exception e){
			JOptionPane.showMessageDialog(c,"Invalid Input");
		} 
            }
        });

	 be.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {
               
		try{
		String answer;
		second = Double.parseDouble(T1.getText());
		if(operation == "+")
		{
			result = first + second;
			answer = String.format("%.2f" , result);
			T1.setText(answer);
		}
		else if(operation == "-")
		{
			result = first - second;
			answer = String.format("%.2f" , result);
			T1.setText(answer);
		}
		else if(operation == "*")
		{
			result = first*second;
			answer = String.format("%.2f" , result);
			T1.setText(answer);
		}
		else if(operation == "÷")
		{
			result = first/second;
			answer = String.format("%.2f" , result);
			T1.setText(answer);
		}
		else
		{
			result = first%second;
			answer = String.format("%.2f" , result);
			T1.setText(answer);
		}

		}catch(NumberFormatException e){
			JOptionPane.showMessageDialog(c,"Invalid Input");
			T1.setText("");
			T1.requestFocus();
		}
            }
        });
	
	 bb.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent ae) {


        String currentText = T1.getText();   
        if (!currentText.isEmpty()) {
            int length = currentText.length();
            String updatedText = "";

            if (length > 1) {
                String lastChar = currentText.substring(length - 1);
                String secondLastChar = currentText.substring(length - 2, length - 1);

                if (lastChar.matches("[+\\-*/%]") && secondLastChar.matches("[+\\-*/%]")) {
                    updatedText = currentText.substring(0, length - 2);
                } else {
                    updatedText = currentText.substring(0, length - 1);
                }
            } else {
                updatedText = "";
            }

            T1.setText(updatedText);
        }

            }
        });
	
	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	setLocationRelativeTo(null);
	setVisible(true);
	
	}
}

class P2 {
	public static void main(String args[]) {
		new Calculator();
	}
}
