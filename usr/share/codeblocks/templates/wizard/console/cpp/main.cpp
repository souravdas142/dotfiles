#include<bits/stdc++.h>
using namespace std;
#define fio ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL)
#define ull unsigned long long
#define ll long long
#define dd double
#define pii pair<int, int>
#define pll pair<long, long>
#define vi vector<int>
#define vl vector<long>
#define vll vector<ll>
#define vvi vector<vi >
#define vvl vector<vl >
#define vvll vector<vll >
#define vpii vector<pii >
#define vpll vector<pll >
#define fr(i,a,b) for(ll i=a;i<b;i++)
#define frr(i,a,b) for(ll i=a-1;i>=b;i--)
#define tr(it,a) for(auto it=a.begin();it!=a.end();it++)
#define sz(a) (ll)((a).size())
#define pb push_back
#define fi first
#define se second
#define all(x) (x).begin(), (x).end() //Forward traversal
#define rall(x) (x).rbegin, (x).rend() //reverse traversal
#define max(a, b) (a < b ? b : a) 
#define min(a, b) ((a > b) ? b : a) 
#define mod 1e9 + 7 
#define PI 3.1415926535897932384626433832795


ull moduloExp(ull base, ull exp, ull Mod=mod){
	if(exp==0 || base==1) return ( 1 % Mod);
	ull ans=moduloExp(base,exp>>1,Mod);
	ans=((ans % Mod) * (ans % Mod)) % Mod;
	if(exp&1)
	ans=((ans %Mod) * (base % Mod)) % Mod;
	return ans;
}

void solve(){

}

int main(){
	fio;
	
	ll tc;
//	tc=1;
	cin>>tc;
	while(tc--){
		solve();
	}

	return 0;
}

