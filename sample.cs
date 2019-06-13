using System;
using System.Threading;

class test {
	static void Main(string[] args){
		graph g = new graph();

		/*
		System.Random r = new System.Random();
		for( int i = 0 ; i < 10000 ; i++ ){
			//g.line( r.Next(800),r.Next(800), r.Next(800),r.Next(800) );
			g.pset( r.Next(800),r.Next(800) );
		}
		*/
		for( int i = 0 ; i < 800 ; i++ ){
			g.pset( i , i );
		}
		g.lcolor( 0 , 0 , 0 );
		for( int i = 0 ; i < 800 ; i += 10 ){
			g.pcolor( i % 255 , 0 , 0 );
			g.rect( i , i , 100 , 100 );
		}
		g.lcolor( 0 , 255 , 255 );
		for( int i = 0 ; i < 800 ; i += 10 ){
			g.pcolor( 0 , i % 255 , 0 );
			g.oval( i , 400 , 100 , 100 );
		}
		g.lcolor( 255 , 0 , 0 );
		for( int i = 0 ; i < 800 ; i += 10 ){
			g.pcolor( 0 , 0 , i % 255);
			g.rect( i , 800-i , 100 , 100 );
		}
	}
}


class graph {
	string host = "127.0.0.1";
	int    port = 10000;
	System.Net.Sockets.UdpClient udp;
	
	public graph(){
		udp = new System.Net.Sockets.UdpClient();
		reset();
	}
	~graph(){
		udp.Close();
	}
	void sendMsg(string msg){
		byte[] sendBytes = System.Text.Encoding.UTF8.GetBytes(msg);
		udp.Send(sendBytes, sendBytes.Length, host, port);
		Thread.Sleep(10);
	}
	public void clear(){sendMsg( string.Format( "clear" ));}
	public void reset(){sendMsg( string.Format( "reset" ));}
	public void pset( int x , int y ){sendMsg( string.Format( "pset {0} {1}" , x , y ));}
	public void line( int x1 , int y1 , int x2 , int y2 ){sendMsg( string.Format( "line {0} {1} {2} {3}" , x1 , y1 , x2 , y2 ));}
	public void rect( int x , int y , int w , int h ){sendMsg( string.Format( "rect {0} {1} {2} {3}" , x , y , w , h ));}
	public void oval( int x , int y , int w , int h ){sendMsg( string.Format( "oval {0} {1} {2} {3}" , x , y , w , h ));}	
	public void bgcolor( int r , int g , int b ){sendMsg( string.Format( "bgcolor {0} {1} {2}" , r , g , b ));}
	public void pcolor( int r , int g , int b ){sendMsg( string.Format( "pcolor {0} {1} {2}" , r , g , b ));}
	public void lcolor( int r , int g , int b ){sendMsg( string.Format( "lcolor {0} {1} {2}" , r , g , b ));}
}
