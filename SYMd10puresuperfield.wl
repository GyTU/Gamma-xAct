(* ::Package:: *)

(* ::Title:: *)
(*SYM en D=10, utilizando espinores puros*)


(* ::Input::Initialization:: *)
<<"/Users/usuariomac/Documents/Wolfram Mathematica/Package/Ulf Gran/GAMMA.m";


(* ::Input::Initialization:: *)
SetDim[10]
SetSpinorDim[16]


(* ::Section:: *)
(*1. Expansion del supercampo*)


(* ::Input:: *)
(*ExpSuperfield[k_,h_]:=Sum[Product[Superscript[Superscript[\[Lambda],Subscript[\[Alpha], n]],\[Mu]],{n,i}]Product[Superscript[\[Theta],Subscript[\[Beta], n]],{n,j}]Superscript[Subscript[A,Product[Subscript[\[Alpha], n],{n,i}]Product[Subscript[\[Beta], m],{m,j}]],{i,j}][x],{i,0,k},{j,0,h}]*)


(* ::Item:: *)
(*ejemplo 1*)


(* ::Input:: *)
(*ExpSuperfield[3,5]*)


(* ::Input:: *)
(*ExpSuperfieldLocal[i_,j_]:=*)
(*Product[Superscript[Superscript[\[Lambda],Subscript[\[Alpha], n]],\[Mu]],{n,i}]Product[Superscript[\[Theta],Subscript[\[Beta], n]],{n,j}]Superscript[Subscript[A,Product[Subscript[\[Alpha], n],{n,i}]Product[Subscript[\[Beta], m],{m,j}]],{i,j}][x]*)


(* ::Item:: *)
(*ejemplo 2*)


(* ::Input:: *)
(*ExpSuperfieldLocal[3,5]*)


(* ::Subsection:: *)
(*Expansion del campo en t\[EAcute]rminos de \[Theta]*)


(* ::Input:: *)
(*Expfield[q_]:=Sum[Product[Superscript[\[Theta],Subscript[b, m]],{m,j}]*)
(*Superscript[Subscript[a,a Product[Subscript[b, m],{m,j}]],{j}][x],{j,0,q}]*)


(* ::Item:: *)
(*ejemplo 3*)


(* ::Input:: *)
(*Expfield[3]*)


(* ::Input:: *)
(*Expfieldlocal[j_]:=*)
(*Product[Superscript[\[Theta],Subscript[b, m]],{m,j}]Superscript[Subscript[a,a Product[Subscript[b, m],{m,j}]],{j}][x]*)


(* ::Item:: *)
(*ejemplo 4*)


(* ::Input:: *)
(*Expfieldlocal[3]*)


(* ::Subsection:: *)
(*Param\[EAcute]tro de gauge*)


(* ::Input:: *)
(*\[CapitalLambda][r_]:=Sum[Product[Superscript[\[Theta],Subscript[b, m]],{m,j}]*)
(*Superscript[Subscript[\[CapitalLambda],Product[Subscript[b, m],{m,j}]],{j}][x],{j,0,r}]*)


(* ::Item:: *)
(*ejemplo 5*)


(* ::Input:: *)
(*\[CapitalLambda][3]*)


(* ::Section:: *)
(*2. Identidades de las matrices Gamma*)


(* ::Item:: *)
(*Identidad 1*)


(* ::Input:: *)
(*GammaExpand@GammaExpand@*)
(*GammaExpand[GammaProd[{m1,m2,m3},{n1,n2,n3}]]**TensorSpinor[m,{m1,m2,m3}];*)


(* ::Input:: *)
(*GammaExtract[%,{n1,n2,n3}]*)


(* ::Input:: *)
(*(1/2)GammaTrace[GammaProd[{m1,m2,m3},{n1,n2,n3}],{n1,n2,n3}]**TensorSpinor[m,{m1,m2,m3}]*)


(* ::Item:: *)
(*Identidad 2*)


(* ::Input:: *)
(*GammaExpand@GammaExpand@GammaExpand@GammaExpand[GammaProd[{m1,m2,m3},{n1,n2,n3},{m1}]]**TensorSpinor[r,{m2,m3}];*)


(* ::Input:: *)
(*GammaExtract[%,{n1,n2,n3}]*)


(* ::Input:: *)
(*GammaTrace[GammaProd[{m1,m2,m3},{n1,n2,n3}],{n1,n2,n3}]GammaProd[{n1}]**TensorSpinor[r,{n2,n3}]*)


(* ::Item:: *)
(*Identidad 3*)


(* ::Input:: *)
(*GammaExpand@GammaExpand@*)
(*GammaExpand[GammaProd[{m1,m2,m3},{n1,n2,n3},{m1,m2}]]**TensorSpinor[r,{m3}];*)


(* ::Input:: *)
(*GammaExtract[%,{n1,n2,n3}]*)


(* ::Input:: *)
(*(1/2)GammaTrace[GammaProd[{m1,m2,m3},{n1,n2,n3}],{n1,n2,n3}]GammaProd[{n1,n2}]**TensorSpinor[r,{n3}]*)


(* ::Item:: *)
(*Identidad 4*)


(* ::Input:: *)
(*GammaExpand@GammaExpand@GammaExpand[GammaProd[{m1,m2,m3},{n1,n2,n3},{m1,m2,m3}]]**Tensor[r,{}]*)


(* ::Input:: *)
(*(1/2)GammaTrace[GammaProd[{m1,m2,m3},{n1,n2,n3}],{n1,n2,n3}]GammaProd[{n1,n2,n3}]**TensorSpinor[r,{n3}]*)


(* ::Item:: *)
(*Identidad 5*)


(* ::Input:: *)
(*GammaExpand@GammaExpand@*)
(*GammaExpand[GammaProd[{m1,m2,m3},{n1,n2,n3,n4,n5}]]***)
(*TensorSpinor[k,{m1,m2,m3}];*)


(* ::Input:: *)
(*GammaExtract[%,{n1,n2,n3,n4,n5}]*)


(* ::Item:: *)
(*Identidad 6*)


(* ::Input:: *)
(*GammaExpand@GammaExpand@GammaExpand[GammaProd[{m1,m2,m3},{n1,n2,n3,n4,n5},{m1,m2}]]***)
(*TensorSpinor[s,{m3}];*)


(* ::Input:: *)
(*GammaExtract[%,{n1,n2,n3,n4,n5}]*)


(* ::Item:: *)
(*Identidad 7*)


(* ::Input:: *)
(*GammaExpand@GammaExpand@GammaExpand[GammaProd[{m1,m2,m3},{n1,n2,n3,n4,n5},{m1,m2,m3}]]***)
(*Tensor[s,{}];*)


(* ::Input:: *)
(*GammaExtract[%,{n1,n2,n3,n4,n5}]*)
