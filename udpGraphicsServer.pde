// import UDP library
import hypermedia.net.*;


UDP udp;  // define the UDP object

ArrayList<object> buffer = new ArrayList<object>();


/**
 * init
 */
void setup() {
  udp = new UDP( this, 10000 );
  udp.listen( true );
  size( 800 , 800 );
  background( 255 );
  rectMode( CENTER );
}

void draw() {
  for( int i = 0 ; i < buffer.size() ; i++ ){
    if( !buffer.get(i).drawn ){
      buffer.get(i).display();
    }
  }
  for( int i = 0 ; i < buffer.size() ; i++ ){
    if( buffer.get(i).drawn ){
      buffer.remove(i);
      break;
    }
  }
}


void receive( byte[] data, String ip, int port ) {
  data = subset(data, 0, data.length);
  String message = new String( data );
  String[] q = splitTokens( message , ", " );
  
  int[] args = new int[ q.length - 1 ];
  for( int i = 0 ; i < q.length -1 ;i++ ){
    args[i] = int( q[i+1] );
  }
  buffer.add(new object( q[0] , args ));
  
  // print the result
  // println( "receive: \""+message+"\" from "+ip+" on port "+port );
}
