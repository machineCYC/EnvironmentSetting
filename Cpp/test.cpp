#include <iostream>
#include <string>
#include <cmath>
using namespace std;

void t2h(string input);
int h2t(string input);
char returnAE(int input);
int AEreturn(char input);
int string2int(string input);

int main(void){
	string input;
	string number;

	cout << "Tell me what you want to do:\n";
	cout << "(1)T to H (2)H to T\n";
	cin >> input;
	if (input.length()>1){
		cout << "Wrong input\n";
	}else{
		switch (input[0]) {
			case '1':
				cout << "Please input the number:";
				cin >> number;
				t2h(number);
				break;
			case '2':
				cout << "Please input the number:";
				cin >> number;
				cout << h2t(number) << endl;
				break;
			default:
				cout << "Wrong input"<<endl;
		}
	}
	return 0;
}

int h2t(string input){
	int output = 0;
	int i = 0;
	while (i < input.length()){
		output = output + AEreturn(input[i])*pow(16,input.length()-i-1);
		i++;
	}
	return output;
}

int AEreturn(char input){
	switch (input){
		case  'A':
			return 10;
		case  'B':
			return 11;
		case  'C':
			return 12;
		case  'D':
			return 13;
		case  'E':
			return 14;
		case  'F':
			return 15;
		default:
			return input-'0';
	}
}

void t2h(string input){
	int number = string2int(input);
	for (int i = 0;i<16;i++){
		for (int j=0;j<16;j++){
			for (int k=0;k<16;k++){
				if ( pow(16.0,2.0)*i+pow(16.0,1.0)*j+pow(16.0,0.0)*k == number){
					cout << returnAE(i) << returnAE(j) <<returnAE(k) <<endl;
			 	}
			}
		}
	}
}

char returnAE(int input){
	switch (input){
		case 10:
			return 'A';
		case 11:
			return 'B';
		case 12:
			return 'C';
		case 13:
			return 'D';
		case 14:
			return 'E';
		case 15:
			return 'F';
		default :
			return input + '0';
	}
}

int string2int(string input){ //字串轉型工具
	int output = 0;
	for (int i= 0;i<input.length();i++){
		int temp = input[i]-'0';
		output = output + temp*pow(10.0,input.length()-i-1);
	}
	return output;
}