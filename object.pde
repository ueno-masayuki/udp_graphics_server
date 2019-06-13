class object {
  String op;
  int[] args;
  boolean drawn = false;

  object( String _op , int _args[] ){
    op = _op;
    args = _args;
  }
  
  void display(){
    //print( "*" );
    if( op.equals( "pset" )){
      point( args[0] , args[1] );
    }else if( op.equals( "line" ) ){
      line( args[0] , args[1] , args[2] , args[3] );
    }else if( op.equals( "rect" ) ){
      rect( args[0] , args[1] , args[2] , args[3] );
    }else if( op.equals( "oval" ) ){
      ellipse( args[0] , args[1] , args[2] , args[3] );
    }else if( op.equals( "pcolor" ) ){
      fill( args[0] , args[1] , args[2] );
    }else if( op.equals( "lcolor" ) ){
      stroke( args[0] , args[1] , args[2] );
    }else if( op.equals( "bgcolor" ) ){
      bgcolor[0] = args[0];
      bgcolor[1] = args[1];
      bgcolor[2] = args[2];
      background( bgcolor[0], bgcolor[1], bgcolor[2] );
    }else if( op.equals( "clear" )){
      background( bgcolor[0], bgcolor[1], bgcolor[2] );
    }else if( op.equals( "reset" )){
      bgcolor[0] = 255;
      bgcolor[1] = 255;
      bgcolor[2] = 255;
      fill( 255, 255, 255 );
      stroke( 0, 0, 0 );
      background( 255 );
    }
    drawn = true;
  }
}
