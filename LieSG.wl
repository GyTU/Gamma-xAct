(* ::Package:: *)

(* ::Input::Initialization:: *)
<<LieArt.m


(* ::Title:: *)
(*Cohomolog\[IAcute]a espinorial (Cederwall, Nilsson, Tsimpis)*)


(* ::Subsection:: *)
(*The c\[OAcute]digo de Lie (M. Cederwall)*)


(* ::Item:: *)
(*SYM en D=10 calcula el contenido de los supercampos*)


(* ::Input:: *)
(*s=Irrep[D][0,0,0,0,1];*)
(*ra[n_]:=Irrep[D][0,0,0,n,0];*)
(*s=Irrep[D][0,0,0,0,1];*)
(*r[m_,n_]:=If[n==0, r[m],If[n<0,PolynomialQ[ra,Rank[Irrep[D][0,0,0,0,1]]],If[m<0,PolynomialQ[ra,Rank[Irrep[D][0,0,0,0,1]]],DecomposeProduct[ra[m],TensorProduct[n,s]]]]]*)


(* ::Text:: *)
(*Mejora de la ecuaci\[OAcute]n anterior*)


(* ::Input:: *)
(*r[m_,n_]:=Module[{s,ra},*)
(*s=Irrep[D][0,0,0,0,1];*)
(*ra[p_]:=Irrep[D][0,0,0,p,0];*)
(*s=Irrep[D][0,0,0,0,1];*)
(*If[n==0, r[m],If[n<0,If[m<0,DecomposeProduct[ra[m],TensorProduct[n,s]]]]]*)
(*];*)
(**)


(* ::Item:: *)
(*SG en D=11, construcci\[OAcute]n de Irrep r(n)*)


(* ::Input:: *)
(*r[n_]:=Module[{q,ran,s},*)
(*ran=Rank[Irrep[B][0,0,0,0,1]];*)
(*s=Irrep[B][0,0,0,0,1];*)
(*q=Exponent[ran,x];*)
(*If[Mod[n,2]==0,*)
(* For[i=0,i<=(n/2),i++,Print[q=q+Irrep[B][1,i,0,0,n-2*i]//StandardForm]]];*)
(*If[Mod[n,2]==1,For[i=0,i<= ((n-1)/2),i++,Print[q=q+Irrep[B][1,i,0,0,n-2*i]//StandardForm]]]*)
(*];*)


(* ::Item:: *)
(*Tensores de SG en D=11, construcci\[OAcute]n de Irrep r(n)*)


(* ::Input:: *)
(*r[n_]:=Module[{q,ran,s},*)
(*ran=Rank[Irrep[B][0,0,0,0,1]];*)
(*s=Irrep[B][0,0,0,0,1];*)
(*q=Exponent[ran,x];*)
(*If[Mod[n,2]==0,*)
(* For[i=0,i<=(n/2),i++,Print[q=q+Irrep[B][0,i,0,0,n-2*i]//StandardForm]]];*)
(*If[Mod[n,2]==1,For[i=0,i<= ((n-1)/2),i++,Print[q=q+Irrep[B][0,i,0,0,n-2*i]//StandardForm]]]*)
(*];*)
