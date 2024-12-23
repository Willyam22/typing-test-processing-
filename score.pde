public class score{
  private int right;
  private int wrong;
  private double accuracy;
  private int wpm;
  private boolean s = true;
  
  public score(int right, int wrong){
    this.right = right;
    this.wrong = wrong;
    accuracy();
    wpm();
  }
  
  void accuracy(){
    this.accuracy = ((double)this.right/((double)this.right + (double)this.wrong )) * 100;
  }
  
  void wpm(){
    this.wpm = this.right + this.wrong;
  }
  
  //void hit(){
  //  println(right);
  //  println(wrong);
  //}
  
  public void resetScore() {
    this.right = 0;
    this.wrong = 0;
    accuracy();
    wpm();
  }
  
  double getAccuracy() {
    return accuracy;
  }

  int getWPM() {
    return wpm;
  }
  
  int getRight(){
    return right;
  }
  
  int getWrong(){
    return wrong;
  }
}
