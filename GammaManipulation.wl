(* ::Package:: *)

(* ::Input::Initialization:: *)
<<Gamma.m;


(* ::Input:: *)
(*<<xAct`xTensor`*)


(* ::Input::Initialization:: *)
SetDim[10];
SetSpinorDim[16];
DefManifold[M3,11,{a,b,c,d,e,f}];
DefMetric[-1,g[-a,-b ],CD,{";","\[Del]"}];
DefTensor[gamma[ ],M3,PrintAs->"\[CapitalGamma]"];


(* ::Subtitle::RGBColor[1, 0, 0]:: *)
(*Naito 1986- Gamma identities expansion*)


(* ::Text:: *)
(*Equation No. (1.4)*)
(*If j=2, k=2*)


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{a1,a2},{b1,b2}]]


(* ::Text:: *)
(*This show that the product between Gamma's is antisymmetric, for this notation*)


(* ::Input::Initialization:: *)
GammaExpand[ASym[GammaProd[{a1,a2},{b1,b2}],{b1,b2}]]


(* ::Text:: *)
(*If j = 3, k=3*)


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{a1,a2,a3},{b1,b2,b3}]]


(* ::Text:: *)
(*If j = 10, k = 10*)


(* ::Input::Initialization:: *)
GammaExpand[
GammaProd[
{a1,a2,a3,a4,a5,a6,a7,a8,a9,a10},
{b1,b2,b3,b4,b5,b6,b7,b8,b9,b10}]
]


(* ::Text:: *)
(*Now odd index *)


(* ::Text:: *)
(*If j = 1, k = 2*)


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{a1},{b1,b2}]]


(* ::Text:: *)
(*If j = 2, k = 5*)


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{a1,a2},{b1,b2,b3,b4,b5}]]


(* ::Text:: *)
(*If j=4, k=10*)


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{a1,a2,a3,a4},{b1,b2,b3,b4,b5,b6,b7,b8,b9,b10}]]


(* ::Text:: *)
(*Equation No. (1.5)*)


(* ::Text:: *)
(*d depend of setup dimension space SetDim[11] ,SetDim[10],... *)
(*j = 1,..n.*)


(* ::Input::Initialization:: *)
SetDim[10]
GammaExpand[GammaProd[{d}]**GammaProd[{d,a1,a2}]]


(* ::Text:: *)
(*Equation No. (1.6)*)
(*This notation not have account the permutations from the antisymmetric product*)
(*j = 1,..n.*)


(* ::Input::Initialization:: *)
GammaExpand[GammaExpand[GammaProd[{d}]**GammaProd[{a1,a2}]**GammaProd[{d}]]]


(* ::Text:: *)
(*Equation No. (1.7) j=2, k=2, m=1*)


(* ::Input::Initialization:: *)
ASym[GammaProd[{a2,a1}]GammaProd[{b1,b2},{a3,a4}],{a1,a2,a3,a4}]


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{a2,a1}]GammaProd[{b1,b2},{a3,a4}]]


(* ::Input::Initialization:: *)
ASym[GammaProd[{a1,a2}]**GammaProd[{a3,a4,a5},{b1,b2,b3}],{a1,a2,a3,a4,a5}]


(* ::Text:: *)
(*Equation No. (1.8), SetDim[11]*)


(* ::Input::Initialization:: *)
GammaExpand[
GammaProd[{a1,a2,a3,d1,d2,d3,d4,d5,d6,d7,d8}]**GammaProd[{d8,d7,d6,d5,d4,d3,d2,d1}]
]//GammaContract


(* ::Text:: *)
(*Equation No. (1.9), *)


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{h2,h1,f1,f2},{d7,d6,d5,d4,d3,d2,d1,e1}]GammaProd[{a1},{f2,f1}]GammaProd[{e1,d1,d2,d3,d4,d5,d6,d7}]]//GammaContract


(* ::Input::Initialization:: *)
ASym[GammaProd[{a2,f1,f2}]GammaProd[{d6,d5,d4,d3,d2,d1,d,e1}]GammaProd[{a1},{f2,f1}],{a1,a2,f1,f2}]


(* ::Text:: *)
(*Equation No. (2.4),*)


(* ::Input::Initialization:: *)
G[{0,0},{}]:=0;
G[{0},{0}]:=0;
G[{},{0,0}]:=0;
0**a_:=0;
a_**0:=0;
Unprotect[Subscript,NonCommutativeMultiply];
Clear[Subscript];
G[{},sub_List]:=0/;Fold[Or,Negative[sub]];
G[super_List,{}]:=0/;Fold[Or,Negative[super]];
G[super_List,sub_List]:=0/;(Fold[Or,Negative[super]]||Fold[Or,Negative[sub]] );
Format[G[super_List,sub_List]]:=Subscript[Superscript[\[CapitalGamma],super],sub];

Naito24try3[l_,m_,n_]:=Sum[Sum[(TensorSpinor[\[Psi],{}]**G[{},{i,j-i}]**TensorGamma[\[Psi],{}])**G[{j-i},{n-i}]Boole[j!=0]Boole[j!=3]Boole[j!=4],{j,0,m}],{i,0,l}];


(* ::Input::Initialization:: *)
Naito24try31[l_,m_,n_]:=Sum[Sum[Sum[(TensorSpinor[\[Psi],{}]**G[{},{i,j-i}]**TensorGamma[\[Psi],{}])**G[{j-i},{k-i}](-1)^j Boole[j!=0]Boole[j!=3]Boole[j!=4],{j,0,m}],{i,0,l}],{k,0,n}];


(* ::Input::Initialization:: *)
Naito24try31[1,1,2]


(* ::Input::Initialization:: *)
Naito24try4[l_,m_,n_]:=If[G[{0},{1}][[1]]===0,Sum[Sum[Sum[(TensorSpinor[\[Psi],{}]**G[{},{i,j-i}]**TensorGamma[\[Psi],{}])**G[{j-i},{k-i}](-1)^j Boole[j!=0]Boole[j!=3]Boole[j!=4],{j,0,m}],{i,0,l}],{k,0,n}],Sum[Sum[Sum[(TensorSpinor[\[Psi],{}]** G[{},{i,j-i}]**TensorGamma[\[Psi],{}])**G[{j-i},{k-i}](-1)^j Boole[j!=0]Boole[j!=3]Boole[j!=4],{j,0,m}],{i,0,l}],{k,0,n}]];


(* ::Input::Initialization:: *)
Naito24try5[l_,m_,n_]:=If[n>= 2,Sum[Sum[Sum[(TensorSpinor[\[Psi],{}]**G[{},{i,j-i}]**TensorGamma[\[Psi],{}])**G[{j-i},{k-i}](-1)^j Boole[j!=0]Boole[j!=3]Boole[j!=4],{j,0,m}],{i,0,l}],{k,0,n}],Sum[Sum[Sum[(TensorSpinor[\[Psi],{}]**G[{},{i,j-i}]**TensorGamma[\[Psi],{}])**G[{j-i},{k-i}](-1)^j Boole[j!=0]Boole[j!=3]Boole[j!=4],{j,0,m}],{i,0,l}],{k,0,n}]];


(* ::Input::Initialization:: *)
Naito24try6[l_,m_,n_]:=If[n>= 2,Sum[Sum[Sum[(TensorSpinor[\[Psi],{}]**G[{},{i,j-i}]**TensorGamma[\[Psi],{}])**G[{j-i},{k-i}](-1)^j Boole[j!=0]Boole[j!=3]Boole[j!=4],{j,0,m}],{i,0,l}],{k,0,n}],Sum[Sum[Sum[(TensorSpinor[\[Psi],{}]**G[{},{i,j-i}]**TensorGamma[\[Psi],{}])**G[{j-i},{k-i}](-1)^j Boole[j!=0]Boole[j!=3]Boole[j!=4],{j,0,m}],{i,0,l}],{k,0,n}]];


(* ::Input::Initialization:: *)
gamma[n_Integer]:=gamma@@Table[ToExpression["a"<>ToString[n-i+1]],{i,n}]/;n>0;
gamma[n_Integer]:=gamma@@Table[ToExpression["-a"<>ToString[i]],{i,-n}]/;n<0;
gamma[0]:=1;


(* ::Input::Initialization:: *)
GenerateIterVar[var_String,n_Integer]:=Table[ToExpression[var<>ToString[i]],{i,n}]/;n>0;
TraceGP[n_Integer]:=Module[{a=Reverse@GenerateIterVar["a",n],b=GenerateIterVar["b",n]},
GammaTrace[GammaProd[a,b]]
]/;n>0;


(* ::Section:: *)
(*Naito Coefficients equation (2.4)*)


(* ::Text:: *)
(*(n-2j) for a1, we had seen that this coefficients only get one index, no more.*)


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta]}]**GammaProd[{a1}]**GammaProd[{\[Beta]}]]//GammaContract


(* ::Text:: *)
(* [(n - 2 j)^2-n] for a1,a2. Amount indexes 2, no more.*)


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma]}]**GammaProd[{a1}]**GammaProd[{\[Gamma],\[Beta]}]]//GammaContract


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma]}]**GammaProd[{a1,a2}]**GammaProd[{\[Gamma],\[Beta]}]]//GammaContract


(* ::Text:: *)
(* (n - 2j)[(n - 2j)^2 - 3n+2] for a1, a2, a3. Amount indexes 3, no more.*)


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma],\[Delta]}]**GammaProd[{a1}]**GammaProd[{\[Delta],\[Gamma],\[Beta]}]]//GammaContract


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma],\[Delta]}]**GammaProd[{a1,a2}]**GammaProd[{\[Delta],\[Gamma],\[Beta]}]]//GammaContract


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma],\[Delta]}]**GammaProd[{a1,a2,a3}]**GammaProd[{\[Delta],\[Gamma],\[Beta]}]]//GammaContract


(* ::Text:: *)
(* (n-2j)[(n - 2j)^4+(-6n+8)(n-2j)^2+3n(n-2)] for a1, a2, a3, a4. Amount indexes 4, no more.*)


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma],\[Delta],\[Alpha]}]**GammaProd[{a1}]**GammaProd[{\[Alpha],\[Delta],\[Gamma],\[Beta]}]]//GammaContract


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma],\[Delta],\[Alpha]}]**GammaProd[{a1,a2}]**GammaProd[{\[Alpha],\[Delta],\[Gamma],\[Beta]}]]//GammaContract


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma],\[Delta],\[Alpha]}]**GammaProd[{a1,a2,a3}]**GammaProd[{\[Alpha],\[Delta],\[Gamma],\[Beta]}]]//GammaContract


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma],\[Delta],\[Alpha]}]**GammaProd[{a1,a2,a3,a4}]**GammaProd[{\[Alpha],\[Delta],\[Gamma],\[Beta]}]]//GammaContract


(* ::Text:: *)
(*(n - 2 j)[(n - 2 j)^4 + (-10n + 20) (n - 2j)^2 + 15n^2 -50n+24] for a1, a2, a3, a4,a5. Amount indexes 4, no more.*)


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma],\[Delta],\[Alpha],\[Epsilon]}]**GammaProd[{a1}]**GammaProd[{\[Epsilon],\[Alpha],\[Delta],\[Gamma],\[Beta]}]]//GammaContract


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma],\[Delta],\[Alpha],\[Epsilon]}]**GammaProd[{a1,a2}]**GammaProd[{\[Epsilon],\[Alpha],\[Delta],\[Gamma],\[Beta]}]]//GammaContract


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma],\[Delta],\[Alpha],\[Epsilon]}]**GammaProd[{a1,a2,a3}]**GammaProd[{\[Epsilon],\[Alpha],\[Delta],\[Gamma],\[Beta]}]]//GammaContract


(* ::Input::Initialization:: *)
GammaExpand[GammaProd[{\[Beta],\[Gamma],\[Delta],\[Alpha],\[Epsilon]}]**GammaProd[{a1,a2,a3,a4}]**GammaProd[{\[Epsilon],\[Alpha],\[Delta],\[Gamma],\[Beta]}]]//GammaContract
