#include <bits/stdc++.h>
using namespace std;
#define fio ios_base::sync_with_stdio(false); cin.tie(nullptr)
#define newln "\n"
#define CODE_PATH  "/home/sourav/Documents/code/"
#define INPUT_FILE CODE_PATH"input.txt"
#define OUTPUT_FILE CODE_PATH"output.txt"
#define ERR_FILE CODE_PATH"err.txt"
#define fixed(n) fixed << setprecision(n)
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
#define emb emplace_back
#define emp emplace
#define all(x) (x).begin(), (x).end() //Forward traversal
#define rall(x) (x).rbegin, (x).rend() //reverse traversal
#define max(a, b) (a < b ? b : a) 
#define min(a, b) ((a > b) ? b : a) 
#define debug(x) cout<<newln<< #x <<" = "<<x<<endl;
#define debug2(x,y) cout<<newln<< #x <<" = "<<x<<", "<< #y <<" = "<<y<<endl;
#define mod (1e9 + 7)
#define PI 3.1415926535897932384626433832795

template<typename t>
ostream& operator<<(ostream& print,const vector<t> vec) {
    print<<newln<<"{";
    for(auto ele:vec) print<<ele<<", ";
    print<<"} "<<newln;
    return print;
}


class Solution {

    private:
    
        void solveSub(string s, string t) {
            vector<int> freq(26,0);
            int n = s.length();
            int m = t.length();
            for(auto ch:s) {
                if(ch>='a' && ch<='z') {
                    int x = ch-'a';
                    freq[x]++;
                }
            }

            int i = 0,j = 0;

            while(i<n) {

                char req = t[j];
                //cout<<"req= "<<req<<endl;
                //cout<<s<<endl;
                while(i<n && s[i]!=req && i<n && s[i]!='?') {
                    freq[s[i]-'a']--;
                    i++;
                }
                
                if(i>=n) {
                    cout<<"NO\n";
                    return;
                }
                else if(s[i]=='?') {
                    s[i] = req;
                    i++;j++;
                    if(j>=m) {
                        break;
                    }
                }
                else {

                    freq[req-'a']--;
                    i++;j++;
                    if(j>=m) {
                        cout<<"YES\n";
                        break;
                    }
                }
            }

            for(int i = 0;i<n;i++) {
                if(s[i]=='?') {
                    s[i]='a';
                }
            }
            cout<<s<<endl;
        }


    public:
        
        void solve() {

            ll tc = 1;
            cin>>tc;
    
            while(tc--) {
                
                string s,t; cin>>s>>t;
                solveSub(s,t);

            }

        }

};



int main() {

    fio;

    #ifndef ONLINE_JUDGE  
        freopen(INPUT_FILE, "r", stdin); 
        //freopen(ERR_FILE, "w", stderr); 
        //freopen(OUTPUT_FILE, "w", stdout); 
    #endif 
    
    Solution sol;
    sol.solve();

    return 0;
}