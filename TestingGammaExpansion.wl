(* ::Package:: *)

(* ::Code::Initialization:: *)
<<Gamma.m


(* ::Code::Initialization:: *)
DefManifold[M, 11,{a, b, c, d, e, f}];
DefMetric[-1, g[-a, -b], CD, {";", "\[Del]"}];
DefTensor[gamma[], M, PrintAs -> "\[CapitalGamma]"];


(* ::Code::Initialization:: *)
CombineListsGamma[neg_List, pos_List] := Join[-neg, pos];

TransDeltaGamma[expr_DeltaGamma] := Gdelta @@ CombineListsGamma[expr[[1]],expr[[2]]];
TransDeltaGamma[expr_] := expr;

ReplaceDeltaGamma[expr_DeltaGamma] := TransDeltaGamma[expr];
ReplaceDeltaGamma[expr_] := Head[expr] @@ ReplaceDeltaGamma /@ List @@ expr;


(* ::Code::Initialization:: *)
TransGammaProd[expr_GammaProd] := Times @@ ((gamma@@-#)& /@ (List @@ expr));
TransGammaProd[expr_GammaProd] := expr;

ReplaceGammaProd[expr_GammaProd] := TransGammaProd[expr];
ReplaceGammaProd[expr_] := Head[expr] @@ ReplaceGammaProd /@ List @@ expr;

ReplaceGammaProd[GammaExpand @ GammaProd[{a,b},{c,d}]] // InputForm


(* ::Code::Initialization:: *)
SelectNegativeSymbols[l_] := Select[l, (Characters@ToString@#)[[1]] == "-"&];
SelectPositiveSymbols[l_] := Select[l, (Characters@ToString@#)[[1]]!="-"&];

TransGdelta[expr_Gdelta | expr_delta] := DeltaGamma[
  -SelectNegativeSymbols[List @@ expr], SelectPositiveSymbols[List @@ expr]
];
TransGDelta[expr_] := expr;

ReplaceGdelta[expr_Gdelta | expr_delta] := TransGdelta[expr];
ReplaceGDelta[expr_] := Head[expr] @@ ReplaceGdelta /@ List @@ expr;


(* ::Code::Initialization:: *)
TransGamma[expr_Gamma] := GammaProd[-List @@ expr];
TransGamma[expr_] := expr;

ReplaceGamma[expr_gamma] := TransGamma[expr];
ReplaceGamma[expr_] := Head[expr] @@ ReplaceGamma /@ List @@ expr;
