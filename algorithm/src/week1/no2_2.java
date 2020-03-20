//2015112120 임성두
/*
2-1)
GreedyBetterChange ( M, c, d ) //M은 맞춰야하는 수, c는 M을 구성하기 위한 수가 저장된 배열, d는 c배열의 크기  입니다.
{ 

	for (i=0 to d; i+=1){    //d번 반복
	k[i]=M/c[i]		//나눈 몫을 저장합니다, 특히 int 형으로 계산 하여 정수를 저장합니다
	M-=k[i]*c[i]    // M에서 c[i]로 뺄수있는 최대로 빼는 것 입니다.
	 
	}return sum(k)    // k배열의 값들을 모두 더한것을 결과로 리턴합니다.

}

*/
package week1;

public class no2_2{
	public static void main(String[] args) {

		int M=40;
		int []c= {25,20,10,5,1};
		int []k= {0,0,0,0,0};// 나눗셈의 몫을 저장할 배열로 모두 0으로 초기화 했습니다
		int result=0;// c배열을 요소 얼마나 많이 사용해야 M을 만들수 있는지에 대한 결과 값입니다.
		int d=c.length;
		for(int i=0;i<d;i++) {
			k[i]=M/c[i];// 몫을 구해 저장한 후,
			M-=k[i]*c[i];// M에서 M에서 c[i]로 뺄수있는 최대로 빼는 것 입니다.
			result+=k[i];// result는 k배열의 합입니다.
		}
		System.out.println(result);
		

	}

}
