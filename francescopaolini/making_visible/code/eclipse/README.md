_(...in progress)_  
[Processing](https://processing.org/tutorials/eclipse/) — tutorial

```java
import processing.core.PApplet;  
public class UsingProcessing extends PApplet{  
    public static void main(String[] args) {  
        PApplet.main("UsingProcessing");  
    }

    public void settings(){
        size(300,300);
    }

    public void setup(){
        fill(120,50,240);
    }

    public void draw(){
        ellipse(width/2,height/2,second(),second());
    }
    }
```  

![01](http://i.imgur.com/NUs4eXx.jpg)
