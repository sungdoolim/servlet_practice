//2015112120 임성두
/*
2-3)
BruteForceChange ( M, c, d ){ 		  //M은 맞춰야하는 수, c는 M을 구성하기 위한 수가 저장된 배열, d는 c배열의 크기  입니다.

 	for(i=0 to d;i++){k[i]=M/c[i];}  // 나눈 몫을 k[i]배열에 모두 저장하는데 정수형으로 저장합니다.
 	
 	result=k[4];					// 최대의 많은 빈도를 가지게 되는 값을 일단 result에 초기 값으로 줍니다.
 	
 	 for each (k[0] , k[1] , … , k[d-1] ) from (0,…,0) to (M/c[10],…,M/c[d-1])
 	{ 
 	
 		valueOfCoin=c[0]*q+c[1]*w+c[2]*e+c[3]*r+c[4]*t;  // M을 구성하게 되는 모든 경우의 수를 전부 구해봅니다. 
							if(valueOfCoin==M) {		// 구한 값이 M 과 같다면,
								sum=q+w+e+r+t;  		// sum이라는 변수에 q,w,e,r,t의 합을 저장합니다
														//q,w,e,r,t는 각각 c배열 인덱스에 해당하는 값을 사용한 빈도수라고 할 수 있습니다.
								if(result>sum) {		// result의 값은 가장 작은 값을 선택하는 것이므로,
									result=sum; 		// result보다 작은 경우에만 result에 저장합니다
								}
							}
 	
 		return result;
 	}
 	
 	

}
*/
package week1;

public class no2_4{
	public static void main(String[] args) {

		int M=40;
		int []c= {25,20,10,5,1};
		int []k= {0,0,0,0,0};// 나눗셈의 몫을 저장할 배열로 모두 0으로 초기화 했습니다
		int d=c.length;
		for(int i=0;i<d;i++) {
			k[i]=M/c[i];
		}
		int valueOfCoin=0;
		int result=k[4];
		int sum=0;
		
		for(int q=0;q<=k[0];q++) {
			for(int w=0;w<=k[1];w++) {
				for(int e=0;e<=k[2];e++) {
					for(int r=0;r<=k[3];r++) {
						for(int t=0;t<=k[4];t++) {
							valueOfCoin=c[0]*q+c[1]*w+c[2]*e+c[3]*r+c[4]*t;
							if(valueOfCoin==M) {
								sum=q+w+e+r+t;
								if(result>sum) {
									result=sum;
								}
							}

						}
					}
				}
			}
		}
		
		System.out.println(result);
		
	}

}
