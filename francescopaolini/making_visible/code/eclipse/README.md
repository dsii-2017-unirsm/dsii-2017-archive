_(...in progress)_  

[Eclipse](https://www.eclipse.org/) è un progetto originariamente creato da IBM nel novembre 2001. È una comunità per gli individui e le organizzazioni che desiderano collaborare su software open source. Eclipse è un editor multi-linguaggio e multipiattaforma. Esso viene utilizzato comunemente per la compilazione e l'esecuzione dei programmi Java, ha numerosi vantaggi nella relazione del programma: riconosce dove sono gli errori, individua le variabili non utilizzate, ha delle funzioni di debug, ecc... [download — eclipse](https://www.eclipse.org/downloads/)  

[Processing — tutorial](https://processing.org/tutorials/eclipse/)

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
