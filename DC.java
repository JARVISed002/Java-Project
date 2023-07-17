import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.Calendar;
import java.text.SimpleDateFormat;

class Clock extends JFrame
{
  Container c;
  SimpleDateFormat timeFormat;
  JLabel labText,labClock;
  
  Clock()
  {
    c = getContentPane();
    c.setLayout(new FlowLayout());

    labText = new JLabel("Time :");   
    labClock = new JLabel("");

    Font f = new Font("Arial", Font.BOLD + Font.ITALIC,40);
    Font fa = new Font("Arial", Font.BOLD + Font.PLAIN,40);  
    
    labClock.setForeground(Color.RED);
    labClock.setOpaque(true);
    labText.setFont(f);
    
    labText.setForeground(Color.BLUE);
    labClock.setFont(fa);
    
    c.add(labText);
    c.add(labClock);
    c.setBackground(Color.BLACK);  
 
    setTitle("Digital Watch");
    setSize(600,600);
    setLocationRelativeTo(null);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    setVisible(true);

    timeFormat = new SimpleDateFormat("hh:mm:ss a");

    setTime();
  }

    public void setTime()
    {
      while(true)
      {
        String time = timeFormat.format(Calendar.getInstance().getTime());
        labClock.setText(time);

        try
        {
          Thread.sleep(1000);
        }
        catch(Exception e)
        {
          System.out.println("issue" + e);
        }
      }
    }
}

class P1
{
  public static void main(String args[])
  { 
    Clock cl = new Clock();
  }
}