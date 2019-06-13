// import UDP library
import hypermedia.net.*;


UDP udp;  // define the UDP object

int QSIZE = 100;
int qsize = 0;
int qhead = 0;
object[] queue = new object[QSIZE];

int[] bgcolor = {255,255,255};

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
  if( qsize > 0 ){
    object obj = deque();
    obj.display();
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
  enque(  new object( q[0] , args ) );
  
  // print the result
  // println( "receive: \""+message+"\" from "+ip+" on port "+port );
}

// Queue Ring Buffer Management
void enque( object obj ){
  if( qsize < QSIZE ){
    queue[ ( qhead + qsize ) % QSIZE ] = obj;
    qsize++;
  }else {
    println( "queue overflow: Cannot enque " + obj );
  }
}


object deque(){
  if( qsize > 0 ){
    object obj = queue[qhead];
    qhead = (qhead + 1) % QSIZE;
    qsize--;
    return obj;
  }else {
    return null;
  }
}
