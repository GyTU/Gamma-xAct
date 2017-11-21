(* ::Package:: *)

(* ::Input:: *)
(*Needs["xAct`xPert`"];*)


(* ::Input:: *)
(*$DefInfoQ=False;*)


(* ::Item:: *)
(*El primer paso es definir la variedad, para  nuestro caso esta se encuentra definida en 4d *)


(* ::Input:: *)
(*DefManifold[M4,4,IndexRange[a,f]]*)


(* ::Item:: *)
(*Despu\[EAcute]s definimos la m\[EAcute]trica y el s\[IAcute]mbolo de la derivada covariante (CD), para nuesto caso el signo de la m\[EAcute]trica es negativa*)


(* ::Input:: *)
(*DefMetric[-1,g[-a,-b],CD]*)


(* ::Item:: *)
(*Tambi\[EAcute]n podemos definir tensores en la configuraci\[OAcute]n de la variedad,*)


(* ::Input:: *)
(*DefTensor[\[Gamma][],M4]*)
(*DefTensor[\[Chi][],M4]*)


(* ::Input:: *)
(*DefParameter[\[Epsilon]]*)


(* ::Item:: *)
(*Definimos las reglas de los productos *)


(* ::Input:: *)
(*\[Gamma]/:VarD[g[a_,b_],PD][\[Gamma][],rest_]:=-rest g[-a,-b]\[Gamma][]\[Chi][]*)
(*\[Chi]/:PD[a_][\[Chi][]]:=I/2Module[{c,d},\[Chi][]g[c,d]PD[a][g[-c,-d]]]\[Gamma][]*)


(* ::Item:: *)
(*En especifico, nos interesa obtener la variaci\[OAcute]n de la acci\[OAcute]n del tensor de Maxwell, para esto aplicamos la expansi\[OAcute]n en t\[EAcute]rminos del tensor A*)


(* ::Input:: *)
(*DefTensor[MaxwellA[-a],M4,PrintAs->"A"]*)


(* ::Input:: *)
(*DefTensor[MaxwellF[-a,-b],M4,Antisymmetric[{1,2}],PrintAs->"F"]*)


(* ::Item:: *)
(*Definido a partir de la relaci\[OAcute]n*)


(* ::Input:: *)
(*MaxwellF[a_,b_]:=PD[a][MaxwellA[b]]-PD[b][MaxwellA[a]]*)


(* ::Item:: *)
(*Escribimos la acci\[OAcute]n *)


(* ::Input:: *)
(*g[a,b]g[c,d]MaxwellF[-a,-c]MaxwellF[-b,-d]/4*)


(* ::Input:: *)
(*Unprotect[NonCommutativeMultiply];*)


(* ::Item:: *)
(*Por \[UAcute]ltimo realizamos la variaci\[OAcute]n y se obtiene*)


(* ::Input:: *)
(*VarD[MaxwellA[a],PD][\[Gamma][]\[Chi][]%]*)
