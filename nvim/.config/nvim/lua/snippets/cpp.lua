local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
    s("tm", {
        t({
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "#define int long long",
            "",
            "void solve(){",
            "    "
        }),
        i(0),
        t({
            "",
            "}",
            "int32_t main(){",
            "    ios::sync_with_stdio(0);cin.tie(nullptr);",
            "    int t=1;",
            "    cin>>t;"
        }),
        i(1),
        t({
            "",
            "    while(t--) solve();",
            "}",
            "/*",
            "",
            "*/"
        })
    }),

    s("us", {
        t({
            "/*",
            "ID: rohanda3",
            "TASK: "
        }),
        i(1),
        t({
            "",
            "LANG: C++",
            "*/",
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "#define int long long",
            "",
            "void solve(){",
            "    "
        }),
        i(0),
        t({
            "",
            "}",
            "int32_t main(){",
            "    ios::sync_with_stdio(0);cin.tie(nullptr);",
            "    int t=1;",
            "    // freopen(\""
        }),
        i(1),
        t({
            ".in\",\"r\",stdin);",
            "    // freopen(\""
        }),
        i(1),
        t({
            ".out\",\"w\",stdout);",
            "    // cin>>t;",
            "    while(t--) solve();",
            "}",
            "/*",
            "",
            "*/"
        })
    }),

    s("bix", {
        t({
            "int po(int a, int b){int k=1;while(b){if(b&1)k*=a;a*=a;b>>=1;}return k;}",
            "int pom(int a, int b){int k=1;while(b){if(b&1)k=k*a%mod;a=a*a%mod;b>>=1;}return k;}"
        })
    }),

    s("segt", {
        t({
            "template<typename T>",
            "class segtree{",
            "public:",
            "    v<T> t;",
            "    int n;",
            "    T idn;",
            "    segtree(v<T> &a,T idn):idn(idn){",
            "        n=a.size();",
            "        t.assign(4*n,idn);",
            "        for(int i=0; i<n; i++) set(i,a[i]);",
            "    }",
            "    T merge(T a,T b){",
            "        return "
        }),
        i(0),
        t({
            "",
            "    }",
            "    int query(int l,int r){",
            "        function<T(int,int,int)> f=[&](int tid,int tl,int tr)->T {",
            "            if(l>tr || r<tl) return idn;",
            "            if(l<=tl && r>=tr) return t[tid];",
            "            int tm=(tl+tr)/2;",
            "            return merge(f(2*tid+1,tl,tm),f(2*tid+2,tm+1,tr));",
            "        };",
            "        return f(0,0,n-1);",
            "    }",
            "    void set(int id,T val){",
            "        function<void(int,int,int)> f=[&](int tid,int tl,int tr){",
            "            if(tl==tr){",
            "                t[tid]=val;",
            "                return;",
            "            }",
            "            int tm=(tl+tr)/2;",
            "            if(id<=tm) f(2*tid+1,tl,tm);",
            "            else f(2*tid+2,tm+1,tr);",
            "            t[tid]=merge(t[2*tid+1],t[2*tid+2]);",
            "        };",
            "        f(0,0,n-1);",
            "    }",
            "};"
        })
    }),

    s("4d", {
        t({
            "const int dx[4]={1,0,-1,0};",
            "const int dy[4]={0,-1,0,1};"
        })
    }),

    s("8d", {
        t({
            "const int dx[8]={1,1,0,-1,-1,-1,0,1};",
            "const int dy[8]={0,-1,-1,-1,0,1,1,1};"
        })
    }),

    s("isk", {
        t({
            "bool isk("
        }),
        i(1),
        t({
            " &a, int i, int j){",
            "    return i>=0 && i<a.size() && j>=0 && j<a[0].size()"
        }),
        i(2),
        t({
            ";",
            "}"
        }),
        i(0)
    }),

    s("dfs", {
        t({
            "void dfs("
        }),
        i(1),
        t({
            " &a, int x, int y){",
            "    isv[x][y]=1;",
            "    for(int d=0; d<"
        }),
        i(2),
        t({
            "; d++){",
            "        int nx=x+dx[d];",
            "        int ny=y+dy[d];",
            "        if(isk(a,nx,ny) && !isv[nx][ny] && a[nx][ny]=="
        }),
        i(3),
        t({
            ") dfs(a,nx,ny);",
            "    }",
            "    }"
        }),
        i(0)
    }),

    s("nx", {
        t({
            "int nx=x+dx[d];",
            "int ny=y+dy[d];"
        })
    }),

    s("btm", {
        t({
            "#include <bits/stdc++.h>",
            "using namespace std;",
            "#define int long long",
            "",
            "bool solve(){",
            "    "
        }),
        i(0),
        t({
            "",
            "}",
            "int32_t main(){",
            "    ios::sync_with_stdio(0);cin.tie(nullptr);",
            "    int t=1;",
            "    cin>>t;"
        }),
        i(1),
        t({
            "",
            "    while(t--) cout<<(solve()?\"Yes\\n\":\"No\\n\");",
            "}",
            "/*",
            "",
            "*/"
        })
    }),

    s("seev", {
        t({
            "vi primes;",
            "const int M=1e6+1;",
            "bitset<M> isPrime;",
            "void seev(){",
            "    isPrime.set();",
            "    for(int i=2; i<M; i++){",
            "        if(isPrime[i]){",
            "            primes.pb(i);",
            "            for(int j=i*i; j<M; j+=i) isPrime[j]=0;",
            "        }",
            "    }",
            "}"
        })
    }),

    s("ncr", {
        t({
            "auto ncr=[](int n, int r){",
            "    if(r<0 || r>n) return 0ll;",
            "    r=min(r,n-r);",
            "    int ans=1;",
            "    for(int i=0; i<r; i++) ans*=n-i,ans/=i+1;",
            "    return ans;",
            "};"
        })
    }),

    s("deb", {
        t({
            "#define deb(...) _print(#__VA_ARGS__, __VA_ARGS__);",
            "template<typename F,typename S>ostream& operator<<(ostream& os,const pair<F,S>& p){return os<<p.first<<' '<<p.second;}",
            "template<typename F,typename S>istream& operator>>(istream& is,pair<F,S>& p){return is>>p.first>>p.second;}",
            "template<typename T>istream& operator>>(istream& is, vector<T>& v){for(auto&x:v)is>>x;return is;}",
            "template<typename T>ostream& operator<<(ostream& os, vector<T>& v){for(auto&x:v)os<<x<<' ';return os;}",
            "template<typename T>ostream& operator<<(ostream& os, set<T>& s){for(auto&x:s)os<<x<<' ';return os;}",
            "template<typename T>ostream& operator<<(ostream& os, vector<vector<T>>& v){os<<'\\n';for(auto&i:v)os<<i<<'\\n';return os;}",
            "template<typename K,typename V>ostream& operator<<(ostream& os,map<K,V>& m){os<<'\\n';for(auto&[k,v]:m)os<<k<<\" -> \"<<v<<'\\n';return os;}",
            "template<typename T,typename... Args>void _print(string s,T v,Args... args){size_t c=s.find(',');cout<<s.substr(0,c)<<\" = \"<<v<<'\\n';if constexpr(sizeof...(args)>0){_print(s.substr(c+1),args...);}}"
        })
    })
})
