class UserInput{
  PFont font;
  String lastWord, activeWord;
  
  UserInput(){
    font = createFont("Arial-ItalicMT-48.vlw", 32);
    activeWord = " ";
  }
  
  void draw(){
    fill(0);
    textSize(48);
    textFont(font);
    textAlign(CENTER);
    text(activeWord,width/2, height/2);
  }
  
  void addChar(char input){
    activeWord += input;
  }
  
  public class CheckWord extends InstantCommand{
    private ObjectHandler objectHandler;
    public CheckWord(ObjectHandler objectHandler){
      super();
      this.objectHandler = objectHandler;
    }
    public void run(){
      lastWord = activeWord;
      activeWord = " ";
      objectHandler.checkZombies(lastWord);
    }
    
  }
  
}
